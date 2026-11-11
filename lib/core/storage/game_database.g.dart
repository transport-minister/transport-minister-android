// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_database.dart';

// ignore_for_file: type=lint
class $GameDocumentsTable extends GameDocuments
    with TableInfo<$GameDocumentsTable, GameDocumentRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GameDocumentsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _collectionMeta = const VerificationMeta('collection');
  @override
  late final GeneratedColumn<String> collection = GeneratedColumn<String>(
    'collection',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _documentKeyMeta = const VerificationMeta('documentKey');
  @override
  late final GeneratedColumn<String> documentKey = GeneratedColumn<String>(
    'document_key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _payloadMeta = const VerificationMeta('payload');
  @override
  late final GeneratedColumn<String> payload = GeneratedColumn<String>(
    'payload',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _versionMeta = const VerificationMeta('version');
  @override
  late final GeneratedColumn<int> version = GeneratedColumn<int>(
    'version',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [collection, documentKey, payload, version, updatedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'game_documents';
  @override
  VerificationContext validateIntegrity(
    Insertable<GameDocumentRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('collection')) {
      context.handle(
        _collectionMeta,
        collection.isAcceptableOrUnknown(data['collection']!, _collectionMeta),
      );
    } else if (isInserting) {
      context.missing(_collectionMeta);
    }
    if (data.containsKey('document_key')) {
      context.handle(
        _documentKeyMeta,
        documentKey.isAcceptableOrUnknown(data['document_key']!, _documentKeyMeta),
      );
    } else if (isInserting) {
      context.missing(_documentKeyMeta);
    }
    if (data.containsKey('payload')) {
      context.handle(_payloadMeta, payload.isAcceptableOrUnknown(data['payload']!, _payloadMeta));
    } else if (isInserting) {
      context.missing(_payloadMeta);
    }
    if (data.containsKey('version')) {
      context.handle(_versionMeta, version.isAcceptableOrUnknown(data['version']!, _versionMeta));
    } else if (isInserting) {
      context.missing(_versionMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {collection, documentKey};
  @override
  GameDocumentRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return GameDocumentRow(
      collection: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}collection'],
      )!,
      documentKey: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}document_key'],
      )!,
      payload: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}payload'],
      )!,
      version: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}version'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $GameDocumentsTable createAlias(String alias) {
    return $GameDocumentsTable(attachedDatabase, alias);
  }
}

class GameDocumentRow extends DataClass implements Insertable<GameDocumentRow> {
  final String collection;
  final String documentKey;
  final String payload;
  final int version;
  final DateTime updatedAt;
  const GameDocumentRow({
    required this.collection,
    required this.documentKey,
    required this.payload,
    required this.version,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['collection'] = Variable<String>(collection);
    map['document_key'] = Variable<String>(documentKey);
    map['payload'] = Variable<String>(payload);
    map['version'] = Variable<int>(version);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  GameDocumentsCompanion toCompanion(bool nullToAbsent) {
    return GameDocumentsCompanion(
      collection: Value(collection),
      documentKey: Value(documentKey),
      payload: Value(payload),
      version: Value(version),
      updatedAt: Value(updatedAt),
    );
  }

  factory GameDocumentRow.fromJson(Map<String, dynamic> json, {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return GameDocumentRow(
      collection: serializer.fromJson<String>(json['collection']),
      documentKey: serializer.fromJson<String>(json['documentKey']),
      payload: serializer.fromJson<String>(json['payload']),
      version: serializer.fromJson<int>(json['version']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'collection': serializer.toJson<String>(collection),
      'documentKey': serializer.toJson<String>(documentKey),
      'payload': serializer.toJson<String>(payload),
      'version': serializer.toJson<int>(version),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  GameDocumentRow copyWith({
    String? collection,
    String? documentKey,
    String? payload,
    int? version,
    DateTime? updatedAt,
  }) => GameDocumentRow(
    collection: collection ?? this.collection,
    documentKey: documentKey ?? this.documentKey,
    payload: payload ?? this.payload,
    version: version ?? this.version,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  GameDocumentRow copyWithCompanion(GameDocumentsCompanion data) {
    return GameDocumentRow(
      collection: data.collection.present ? data.collection.value : this.collection,
      documentKey: data.documentKey.present ? data.documentKey.value : this.documentKey,
      payload: data.payload.present ? data.payload.value : this.payload,
      version: data.version.present ? data.version.value : this.version,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('GameDocumentRow(')
          ..write('collection: $collection, ')
          ..write('documentKey: $documentKey, ')
          ..write('payload: $payload, ')
          ..write('version: $version, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(collection, documentKey, payload, version, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GameDocumentRow &&
          other.collection == this.collection &&
          other.documentKey == this.documentKey &&
          other.payload == this.payload &&
          other.version == this.version &&
          other.updatedAt == this.updatedAt);
}

class GameDocumentsCompanion extends UpdateCompanion<GameDocumentRow> {
  final Value<String> collection;
  final Value<String> documentKey;
  final Value<String> payload;
  final Value<int> version;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const GameDocumentsCompanion({
    this.collection = const Value.absent(),
    this.documentKey = const Value.absent(),
    this.payload = const Value.absent(),
    this.version = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  GameDocumentsCompanion.insert({
    required String collection,
    required String documentKey,
    required String payload,
    required int version,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  }) : collection = Value(collection),
       documentKey = Value(documentKey),
       payload = Value(payload),
       version = Value(version),
       updatedAt = Value(updatedAt);
  static Insertable<GameDocumentRow> custom({
    Expression<String>? collection,
    Expression<String>? documentKey,
    Expression<String>? payload,
    Expression<int>? version,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (collection != null) 'collection': collection,
      if (documentKey != null) 'document_key': documentKey,
      if (payload != null) 'payload': payload,
      if (version != null) 'version': version,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  GameDocumentsCompanion copyWith({
    Value<String>? collection,
    Value<String>? documentKey,
    Value<String>? payload,
    Value<int>? version,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return GameDocumentsCompanion(
      collection: collection ?? this.collection,
      documentKey: documentKey ?? this.documentKey,
      payload: payload ?? this.payload,
      version: version ?? this.version,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (collection.present) {
      map['collection'] = Variable<String>(collection.value);
    }
    if (documentKey.present) {
      map['document_key'] = Variable<String>(documentKey.value);
    }
    if (payload.present) {
      map['payload'] = Variable<String>(payload.value);
    }
    if (version.present) {
      map['version'] = Variable<int>(version.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GameDocumentsCompanion(')
          ..write('collection: $collection, ')
          ..write('documentKey: $documentKey, ')
          ..write('payload: $payload, ')
          ..write('version: $version, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$GameDatabase extends GeneratedDatabase {
  _$GameDatabase(QueryExecutor e) : super(e);
  $GameDatabaseManager get managers => $GameDatabaseManager(this);
  late final $GameDocumentsTable gameDocuments = $GameDocumentsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [gameDocuments];
}

typedef $$GameDocumentsTableCreateCompanionBuilder = GameDocumentsCompanion Function({
  required String collection,
  required String documentKey,
  required String payload,
  required int version,
  required DateTime updatedAt,
  Value<int> rowid,
});
typedef $$GameDocumentsTableUpdateCompanionBuilder = GameDocumentsCompanion Function({
  Value<String> collection,
  Value<String> documentKey,
  Value<String> payload,
  Value<int> version,
  Value<DateTime> updatedAt,
  Value<int> rowid,
});

class $$GameDocumentsTableFilterComposer extends Composer<_$GameDatabase, $GameDocumentsTable> {
  $$GameDocumentsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get collection =>
      $composableBuilder(column: $table.collection, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get documentKey =>
      $composableBuilder(column: $table.documentKey, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get payload =>
      $composableBuilder(column: $table.payload, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get version =>
      $composableBuilder(column: $table.version, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => ColumnFilters(column));
}

class $$GameDocumentsTableOrderingComposer extends Composer<_$GameDatabase, $GameDocumentsTable> {
  $$GameDocumentsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get collection =>
      $composableBuilder(column: $table.collection, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get documentKey =>
      $composableBuilder(column: $table.documentKey, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get payload =>
      $composableBuilder(column: $table.payload, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get version =>
      $composableBuilder(column: $table.version, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => ColumnOrderings(column));
}

class $$GameDocumentsTableAnnotationComposer extends Composer<_$GameDatabase, $GameDocumentsTable> {
  $$GameDocumentsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get collection =>
      $composableBuilder(column: $table.collection, builder: (column) => column);

  GeneratedColumn<String> get documentKey =>
      $composableBuilder(column: $table.documentKey, builder: (column) => column);

  GeneratedColumn<String> get payload =>
      $composableBuilder(column: $table.payload, builder: (column) => column);

  GeneratedColumn<int> get version =>
      $composableBuilder(column: $table.version, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$GameDocumentsTableTableManager
    extends
        RootTableManager<
          _$GameDatabase,
          $GameDocumentsTable,
          GameDocumentRow,
          $$GameDocumentsTableFilterComposer,
          $$GameDocumentsTableOrderingComposer,
          $$GameDocumentsTableAnnotationComposer,
          $$GameDocumentsTableCreateCompanionBuilder,
          $$GameDocumentsTableUpdateCompanionBuilder,
          (GameDocumentRow, BaseReferences<_$GameDatabase, $GameDocumentsTable, GameDocumentRow>),
          GameDocumentRow,
          PrefetchHooks Function()
        > {
  $$GameDocumentsTableTableManager(_$GameDatabase db, $GameDocumentsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () => $$GameDocumentsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$GameDocumentsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$GameDocumentsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> collection = const Value.absent(),
                Value<String> documentKey = const Value.absent(),
                Value<String> payload = const Value.absent(),
                Value<int> version = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => GameDocumentsCompanion(
                collection: collection,
                documentKey: documentKey,
                payload: payload,
                version: version,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String collection,
                required String documentKey,
                required String payload,
                required int version,
                required DateTime updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => GameDocumentsCompanion.insert(
                collection: collection,
                documentKey: documentKey,
                payload: payload,
                version: version,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$GameDocumentsTable, GameDocumentRow>(table),
                  BaseReferences<_$GameDatabase, $GameDocumentsTable, GameDocumentRow>(
                    db,
                    table,
                    e,
                  ),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$GameDocumentsTableProcessedTableManager =
    ProcessedTableManager<
      _$GameDatabase,
      $GameDocumentsTable,
      GameDocumentRow,
      $$GameDocumentsTableFilterComposer,
      $$GameDocumentsTableOrderingComposer,
      $$GameDocumentsTableAnnotationComposer,
      $$GameDocumentsTableCreateCompanionBuilder,
      $$GameDocumentsTableUpdateCompanionBuilder,
      (GameDocumentRow, BaseReferences<_$GameDatabase, $GameDocumentsTable, GameDocumentRow>),
      GameDocumentRow,
      PrefetchHooks Function()
    >;

class $GameDatabaseManager {
  final _$GameDatabase _db;
  $GameDatabaseManager(this._db);
  $$GameDocumentsTableTableManager get gameDocuments =>
      $$GameDocumentsTableTableManager(_db, _db.gameDocuments);
}
