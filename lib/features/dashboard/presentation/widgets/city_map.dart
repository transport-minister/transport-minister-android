import 'dart:math' as math;

import 'package:material_ui/material_ui.dart';
import 'package:transport_minister/core/design/design_system.dart';
import 'package:transport_minister/core/simulation/catalog/district_catalog.dart';
import 'package:transport_minister/core/simulation/model/city_metrics.dart';
import 'package:transport_minister/core/simulation/model/city_state.dart';
import 'package:transport_minister/features/city_game/presentation/district_presentation.dart';
import 'package:transport_minister/features/dashboard/presentation/widgets/city_map_painter.dart';
import 'package:transport_minister/l10n/generated/app_localizations.dart';

class CityMap extends StatefulWidget {
  const CityMap({
    super.key,
    required this.city,
    required this.metrics,
    required this.onDistrictPressed,
  });

  final CityState city;
  final CityMetrics metrics;
  final ValueChanged<DistrictId> onDistrictPressed;

  @override
  State<CityMap> createState() => _CityMapState();
}

class _CityMapState extends State<CityMap> with SingleTickerProviderStateMixin {
  late final _traffic = AnimationController(vsync: this, duration: const Duration(seconds: 16));

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
    _traffic.dispose();
    super.dispose();
  }

  void _pressAt(Offset position, Size size) {
    for (final district in DistrictId.values) {
      final center = Offset(
        district.mapCenter.dx * size.width,
        district.mapCenter.dy * size.height,
      );
      if ((position - center).distance <= district.mapRadius * size.width * 1.1) {
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
    final buses = math.min(math.max(widget.city.activeBuses.length ~/ 2, 3), 16);
    return LayoutBuilder(
      builder: (context, constraints) {
        final size = constraints.biggest;
        return Stack(
          children: [
            Positioned.fill(
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTapUp: (details) => _pressAt(details.localPosition, size),
                child: CustomPaint(
                  painter: CityMapPainter(metrics: widget.metrics, constructionSites: sites),
                ),
              ),
            ),
            Positioned.fill(
              child: IgnorePointer(
                child: CustomPaint(
                  painter: TrafficPainter(progress: _traffic, buses: buses),
                ),
              ),
            ),
            for (final district in DistrictId.values)
              Positioned(
                left: district.mapCenter.dx * size.width - _DistrictMarker.width / 2,
                top: district.mapCenter.dy * size.height - _DistrictMarker.bubble / 2 - 6,
                child: _DistrictMarker(
                  district: district,
                  metrics: widget.metrics.of(district),
                  underConstruction: sites.contains(district),
                  onPressed: () => widget.onDistrictPressed(district),
                ),
              ),
          ],
        );
      },
    );
  }
}

class _DistrictMarker extends StatelessWidget {
  const _DistrictMarker({
    required this.district,
    required this.metrics,
    required this.underConstruction,
    required this.onPressed,
  });

  final DistrictId district;
  final DistrictMetrics metrics;
  final bool underConstruction;
  final VoidCallback onPressed;

  static const width = 104.0;
  static const bubble = 46.0;

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
                  Positioned(
                    right: -22,
                    top: -6,
                    child: _WaitChip(minutes: waiting, label: l10n.statMinutes(waiting)),
                  ),
                  if (underConstruction)
                    const Positioned(
                      left: -14,
                      bottom: -4,
                      child: IconBubble(
                        icon: Icons.construction_rounded,
                        palette: ChunkyPalette.tangerine,
                        size: 24,
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 4),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: GameColors.paper,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: GameColors.ink, width: GameDimens.outlineThin),
                ),
                child: Text(
                  name,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 11.5, fontWeight: FontWeight.w700, height: 1.1),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _WaitChip extends StatelessWidget {
  const _WaitChip({required this.minutes, required this.label});

  final int minutes;
  final String label;

  @override
  Widget build(BuildContext context) {
    final palette = minutes <= 8
        ? ChunkyPalette.green
        : (minutes <= 15 ? ChunkyPalette.sunny : ChunkyPalette.coral);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
      decoration: BoxDecoration(
        color: palette.face,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: GameColors.ink, width: GameDimens.outlineThin),
      ),
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
