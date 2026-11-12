import 'package:material_ui/material_ui.dart';
import 'package:transport_minister/core/design/design_system.dart';
import 'package:transport_minister/core/formatting/money_format.dart';
import 'package:transport_minister/core/simulation/decisions/decision_effect.dart';
import 'package:transport_minister/core/simulation/model/active_modifier.dart';
import 'package:transport_minister/features/city_game/presentation/district_presentation.dart';
import 'package:transport_minister/features/city_game/presentation/simulation_texts.dart';
import 'package:transport_minister/features/decisions/presentation/decision_texts.dart';
import 'package:transport_minister/l10n/generated/app_localizations.dart';

enum EffectTone { good, bad, neutral }

class EffectChips extends StatelessWidget {
  const EffectChips({super.key, required this.effects, this.includeMoney = true});

  final List<DecisionEffect> effects;
  final bool includeMoney;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final shown = [
      for (final effect in effects)
        if (includeMoney || effect is! Spend) effect,
    ];
    return Wrap(
      spacing: 6,
      runSpacing: 6,
      children: [
        for (final effect in shown) ToneChip(label: describe(effect, l10n), tone: toneOf(effect)),
      ],
    );
  }

  static String _signed(num value) {
    final rounded = value.round();
    return rounded > 0 ? '+$rounded' : '$rounded';
  }

  static String _percent(double factor) => '${_signed((factor - 1) * 100)}%';

  static String describe(DecisionEffect effect, AppLocalizations l10n) {
    return switch (effect) {
      Spend(:final amount) => MoneyFormat.signed(-amount),
      Earn(:final amount) => MoneyFormat.signed(amount),
      Mood(:final group, :final delta) => l10n.effectMood(group.label(l10n), _signed(delta)),
      Reputation(:final delta) => l10n.effectReputation(_signed(delta)),
      RoadDamage(:final district, :final amount) => l10n.effectRoadDamage(
        amount.round(),
        district.displayName(l10n),
      ),
      RoadRestore(:final district) => l10n.effectRoadRestore(district.displayName(l10n)),
      Modify() => _modifier(effect, l10n),
      OrderBuses(:final count, :final model) => l10n.effectBuses(count, model.label(l10n)),
      LaunchProject(:final type, :final discount) =>
        discount > 0
            ? l10n.effectDiscount(type.label(l10n), (discount * 100).round())
            : l10n.effectProject(type.label(l10n)),
      LoseBuses(:final count) => l10n.effectLoseBuses(count),
      ChangeFare(:final delta) => l10n.effectFare(MoneyFormat.fare(delta)),
    };
  }

  static String _modifier(Modify effect, AppLocalizations l10n) {
    final value = effect.value;
    final base = switch (effect.type) {
      ModifierType.capacity => l10n.effectCapacity(_percent(value)),
      ModifierType.demand => l10n.effectDemand(_percent(value)),
      ModifierType.congestion => l10n.effectCongestion(_signed(value)),
      ModifierType.safety => l10n.effectSafety(_signed(value)),
      ModifierType.energyCost => l10n.effectEnergyCost(_percent(value)),
      ModifierType.salaryCost => l10n.effectSalaryCost(_percent(value)),
      ModifierType.maintenanceCost => l10n.effectMaintenanceCost(_percent(value)),
      ModifierType.ticketRevenue => l10n.effectTicketRevenue(_percent(value)),
      ModifierType.subsidy => l10n.effectSubsidy(_percent(value)),
      ModifierType.dailyCost => l10n.effectDailyCost(MoneyFormat.compact(value.round())),
      ModifierType.dailyIncome => l10n.effectDailyIncome(MoneyFormat.compact(value.round())),
      ModifierType.mood => l10n.effectMoodTrend(effect.group?.label(l10n) ?? '', _signed(value)),
    };
    final duration = effect.days == ActiveModifier.permanent
        ? l10n.effectForever
        : l10n.effectDays(effect.days);
    final district = effect.district?.displayName(l10n);
    return [base, duration, ?district].join(' · ');
  }

  static EffectTone toneOf(DecisionEffect effect) {
    return switch (effect) {
      Spend() || RoadDamage() || LoseBuses() => EffectTone.bad,
      Earn() || RoadRestore() || OrderBuses() => EffectTone.good,
      Mood(:final delta) || Reputation(:final delta) => _sign(delta),
      LaunchProject() || ChangeFare() => EffectTone.neutral,
      Modify(:final type, :final value) => switch (type) {
        ModifierType.capacity ||
        ModifierType.ticketRevenue ||
        ModifierType.subsidy => value >= 1 ? EffectTone.good : EffectTone.bad,
        ModifierType.energyCost ||
        ModifierType.salaryCost ||
        ModifierType.maintenanceCost => value > 1 ? EffectTone.bad : EffectTone.good,
        ModifierType.congestion => value > 0 ? EffectTone.bad : EffectTone.good,
        ModifierType.safety || ModifierType.mood => _sign(value),
        ModifierType.dailyCost => EffectTone.bad,
        ModifierType.dailyIncome => EffectTone.good,
        ModifierType.demand => EffectTone.neutral,
      },
    };
  }

  static EffectTone _sign(double value) => value >= 0 ? EffectTone.good : EffectTone.bad;
}

class ToneChip extends StatelessWidget {
  const ToneChip({super.key, required this.label, required this.tone});

  final String label;
  final EffectTone tone;

  @override
  Widget build(BuildContext context) {
    final palette = switch (tone) {
      EffectTone.good => ChunkyPalette.green,
      EffectTone.bad => ChunkyPalette.coral,
      EffectTone.neutral => ChunkyPalette.ocean,
    };
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: palette.glow.withValues(alpha: 0.45),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: palette.deep, width: 1.5),
      ),
      child: Text(
        label,
        style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: palette.lip),
      ),
    );
  }
}
