import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';
import 'package:transport_minister/features/city_game/application/city_game_providers.dart';
import 'package:transport_minister/features/city_selection/domain/city.dart';

class CityLifecycleScope extends ConsumerStatefulWidget {
  const CityLifecycleScope({super.key, required this.cityId, required this.child});

  final CityId cityId;
  final Widget child;

  @override
  ConsumerState<CityLifecycleScope> createState() => _CityLifecycleScopeState();
}

class _CityLifecycleScopeState extends ConsumerState<CityLifecycleScope> {
  late final AppLifecycleListener _listener;

  @override
  void initState() {
    super.initState();
    _listener = AppLifecycleListener(
      onPause: () => ref.read(cityGameProvider(widget.cityId).notifier).pause(),
      onResume: () => ref.read(cityGameProvider(widget.cityId).notifier).resume(),
    );
  }

  @override
  void dispose() {
    _listener.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.child;
}
