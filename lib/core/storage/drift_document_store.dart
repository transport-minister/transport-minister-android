import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:transport_minister/core/storage/document_store.dart';
import 'package:transport_minister/core/storage/game_database.dart';

class DriftDocumentStore implements DocumentStore {
  const DriftDocumentStore(this._database);

  final GameDatabase _database;

  @override
  Future<StoredDocument?> read(String collection, String key) async {
    final query = _database.select(_database.gameDocuments)
      ..where((row) => row.collection.equals(collection) & row.documentKey.equals(key));
    final row = await query.getSingleOrNull();
    if (row == null) {
      return null;
    }
    return StoredDocument(
      payload: jsonDecode(row.payload) as Map<String, dynamic>,
      version: row.version,
    );
  }

  @override
  Future<void> write(
    String collection,
    String key,
    Map<String, dynamic> payload, {
    required int version,
  }) async {
    await _database
        .into(_database.gameDocuments)
        .insertOnConflictUpdate(
          GameDocumentsCompanion.insert(
            collection: collection,
            documentKey: key,
            payload: jsonEncode(payload),
            version: version,
            updatedAt: DateTime.now(),
          ),
        );
  }

  @override
  Future<void> delete(String collection, String key) async {
    await (_database.delete(
      _database.gameDocuments,
    )..where((row) => row.collection.equals(collection) & row.documentKey.equals(key))).go();
  }
}
