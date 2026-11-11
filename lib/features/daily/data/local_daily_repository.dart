import 'package:transport_minister/core/storage/document_store.dart';
import 'package:transport_minister/features/daily/domain/daily_state.dart';

abstract interface class DailyRepository {
  Future<DailyState?> load();

  Future<void> save(DailyState state);
}

class LocalDailyRepository implements DailyRepository {
  const LocalDailyRepository(this._store);

  final DocumentStore _store;

  static const _collection = 'daily';
  static const _key = 'minister';
  static const _version = 1;

  @override
  Future<DailyState?> load() async {
    final document = await _store.read(_collection, _key);
    return document == null ? null : DailyState.fromJson(document.payload);
  }

  @override
  Future<void> save(DailyState state) =>
      _store.write(_collection, _key, state.toJson(), version: _version);
}
