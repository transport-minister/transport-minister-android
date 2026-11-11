import 'package:transport_minister/core/storage/document_store.dart';
import 'package:transport_minister/features/inbox/domain/inbox.dart';

abstract interface class InboxRepository {
  Future<Inbox?> load();

  Future<void> save(Inbox inbox);
}

class LocalInboxRepository implements InboxRepository {
  const LocalInboxRepository(this._store);

  final DocumentStore _store;

  static const _collection = 'inbox';
  static const _key = 'minister';
  static const _version = 1;

  @override
  Future<Inbox?> load() async {
    final document = await _store.read(_collection, _key);
    return document == null ? null : Inbox.fromJson(document.payload);
  }

  @override
  Future<void> save(Inbox inbox) =>
      _store.write(_collection, _key, inbox.toJson(), version: _version);
}
