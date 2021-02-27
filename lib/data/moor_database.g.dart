// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moor_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Note extends DataClass implements Insertable<Note> {
  final int id;
  final String descreption;
  final DateTime date;
  final int categoryId;
  Note(
      {@required this.id,
      @required this.descreption,
      this.date,
      this.categoryId});
  factory Note.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return Note(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      descreption: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}descreption']),
      date:
          dateTimeType.mapFromDatabaseResponse(data['${effectivePrefix}date']),
      categoryId: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}category_id']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || descreption != null) {
      map['descreption'] = Variable<String>(descreption);
    }
    if (!nullToAbsent || date != null) {
      map['date'] = Variable<DateTime>(date);
    }
    if (!nullToAbsent || categoryId != null) {
      map['category_id'] = Variable<int>(categoryId);
    }
    return map;
  }

  NotesCompanion toCompanion(bool nullToAbsent) {
    return NotesCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      descreption: descreption == null && nullToAbsent
          ? const Value.absent()
          : Value(descreption),
      date: date == null && nullToAbsent ? const Value.absent() : Value(date),
      categoryId: categoryId == null && nullToAbsent
          ? const Value.absent()
          : Value(categoryId),
    );
  }

  factory Note.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Note(
      id: serializer.fromJson<int>(json['id']),
      descreption: serializer.fromJson<String>(json['descreption']),
      date: serializer.fromJson<DateTime>(json['date']),
      categoryId: serializer.fromJson<int>(json['categoryId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'descreption': serializer.toJson<String>(descreption),
      'date': serializer.toJson<DateTime>(date),
      'categoryId': serializer.toJson<int>(categoryId),
    };
  }

  Note copyWith({int id, String descreption, DateTime date, int categoryId}) =>
      Note(
        id: id ?? this.id,
        descreption: descreption ?? this.descreption,
        date: date ?? this.date,
        categoryId: categoryId ?? this.categoryId,
      );
  @override
  String toString() {
    return (StringBuffer('Note(')
          ..write('id: $id, ')
          ..write('descreption: $descreption, ')
          ..write('date: $date, ')
          ..write('categoryId: $categoryId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode,
      $mrjc(descreption.hashCode, $mrjc(date.hashCode, categoryId.hashCode))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Note &&
          other.id == this.id &&
          other.descreption == this.descreption &&
          other.date == this.date &&
          other.categoryId == this.categoryId);
}

class NotesCompanion extends UpdateCompanion<Note> {
  final Value<int> id;
  final Value<String> descreption;
  final Value<DateTime> date;
  final Value<int> categoryId;
  const NotesCompanion({
    this.id = const Value.absent(),
    this.descreption = const Value.absent(),
    this.date = const Value.absent(),
    this.categoryId = const Value.absent(),
  });
  NotesCompanion.insert({
    this.id = const Value.absent(),
    @required String descreption,
    this.date = const Value.absent(),
    this.categoryId = const Value.absent(),
  }) : descreption = Value(descreption);
  static Insertable<Note> custom({
    Expression<int> id,
    Expression<String> descreption,
    Expression<DateTime> date,
    Expression<int> categoryId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (descreption != null) 'descreption': descreption,
      if (date != null) 'date': date,
      if (categoryId != null) 'category_id': categoryId,
    });
  }

  NotesCompanion copyWith(
      {Value<int> id,
      Value<String> descreption,
      Value<DateTime> date,
      Value<int> categoryId}) {
    return NotesCompanion(
      id: id ?? this.id,
      descreption: descreption ?? this.descreption,
      date: date ?? this.date,
      categoryId: categoryId ?? this.categoryId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (descreption.present) {
      map['descreption'] = Variable<String>(descreption.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (categoryId.present) {
      map['category_id'] = Variable<int>(categoryId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NotesCompanion(')
          ..write('id: $id, ')
          ..write('descreption: $descreption, ')
          ..write('date: $date, ')
          ..write('categoryId: $categoryId')
          ..write(')'))
        .toString();
  }
}

class $NotesTable extends Notes with TableInfo<$NotesTable, Note> {
  final GeneratedDatabase _db;
  final String _alias;
  $NotesTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _descreptionMeta =
      const VerificationMeta('descreption');
  GeneratedTextColumn _descreption;
  @override
  GeneratedTextColumn get descreption =>
      _descreption ??= _constructDescreption();
  GeneratedTextColumn _constructDescreption() {
    return GeneratedTextColumn('descreption', $tableName, false,
        minTextLength: 2, maxTextLength: 2000);
  }

  final VerificationMeta _dateMeta = const VerificationMeta('date');
  GeneratedDateTimeColumn _date;
  @override
  GeneratedDateTimeColumn get date => _date ??= _constructDate();
  GeneratedDateTimeColumn _constructDate() {
    return GeneratedDateTimeColumn(
      'date',
      $tableName,
      true,
    );
  }

  final VerificationMeta _categoryIdMeta = const VerificationMeta('categoryId');
  GeneratedIntColumn _categoryId;
  @override
  GeneratedIntColumn get categoryId => _categoryId ??= _constructCategoryId();
  GeneratedIntColumn _constructCategoryId() {
    return GeneratedIntColumn('category_id', $tableName, true,
        $customConstraints: 'NULL REFERENCES categories(id)');
  }

  @override
  List<GeneratedColumn> get $columns => [id, descreption, date, categoryId];
  @override
  $NotesTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'notes';
  @override
  final String actualTableName = 'notes';
  @override
  VerificationContext validateIntegrity(Insertable<Note> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('descreption')) {
      context.handle(
          _descreptionMeta,
          descreption.isAcceptableOrUnknown(
              data['descreption'], _descreptionMeta));
    } else if (isInserting) {
      context.missing(_descreptionMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date'], _dateMeta));
    }
    if (data.containsKey('category_id')) {
      context.handle(
          _categoryIdMeta,
          categoryId.isAcceptableOrUnknown(
              data['category_id'], _categoryIdMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Note map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Note.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $NotesTable createAlias(String alias) {
    return $NotesTable(_db, alias);
  }
}

class Categorie extends DataClass implements Insertable<Categorie> {
  final int id;
  final String name;
  final int primaryColor;
  final int seconderyColor;
  Categorie(
      {@required this.id,
      @required this.name,
      @required this.primaryColor,
      @required this.seconderyColor});
  factory Categorie.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return Categorie(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
      primaryColor: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}primary_color']),
      seconderyColor: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}secondery_color']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || primaryColor != null) {
      map['primary_color'] = Variable<int>(primaryColor);
    }
    if (!nullToAbsent || seconderyColor != null) {
      map['secondery_color'] = Variable<int>(seconderyColor);
    }
    return map;
  }

  CategoriesCompanion toCompanion(bool nullToAbsent) {
    return CategoriesCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      primaryColor: primaryColor == null && nullToAbsent
          ? const Value.absent()
          : Value(primaryColor),
      seconderyColor: seconderyColor == null && nullToAbsent
          ? const Value.absent()
          : Value(seconderyColor),
    );
  }

  factory Categorie.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Categorie(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      primaryColor: serializer.fromJson<int>(json['primaryColor']),
      seconderyColor: serializer.fromJson<int>(json['seconderyColor']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'primaryColor': serializer.toJson<int>(primaryColor),
      'seconderyColor': serializer.toJson<int>(seconderyColor),
    };
  }

  Categorie copyWith(
          {int id, String name, int primaryColor, int seconderyColor}) =>
      Categorie(
        id: id ?? this.id,
        name: name ?? this.name,
        primaryColor: primaryColor ?? this.primaryColor,
        seconderyColor: seconderyColor ?? this.seconderyColor,
      );
  @override
  String toString() {
    return (StringBuffer('Categorie(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('primaryColor: $primaryColor, ')
          ..write('seconderyColor: $seconderyColor')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(name.hashCode,
          $mrjc(primaryColor.hashCode, seconderyColor.hashCode))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Categorie &&
          other.id == this.id &&
          other.name == this.name &&
          other.primaryColor == this.primaryColor &&
          other.seconderyColor == this.seconderyColor);
}

class CategoriesCompanion extends UpdateCompanion<Categorie> {
  final Value<int> id;
  final Value<String> name;
  final Value<int> primaryColor;
  final Value<int> seconderyColor;
  const CategoriesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.primaryColor = const Value.absent(),
    this.seconderyColor = const Value.absent(),
  });
  CategoriesCompanion.insert({
    this.id = const Value.absent(),
    @required String name,
    @required int primaryColor,
    @required int seconderyColor,
  })  : name = Value(name),
        primaryColor = Value(primaryColor),
        seconderyColor = Value(seconderyColor);
  static Insertable<Categorie> custom({
    Expression<int> id,
    Expression<String> name,
    Expression<int> primaryColor,
    Expression<int> seconderyColor,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (primaryColor != null) 'primary_color': primaryColor,
      if (seconderyColor != null) 'secondery_color': seconderyColor,
    });
  }

  CategoriesCompanion copyWith(
      {Value<int> id,
      Value<String> name,
      Value<int> primaryColor,
      Value<int> seconderyColor}) {
    return CategoriesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      primaryColor: primaryColor ?? this.primaryColor,
      seconderyColor: seconderyColor ?? this.seconderyColor,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (primaryColor.present) {
      map['primary_color'] = Variable<int>(primaryColor.value);
    }
    if (seconderyColor.present) {
      map['secondery_color'] = Variable<int>(seconderyColor.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CategoriesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('primaryColor: $primaryColor, ')
          ..write('seconderyColor: $seconderyColor')
          ..write(')'))
        .toString();
  }
}

class $CategoriesTable extends Categories
    with TableInfo<$CategoriesTable, Categorie> {
  final GeneratedDatabase _db;
  final String _alias;
  $CategoriesTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  @override
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn('name', $tableName, false,
        minTextLength: 2, maxTextLength: 100);
  }

  final VerificationMeta _primaryColorMeta =
      const VerificationMeta('primaryColor');
  GeneratedIntColumn _primaryColor;
  @override
  GeneratedIntColumn get primaryColor =>
      _primaryColor ??= _constructPrimaryColor();
  GeneratedIntColumn _constructPrimaryColor() {
    return GeneratedIntColumn(
      'primary_color',
      $tableName,
      false,
    );
  }

  final VerificationMeta _seconderyColorMeta =
      const VerificationMeta('seconderyColor');
  GeneratedIntColumn _seconderyColor;
  @override
  GeneratedIntColumn get seconderyColor =>
      _seconderyColor ??= _constructSeconderyColor();
  GeneratedIntColumn _constructSeconderyColor() {
    return GeneratedIntColumn(
      'secondery_color',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id, name, primaryColor, seconderyColor];
  @override
  $CategoriesTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'categories';
  @override
  final String actualTableName = 'categories';
  @override
  VerificationContext validateIntegrity(Insertable<Categorie> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name'], _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('primary_color')) {
      context.handle(
          _primaryColorMeta,
          primaryColor.isAcceptableOrUnknown(
              data['primary_color'], _primaryColorMeta));
    } else if (isInserting) {
      context.missing(_primaryColorMeta);
    }
    if (data.containsKey('secondery_color')) {
      context.handle(
          _seconderyColorMeta,
          seconderyColor.isAcceptableOrUnknown(
              data['secondery_color'], _seconderyColorMeta));
    } else if (isInserting) {
      context.missing(_seconderyColorMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Categorie map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Categorie.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $CategoriesTable createAlias(String alias) {
    return $CategoriesTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $NotesTable _notes;
  $NotesTable get notes => _notes ??= $NotesTable(this);
  $CategoriesTable _categories;
  $CategoriesTable get categories => _categories ??= $CategoriesTable(this);
  NoteDaos _noteDaos;
  NoteDaos get noteDaos => _noteDaos ??= NoteDaos(this as AppDatabase);
  CategoryDaos _categoryDaos;
  CategoryDaos get categoryDaos =>
      _categoryDaos ??= CategoryDaos(this as AppDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [notes, categories];
}

// **************************************************************************
// DaoGenerator
// **************************************************************************

mixin _$NoteDaosMixin on DatabaseAccessor<AppDatabase> {
  $NotesTable get notes => attachedDatabase.notes;
}
mixin _$CategoryDaosMixin on DatabaseAccessor<AppDatabase> {
  $CategoriesTable get categories => attachedDatabase.categories;
}
