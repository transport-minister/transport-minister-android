import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:transport_minister/core/storage/drift_document_store.dart';
import 'package:transport_minister/core/storage/game_database.dart';

void main() {
  late GameDatabase database;
  late DriftDocumentStore store;

  setUp(() {
    database = GameDatabase(NativeDatabase.memory());
    store = DriftDocumentStore(database);
  });

  tearDown(() => database.close());

  test('writes, overwrites and deletes documents', () async {
    await store.write('saves', 'baku', {'day': 1}, version: 1);
    await store.write('saves', 'baku', {'day': 2}, version: 1);

    final stored = await store.read('saves', 'baku');
    await store.delete('saves', 'baku');

    expect(stored?.payload, {'day': 2});
    expect(stored?.version, 1);
    expect(await store.read('saves', 'baku'), isNull);
  });
}
