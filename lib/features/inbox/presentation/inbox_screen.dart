import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:transport_minister/app/router/app_route.dart';
import 'package:transport_minister/core/design/design_system.dart';
import 'package:transport_minister/core/design/mascot/mr_bus.dart';
import 'package:transport_minister/core/design/mascot/mr_bus_says.dart';
import 'package:transport_minister/core/time/clock_providers.dart';
import 'package:transport_minister/features/inbox/application/inbox_controller.dart';
import 'package:transport_minister/features/inbox/domain/inbox.dart';
import 'package:transport_minister/features/inbox/presentation/notification_texts.dart';
import 'package:transport_minister/l10n/generated/app_localizations.dart';

class InboxScreen extends ConsumerStatefulWidget {
  const InboxScreen({super.key});

  @override
  ConsumerState<InboxScreen> createState() => _InboxScreenState();
}

class _InboxScreenState extends ConsumerState<InboxScreen> {
  late final List<int> _unreadOnOpen;

  @override
  void initState() {
    super.initState();
    final items = ref.read(inboxProvider).value?.items ?? const <GameNotification>[];
    _unreadOnOpen = [
      for (final item in items)
        if (!item.read) item.id,
    ];
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => ref.read(inboxProvider.notifier).markAllRead(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final items = ref.watch(inboxProvider).value?.items ?? const <GameNotification>[];
    final now = ref.watch(nowProvider)();
    return Scaffold(
      body: GameBackdrop(
        child: Column(
          children: [
            GameTopBar(
              title: l10n.inboxTitle,
              backLabel: l10n.commonBack,
              onBack: () => context.canPop() ? context.pop() : context.go(AppRoute.cities.path),
            ),
            Expanded(
              child: items.isEmpty
                  ? Padding(
                      padding: const EdgeInsets.all(GameDimens.spaceXL),
                      child: Center(
                        child: MrBusSays(message: l10n.inboxEmpty, mood: MrBusMood.thinking),
                      ),
                    )
                  : ListView.separated(
                      padding: const EdgeInsets.fromLTRB(
                        GameDimens.spaceL,
                        GameDimens.spaceS,
                        GameDimens.spaceL,
                        GameDimens.spaceXXL,
                      ),
                      itemCount: items.length,
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: GameDimens.spaceS),
                      itemBuilder: (context, index) {
                        final item = items[index];
                        final fresh = _unreadOnOpen.contains(item.id);
                        return ChunkyCard(
                          depth: 3,
                          color: fresh ? ChunkyPalette.sunny.glow : GameColors.paper,
                          padding: const EdgeInsets.all(GameDimens.spaceM),
                          child: Row(
                            children: [
                              IconBubble(icon: item.icon, palette: item.palette, size: 40),
                              const SizedBox(width: GameDimens.spaceM),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item.message(l10n),
                                      style: Theme.of(context).textTheme.titleSmall,
                                    ),
                                    const SizedBox(height: 2),
                                    Text(
                                      timeAgo(l10n, now, item.createdAtMs),
                                      style: Theme.of(context).textTheme.bodySmall,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
