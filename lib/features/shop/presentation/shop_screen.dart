import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:transport_minister/core/design/design_system.dart';
import 'package:transport_minister/core/design/mascot/mr_bus.dart';
import 'package:transport_minister/core/design/mascot/mr_bus_says.dart';
import 'package:transport_minister/features/city_selection/domain/city.dart';
import 'package:transport_minister/features/diamonds/presentation/diamonds_sheet.dart';
import 'package:transport_minister/features/progression/application/profile_controller.dart';
import 'package:transport_minister/features/shop/application/shop_providers.dart';
import 'package:transport_minister/features/shop/domain/diamond_pack.dart';
import 'package:transport_minister/features/shop/domain/diamond_store.dart';
import 'package:transport_minister/l10n/generated/app_localizations.dart';

extension DiamondPackText on DiamondPack {
  String label(AppLocalizations l10n) => switch (this) {
    DiamondPack.starter => l10n.shopStarterTitle,
    DiamondPack.handful => l10n.shopPackHandful,
    DiamondPack.bag => l10n.shopPackBag,
    DiamondPack.chest => l10n.shopPackChest,
  };

  String? tag(AppLocalizations l10n) => switch (this) {
    DiamondPack.bag => l10n.shopPopular,
    DiamondPack.chest => l10n.shopBestValue,
    DiamondPack.starter || DiamondPack.handful => null,
  };

  IconData get icon => switch (this) {
    DiamondPack.starter => Icons.rocket_launch_rounded,
    DiamondPack.handful => Icons.diamond_rounded,
    DiamondPack.bag => Icons.shopping_bag_rounded,
    DiamondPack.chest => Icons.inventory_2_rounded,
  };

  ChunkyPalette get palette => switch (this) {
    DiamondPack.starter => ChunkyPalette.sunny,
    DiamondPack.handful => ChunkyPalette.gem,
    DiamondPack.bag => ChunkyPalette.ocean,
    DiamondPack.chest => ChunkyPalette.grape,
  };
}

class ShopScreen extends ConsumerWidget {
  const ShopScreen({super.key, required this.cityId});

  final CityId cityId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final textTheme = Theme.of(context).textTheme;
    final profile = ref.watch(profileProvider).value;
    final offers = ref.watch(storeOffersProvider);
    final available = offers.value ?? const <StoreOffer>[];
    final packs = [
      for (final pack in DiamondPack.values)
        if (!pack.once || !(profile?.packsBought.contains(pack) ?? false)) pack,
    ];
    return Scaffold(
      body: GameBackdrop(
        child: Column(
          children: [
            GameTopBar(
              title: l10n.shopTitle,
              backLabel: l10n.commonBack,
              onBack: () => context.pop(),
              trailing: [
                StatPill(
                  icon: DiamondStyle.icon,
                  value: '${profile?.diamonds ?? 0}',
                  palette: DiamondStyle.palette,
                ),
              ],
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.fromLTRB(
                  GameDimens.spaceL,
                  GameDimens.spaceS,
                  GameDimens.spaceL,
                  GameDimens.spaceXXL,
                ),
                children: [
                  if (!offers.isLoading && available.isEmpty) ...[
                    MrBusSays(
                      mood: MrBusMood.worried,
                      message: l10n.shopUnavailable,
                      mascotSize: 56,
                    ),
                    const SizedBox(height: GameDimens.spaceM),
                  ],
                  for (final pack in packs) ...[
                    _PackCard(
                      pack: pack,
                      price: available
                          .where((offer) => offer.pack == pack)
                          .map((offer) => offer.price)
                          .firstOrNull,
                      onBuy: () => _buy(context, ref, pack),
                    ),
                    const SizedBox(height: GameDimens.spaceM),
                  ],
                  const SizedBox(height: GameDimens.spaceS),
                  Text(l10n.shopEarnTitle, style: textTheme.titleLarge),
                  const SizedBox(height: GameDimens.spaceS),
                  const DiamondMineCard(),
                  EarningsBoostCard(cityId: cityId),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _buy(BuildContext context, WidgetRef ref, DiamondPack pack) async {
    final outcome = await ref.read(shopProvider).buy(pack, city: cityId);
    if (!context.mounted || outcome == PurchaseOutcome.cancelled) {
      return;
    }
    final l10n = AppLocalizations.of(context);
    final delivered = outcome == PurchaseOutcome.delivered;
    await showChunkySheet<void>(
      context: context,
      builder: (context) => Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          MrBusSays(
            mood: delivered ? MrBusMood.excited : MrBusMood.worried,
            title: delivered ? l10n.shopThanksTitle : l10n.shopFailedTitle,
            message: delivered ? l10n.shopThanksBody(pack.diamonds) : l10n.shopFailedBody,
          ),
          const SizedBox(height: GameDimens.spaceXL),
          ChunkyButton(
            label: l10n.commonGotIt,
            palette: delivered ? ChunkyPalette.green : ChunkyPalette.snow,
            expanded: true,
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }
}

class _PackCard extends StatelessWidget {
  const _PackCard({required this.pack, required this.price, required this.onBuy});

  final DiamondPack pack;
  final String? price;
  final VoidCallback onBuy;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final textTheme = Theme.of(context).textTheme;
    final tag = pack.tag(l10n);
    return ChunkyCard(
      depth: 3,
      color: pack.once ? pack.palette.glow.withValues(alpha: 0.4) : GameColors.paper,
      padding: const EdgeInsets.all(GameDimens.spaceM),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconBubble(icon: pack.icon, palette: pack.palette, size: 46),
              const SizedBox(width: GameDimens.spaceM),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(child: Text(pack.label(l10n), style: textTheme.titleMedium)),
                        if (tag != null) GameTag(label: tag, palette: ChunkyPalette.coral),
                      ],
                    ),
                    if (pack.once)
                      Text(
                        l10n.shopStarterBody(pack.diamonds, pack.boostMinutes),
                        style: textTheme.bodySmall,
                      ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: GameDimens.spaceS),
          Row(
            children: [
              GameTag(
                label: l10n.diamondsPlus(pack.diamonds),
                palette: DiamondStyle.palette,
                icon: DiamondStyle.icon,
              ),
              const SizedBox(width: GameDimens.spaceS),
              Expanded(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: ChunkyButton(
                    label: price ?? l10n.shopSoon,
                    icon: Icons.shopping_cart_rounded,
                    palette: pack.once ? ChunkyPalette.sunny : ChunkyPalette.green,
                    size: ChunkySize.small,
                    onPressed: price == null ? null : onBuy,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
