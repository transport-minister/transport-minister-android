class StoredDocument {
  const StoredDocument({required this.payload, required this.version});

  final Map<String, dynamic> payload;
  final int version;
}

abstract interface class DocumentStore {
  Future<StoredDocument?> read(String collection, String key);

  Future<void> write(
    String collection,
    String key,
    Map<String, dynamic> payload, {
    required int version,
  });

  Future<void> delete(String collection, String key);
}
