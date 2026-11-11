import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:transport_minister/app/router/app_route.dart';
import 'package:transport_minister/core/design/design_system.dart';
import 'package:transport_minister/core/design/illustrations/bus_illustration.dart';
import 'package:transport_minister/core/design/widgets/sticker_text.dart';
import 'package:transport_minister/features/city_game/application/city_game_providers.dart';
import 'package:transport_minister/features/city_selection/domain/city.dart';
import 'package:transport_minister/l10n/generated/app_localizations.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> with SingleTickerProviderStateMixin {
  late final _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 2600),
  );
  late final _busDrive = CurvedAnimation(
    parent: _controller,
    curve: const Interval(0, 0.45, curve: Curves.easeOutBack),
  );
  late final _titlePop = CurvedAnimation(
    parent: _controller,
    curve: const Interval(0.2, 0.62, curve: Curves.elasticOut),
  );
  late final _taglineFade = CurvedAnimation(
    parent: _controller,
    curve: const Interval(0.45, 0.7, curve: Curves.easeOut),
  );
  late final _loading = CurvedAnimation(
    parent: _controller,
    curve: const Interval(0.25, 1, curve: Curves.easeInOut),
  );
  var _leaving = false;

  @override
  void initState() {
    super.initState();
    _controller
      ..addStatusListener(_onStatusChanged)
      ..forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onStatusChanged(AnimationStatus status) {
    if (status.isCompleted) {
      _continue();
    }
  }

  Future<void> _continue() async {
    if (_leaving || !mounted) {
      return;
    }
    _leaving = true;
    final city = await _resumableCity();
    if (!mounted) {
      return;
    }
    if (city == null) {
      context.go(AppRoute.cities.path);
    } else {
      context.goNamed(
        AppRoute.dashboard.name,
        pathParameters: {AppRoute.cityIdParameter: city.name},
      );
    }
  }

  Future<CityId?> _resumableCity() async {
    try {
      return await ref.read(resumableCityProvider.future);
    } on Object {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: _continue,
        child: GameBackdrop(
          style: BackdropStyle.sky,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: GameDimens.spaceXL),
              child: Column(
                children: [
                  const Spacer(flex: 3),
                  ScaleTransition(
                    scale: _titlePop,
                    child: Column(
                      children: [
                        StickerText(l10n.splashTitleTop, fontSize: 46),
                        StickerText(
                          l10n.splashTitleBottom,
                          fontSize: 58,
                          color: ChunkyPalette.sunny.face,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: GameDimens.spaceL),
                  FadeTransition(
                    opacity: _taglineFade,
                    child: Text(
                      l10n.appTagline,
                      textAlign: TextAlign.center,
                      style: textTheme.titleMedium?.copyWith(color: GameColors.inkSoft),
                    ),
                  ),
                  const Spacer(flex: 2),
                  AnimatedBuilder(
                    animation: _busDrive,
                    builder: (context, child) => FractionalTranslation(
                      translation: Offset((_busDrive.value - 1) * 2.5, 0),
                      child: child,
                    ),
                    child: const BusIllustration(palette: ChunkyPalette.green, width: 210),
                  ),
                  Container(
                    height: 10,
                    margin: const EdgeInsets.only(top: GameDimens.spaceXS),
                    decoration: BoxDecoration(
                      color: GameColors.ink,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  const Spacer(flex: 2),
                  AnimatedBuilder(
                    animation: _loading,
                    builder: (context, _) => ChunkyProgressBar(value: _loading.value, height: 22),
                  ),
                  const SizedBox(height: GameDimens.spaceS),
                  Text(l10n.splashLoading, style: textTheme.labelLarge),
                  const Spacer(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
