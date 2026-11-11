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

  test('fares are shown in dollars and cents', () {
    expect(MoneyFormat.fare(60), r'$0.60');
  });
}
