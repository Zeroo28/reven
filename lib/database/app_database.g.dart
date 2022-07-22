// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: type=lint
class Applications extends DataClass implements Insertable<Applications> {
  final int id;
  final String body;
  final bool active;
  final DateTime createdAt;
  final DateTime? lastUsed;
  Applications(
      {required this.id,
      required this.body,
      required this.active,
      required this.createdAt,
      this.lastUsed});
  factory Applications.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Applications(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      body: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}body'])!,
      active: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}active'])!,
      createdAt: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}created_at'])!,
      lastUsed: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}last_used']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['body'] = Variable<String>(body);
    map['active'] = Variable<bool>(active);
    map['created_at'] = Variable<DateTime>(createdAt);
    if (!nullToAbsent || lastUsed != null) {
      map['last_used'] = Variable<DateTime?>(lastUsed);
    }
    return map;
  }

  ApplicationCompanion toCompanion(bool nullToAbsent) {
    return ApplicationCompanion(
      id: Value(id),
      body: Value(body),
      active: Value(active),
      createdAt: Value(createdAt),
      lastUsed: lastUsed == null && nullToAbsent
          ? const Value.absent()
          : Value(lastUsed),
    );
  }

  factory Applications.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Applications(
      id: serializer.fromJson<int>(json['id']),
      body: serializer.fromJson<String>(json['body']),
      active: serializer.fromJson<bool>(json['active']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      lastUsed: serializer.fromJson<DateTime?>(json['lastUsed']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'body': serializer.toJson<String>(body),
      'active': serializer.toJson<bool>(active),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'lastUsed': serializer.toJson<DateTime?>(lastUsed),
    };
  }

  Applications copyWith(
          {int? id,
          String? body,
          bool? active,
          DateTime? createdAt,
          DateTime? lastUsed}) =>
      Applications(
        id: id ?? this.id,
        body: body ?? this.body,
        active: active ?? this.active,
        createdAt: createdAt ?? this.createdAt,
        lastUsed: lastUsed ?? this.lastUsed,
      );
  @override
  String toString() {
    return (StringBuffer('Applications(')
          ..write('id: $id, ')
          ..write('body: $body, ')
          ..write('active: $active, ')
          ..write('createdAt: $createdAt, ')
          ..write('lastUsed: $lastUsed')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, body, active, createdAt, lastUsed);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Applications &&
          other.id == this.id &&
          other.body == this.body &&
          other.active == this.active &&
          other.createdAt == this.createdAt &&
          other.lastUsed == this.lastUsed);
}

class ApplicationCompanion extends UpdateCompanion<Applications> {
  final Value<int> id;
  final Value<String> body;
  final Value<bool> active;
  final Value<DateTime> createdAt;
  final Value<DateTime?> lastUsed;
  const ApplicationCompanion({
    this.id = const Value.absent(),
    this.body = const Value.absent(),
    this.active = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.lastUsed = const Value.absent(),
  });
  ApplicationCompanion.insert({
    this.id = const Value.absent(),
    required String body,
    this.active = const Value.absent(),
    required DateTime createdAt,
    this.lastUsed = const Value.absent(),
  })  : body = Value(body),
        createdAt = Value(createdAt);
  static Insertable<Applications> custom({
    Expression<int>? id,
    Expression<String>? body,
    Expression<bool>? active,
    Expression<DateTime>? createdAt,
    Expression<DateTime?>? lastUsed,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (body != null) 'body': body,
      if (active != null) 'active': active,
      if (createdAt != null) 'created_at': createdAt,
      if (lastUsed != null) 'last_used': lastUsed,
    });
  }

  ApplicationCompanion copyWith(
      {Value<int>? id,
      Value<String>? body,
      Value<bool>? active,
      Value<DateTime>? createdAt,
      Value<DateTime?>? lastUsed}) {
    return ApplicationCompanion(
      id: id ?? this.id,
      body: body ?? this.body,
      active: active ?? this.active,
      createdAt: createdAt ?? this.createdAt,
      lastUsed: lastUsed ?? this.lastUsed,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (body.present) {
      map['body'] = Variable<String>(body.value);
    }
    if (active.present) {
      map['active'] = Variable<bool>(active.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (lastUsed.present) {
      map['last_used'] = Variable<DateTime?>(lastUsed.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ApplicationCompanion(')
          ..write('id: $id, ')
          ..write('body: $body, ')
          ..write('active: $active, ')
          ..write('createdAt: $createdAt, ')
          ..write('lastUsed: $lastUsed')
          ..write(')'))
        .toString();
  }
}

class $ApplicationTable extends Application
    with TableInfo<$ApplicationTable, Applications> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ApplicationTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _bodyMeta = const VerificationMeta('body');
  @override
  late final GeneratedColumn<String?> body = GeneratedColumn<String?>(
      'body', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _activeMeta = const VerificationMeta('active');
  @override
  late final GeneratedColumn<bool?> active = GeneratedColumn<bool?>(
      'active', aliasedName, false,
      type: const BoolType(),
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (active IN (0, 1))',
      defaultValue: const Constant(false));
  final VerificationMeta _createdAtMeta = const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime?> createdAt = GeneratedColumn<DateTime?>(
      'created_at', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _lastUsedMeta = const VerificationMeta('lastUsed');
  @override
  late final GeneratedColumn<DateTime?> lastUsed = GeneratedColumn<DateTime?>(
      'last_used', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [id, body, active, createdAt, lastUsed];
  @override
  String get aliasedName => _alias ?? 'application';
  @override
  String get actualTableName => 'application';
  @override
  VerificationContext validateIntegrity(Insertable<Applications> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('body')) {
      context.handle(
          _bodyMeta, body.isAcceptableOrUnknown(data['body']!, _bodyMeta));
    } else if (isInserting) {
      context.missing(_bodyMeta);
    }
    if (data.containsKey('active')) {
      context.handle(_activeMeta,
          active.isAcceptableOrUnknown(data['active']!, _activeMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('last_used')) {
      context.handle(_lastUsedMeta,
          lastUsed.isAcceptableOrUnknown(data['last_used']!, _lastUsedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Applications map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Applications.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $ApplicationTable createAlias(String alias) {
    return $ApplicationTable(attachedDatabase, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $ApplicationTable application = $ApplicationTable(this);
  late final ApplicationsDao applicationsDao =
      ApplicationsDao(this as AppDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [application];
}
