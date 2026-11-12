import 'package:intl/intl.dart';

abstract final class MoneyFormat {
  static const symbol = r'$';

  static String compact(int amount) {
    final sign = amount < 0 ? '-' : '';
    final value = amount.abs();
    if (value >= 1000000) {
      return '$sign$symbol${_trim(value / 1000000)}M';
    }
    if (value >= 10000) {
      return '$sign$symbol${_trim(value / 1000)}K';
    }
    return '$sign$symbol${NumberFormat.decimalPattern('en').format(value)}';
  }

  static String signed(int amount) => amount > 0 ? '+${compact(amount)}' : compact(amount);

  static String short(int amount) {
    final sign = amount < 0 ? '-' : '';
    final value = amount.abs();
    final (number, unit) = value >= 1000000
        ? (value / 1000000, 'M')
        : (value >= 1000 ? (value / 1000, 'K') : (value.toDouble(), ''));
    final digits = unit.isEmpty || number >= 100 ? 0 : 1;
    final text = number.toStringAsFixed(digits).replaceFirst(RegExp(r'\.0$'), '');
    return '$sign$symbol$text$unit';
  }

  static String signedShort(int amount) => amount > 0 ? '+${short(amount)}' : short(amount);

  static String fare(int cents) => '$symbol${(cents / 100).toStringAsFixed(2)}';

  static String count(int value) => NumberFormat.decimalPattern('en').format(value);

  static String rate(double value) => value < 10 ? value.toStringAsFixed(1) : count(value.round());

  static String _trim(double value) {
    final digits = value >= 100 ? 0 : (value >= 10 ? 1 : 2);
    final text = value.toStringAsFixed(digits);
    return text.contains('.') ? text.replaceFirst(RegExp(r'\.?0+$'), '') : text;
  }
}
