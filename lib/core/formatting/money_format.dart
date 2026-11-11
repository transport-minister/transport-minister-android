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

  static String fare(int cents) => '$symbol${(cents / 100).toStringAsFixed(2)}';

  static String count(int value) => NumberFormat.decimalPattern('en').format(value);

  static String _trim(double value) {
    final digits = value >= 100 ? 0 : (value >= 10 ? 1 : 2);
    final text = value.toStringAsFixed(digits);
    return text.contains('.') ? text.replaceFirst(RegExp(r'\.?0+$'), '') : text;
  }
}
