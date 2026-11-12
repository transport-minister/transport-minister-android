import 'dart:math' as math;

import 'package:material_ui/material_ui.dart';
import 'package:transport_minister/core/design/design_system.dart';
import 'package:transport_minister/core/simulation/catalog/district_catalog.dart';
import 'package:transport_minister/core/simulation/model/city_metrics.dart';
import 'package:transport_minister/core/simulation/model/city_state.dart';
import 'package:transport_minister/features/city_game/presentation/district_presentation.dart';
import 'package:transport_minister/features/dashboard/presentation/widgets/city_map_painter.dart';
import 'package:transport_minister/features/dashboard/presentation/widgets/metro_painter.dart';
import 'package:transport_minister/l10n/generated/app_localizations.dart';

class CityMapController extends ChangeNotifier {
  DistrictId? _focus;

  DistrictId? get focus => _focus;

  void focusOn(DistrictId district) {
    _focus = district;
    notifyListeners();
  }

  void recenter() {
    _focus = null;
    notifyListeners();
  }
}

class CityMap extends StatefulWidget {
  const CityMap({
    super.key,
    required this.city,
    required this.metrics,
    required this.controller,
    required this.onDistrictPressed,
  });

  final CityState city;
  final CityMetrics metrics;
  final CityMapController controller;
  final ValueChanged<DistrictId> onDistrictPressed;

  @override
  State<CityMap> createState() => _CityMapState();
}

class _CityMapState extends State<CityMap> with TickerProviderStateMixin {
  static const _focusScale = 1.05;
  static const _maxScale = 1.6;
  static const _homeCrop = 0.92;

  late final _traffic = AnimationController(vsync: this, duration: const Duration(seconds: 24));
  late final _camera = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 450),
  );
  final _transform = TransformationController();
  Size _viewport = Size.zero;
  Animation<Matrix4>? _flight;

  double get _minScale =>
      math.max(_viewport.width / CityWorld.size.width, _viewport.height / CityWorld.size.height);

  double get _homeScale => (_viewport.width / (CityWorld.districtBounds.width * _homeCrop))
      .clamp(_minScale, 0.9)
      .toDouble();

  Matrix4 get _home => _insideWorld(_cameraOn(CityWorld.districtBounds.center, _homeScale));

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_onControllerChanged);
    _camera.addListener(() => _transform.value = _flight!.value);
  }

  @override
  void didUpdateWidget(CityMap oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.controller != widget.controller) {
      oldWidget.controller.removeListener(_onControllerChanged);
      widget.controller.addListener(_onControllerChanged);
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (MediaQuery.disableAnimationsOf(context)) {
      _traffic.stop();
    } else if (!_traffic.isAnimating) {
      _traffic.repeat();
    }
  }

  @override
  void dispose() {
    widget.controller.removeListener(_onControllerChanged);
    _traffic.dispose();
    _camera.dispose();
    _transform.dispose();
    super.dispose();
  }

  Matrix4 _cameraOn(Offset worldPoint, double scale) {
    return Matrix4.identity()
      ..translateByDouble(
        _viewport.width / 2 - worldPoint.dx * scale,
        _viewport.height / 2 - worldPoint.dy * scale,
        0,
        1,
      )
      ..scaleByDouble(scale, scale, scale, 1);
  }

  void _onControllerChanged() {
    final focus = widget.controller.focus;
    _flyTo(focus == null ? _home : _cameraOn(focus.worldCenter, _focusScale));
  }

  void _flyTo(Matrix4 target) {
    _flight = Matrix4Tween(
      begin: _transform.value,
      end: _insideWorld(target),
    ).animate(CurvedAnimation(parent: _camera, curve: Curves.easeInOutCubic));
    _camera.forward(from: 0);
  }

  Matrix4 _insideWorld(Matrix4 camera) {
    final scale = camera.getMaxScaleOnAxis();
    final translation = camera.getTranslation();
    final minX = math.min(_viewport.width - CityWorld.size.width * scale, 0.0);
    final minY = math.min(_viewport.height - CityWorld.size.height * scale, 0.0);
    return Matrix4.identity()
      ..translateByDouble(translation.x.clamp(minX, 0.0), translation.y.clamp(minY, 0.0), 0, 1)
      ..scaleByDouble(scale, scale, scale, 1);
  }

  void _pressAt(Offset worldPosition) {
    for (final district in DistrictId.values) {
      if ((worldPosition - district.worldCenter).distance <= district.worldRadius * 1.05) {
        widget.onDistrictPressed(district);
        return;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final sites = {
      for (final project in widget.city.projects)
        if (project.districtId != null) project.districtId!,
    };
    final buses = math.min(math.max(widget.city.activeBuses.length ~/ 2, 3), 18);
    final l10n = AppLocalizations.of(context);
    return LayoutBuilder(
      builder: (context, constraints) {
        final viewport = constraints.biggest;
        if (_viewport != viewport) {
          final first = _viewport == Size.zero;
          _viewport = viewport;
          if (first) {
            _transform.value = _home;
          }
        }
        return Stack(
          children: [
            InteractiveViewer(
              transformationController: _transform,
              constrained: false,
              minScale: _minScale,
              maxScale: _maxScale,
              child: GestureDetector(
                onTapUp: (details) => _pressAt(details.localPosition),
                child: SizedBox.fromSize(
                  size: CityWorld.size,
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: CustomPaint(
                          painter: CityMapPainter(
                            metrics: widget.metrics,
                            constructionSites: sites,
                          ),
                        ),
                      ),
                      Positioned.fill(
                        child: CustomPaint(
                          painter: MetroPainter(progress: _traffic, lines: widget.city.metroLines),
                        ),
                      ),
                      Positioned.fill(
                        child: CustomPaint(
                          painter: TrafficPainter(
                            progress: _traffic,
                            metrics: widget.metrics,
                            buses: buses,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            AnimatedBuilder(
              animation: _transform,
              builder: (context, _) => Stack(
                children: [
                  for (final district in DistrictId.values)
                    _positionedMarker(district, sites.contains(district)),
                ],
              ),
            ),
            Positioned(
              right: GameDimens.spaceS,
              bottom: GameDimens.spaceS,
              child: ChunkyIconButton(
                icon: Icons.center_focus_strong_rounded,
                size: 40,
                semanticsLabel: l10n.mapRecenter,
                onPressed: widget.controller.recenter,
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _positionedMarker(DistrictId district, bool underConstruction) {
    final point = MatrixUtils.transformPoint(_transform.value, district.worldCenter);
    return Positioned(
      left: point.dx - DistrictMarker.width / 2,
      top: point.dy - DistrictMarker.bubble / 2,
      child: DistrictMarker(
        district: district,
        metrics: widget.metrics.of(district),
        underConstruction: underConstruction,
        onPressed: () => widget.onDistrictPressed(district),
      ),
    );
  }
}

class DistrictMarker extends StatelessWidget {
  const DistrictMarker({
    super.key,
    required this.district,
    required this.metrics,
    required this.underConstruction,
    required this.onPressed,
  });

  final DistrictId district;
  final DistrictMetrics metrics;
  final bool underConstruction;
  final VoidCallback onPressed;

  static const width = 120.0;
  static const bubble = 44.0;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final name = district.displayName(l10n);
    final waiting = metrics.waitingMinutes.round();
    return PressableBuilder(
      onPressed: onPressed,
      semanticsLabel: name,
      builder: (context, pressed) => AnimatedScale(
        scale: pressed ? 0.92 : 1,
        duration: GameDimens.pressDuration,
        child: SizedBox(
          width: width,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  IconBubble(icon: district.icon, palette: district.palette, size: bubble),
                  if (underConstruction)
                    const Positioned(
                      right: -12,
                      bottom: -4,
                      child: IconBubble(
                        icon: Icons.construction_rounded,
                        palette: ChunkyPalette.tangerine,
                        size: 24,
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 3),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
                decoration: BoxDecoration(
                  color: GameColors.paper,
                  borderRadius: BorderRadius.circular(9),
                  border: Border.all(color: GameColors.ink, width: GameDimens.outlineThin),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        name,
                        maxLines: 1,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          height: 1.1,
                        ),
                      ),
                    ),
                    const SizedBox(height: 2),
                    WaitChip(minutes: waiting, label: l10n.statMinutes(waiting)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class WaitChip extends StatelessWidget {
  const WaitChip({super.key, required this.minutes, required this.label});

  final int minutes;
  final String label;

  static ChunkyPalette paletteFor(int minutes) {
    if (minutes <= 8) {
      return ChunkyPalette.green;
    }
    return minutes <= 15 ? ChunkyPalette.sunny : ChunkyPalette.coral;
  }

  @override
  Widget build(BuildContext context) {
    final palette = paletteFor(minutes);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
      decoration: BoxDecoration(color: palette.face, borderRadius: BorderRadius.circular(7)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.schedule_rounded, size: 11, color: palette.onFace),
          const SizedBox(width: 2),
          Text(
            label,
            style: TextStyle(
              fontSize: 10.5,
              fontWeight: FontWeight.w700,
              height: 1.1,
              color: palette.onFace,
            ),
          ),
        ],
      ),
    );
  }
}
