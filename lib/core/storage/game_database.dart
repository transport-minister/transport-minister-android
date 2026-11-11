import 'package:drift/drift.dart';

part 'game_database.g.dart';

@DataClassName('GameDocumentRow')
class GameDocuments extends Table {
  TextColumn get collection => text()();

  TextColumn get documentKey => text()();

  TextColumn get payload => text()();

  IntColumn get version => integer()();

  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column<Object>> get primaryKey => {collection, documentKey};
}

@DriftDatabase(tables: [GameDocuments])
class GameDatabase extends _$GameDatabase {
  GameDatabase(super.executor);

  @override
  int get schemaVersion => 1;
}
