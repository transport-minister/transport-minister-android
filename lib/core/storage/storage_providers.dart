import 'package:drift_flutter/drift_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:transport_minister/core/storage/document_store.dart';
import 'package:transport_minister/core/storage/drift_document_store.dart';
import 'package:transport_minister/core/storage/game_database.dart';

final gameDatabaseProvider = Provider<GameDatabase>((ref) {
  final database = GameDatabase(driftDatabase(name: 'transport_minister'));
  ref.onDispose(database.close);
  return database;
});

final documentStoreProvider = Provider<DocumentStore>(
  (ref) => DriftDocumentStore(ref.watch(gameDatabaseProvider)),
);
