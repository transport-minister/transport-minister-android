import 'package:flutter_test/flutter_test.dart';
import 'package:transport_minister/core/formatting/money_format.dart';

void main() {
  test('money is shown in compact dollars', () {
    expect(MoneyFormat.compact(2500000), r'$2.5M');
    expect(MoneyFormat.compact(210000), r'$210K');
    expect(MoneyFormat.compact(25400), r'$25.4K');
    expect(MoneyFormat.compact(5760), r'$5,760');
    expect(MoneyFormat.compact(-6371), r'-$6,371');
  });

  test('signed amounts show their direction', () {
    expect(MoneyFormat.signed(5135), r'+$5,135');
    expect(MoneyFormat.signed(-120000), r'-$120K');
  });

  test('earnings per second use short amounts', () {
    expect(MoneyFormat.short(850), '\$850');
    expect(MoneyFormat.short(1200), '\$1.2K');
    expect(MoneyFormat.short(2000), '\$2K');
    expect(MoneyFormat.short(-3450), '-\$3.5K');
    expect(MoneyFormat.short(1250000), '\$1.3M');
    expect(MoneyFormat.signedShort(2300), '+\$2.3K');
    expect(MoneyFormat.signedShort(-90), '-\$90');
  });

  test('fares are shown in dollars and cents', () {
    expect(MoneyFormat.fare(60), r'$0.60');
  });
}
