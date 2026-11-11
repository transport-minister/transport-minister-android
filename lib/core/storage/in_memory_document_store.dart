import 'dart:convert';

import 'package:transport_minister/core/storage/document_store.dart';

class InMemoryDocumentStore implements DocumentStore {
  final _documents = <String, (String, int)>{};

  @override
  Future<StoredDocument?> read(String collection, String key) async {
    final document = _documents[_id(collection, key)];
    if (document == null) {
      return null;
    }
    final (payload, version) = document;
    return StoredDocument(payload: jsonDecode(payload) as Map<String, dynamic>, version: version);
  }

  @override
  Future<void> write(
    String collection,
    String key,
    Map<String, dynamic> payload, {
    required int version,
  }) async {
    _documents[_id(collection, key)] = (jsonEncode(payload), version);
  }

  @override
  Future<void> delete(String collection, String key) async {
    _documents.remove(_id(collection, key));
  }

  String _id(String collection, String key) => '$collection/$key';
}
