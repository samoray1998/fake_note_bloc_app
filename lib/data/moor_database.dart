import 'package:flutter/foundation.dart';
import 'package:moor/moor.dart';
import 'package:moor_flutter/moor_flutter.dart';
part 'moor_database.g.dart';

class Notes extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get descreption => text().withLength(min: 2, max: 2000)();
  DateTimeColumn get date => dateTime().nullable()();
  IntColumn get categoryId =>
      integer().customConstraint('NULL REFERENCES categories(id)').nullable()();
}

//@DataClassName('categories')
class Categories extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 2, max: 100)();
  IntColumn get primaryColor => integer()();
  IntColumn get seconderyColor => integer()();
}

@UseMoor(tables: [Notes, Categories], daos: [NoteDaos, CategoryDaos])
class AppDatabase extends _$AppDatabase {
  AppDatabase()
      : super(FlutterQueryExecutor.inDatabaseFolder(
          path: 'db.sqlite',
        ));
  @override
  int get schemaVersion => 2;
  @override
  MigrationStrategy get migaration {
    return MigrationStrategy(onUpgrade: (migartor, from, to) async {
      if (from == 1) {
        await migartor.addColumn(notes, notes.categoryId);
      }
    }, onCreate: (migrator) async {
      var categotyDeos = new CategoryDaos(this);
      categotyDeos.insertCategory(new Categorie(
          id: null,
          name: "work",
          primaryColor: 0XFFE65100,
          seconderyColor: 0XFFFFCC80));
    });
  }
  // MigrationStrategy get migration {
  //   return MigrationStrategy(
  //     beforeOpen: (details) async {
  //       // populate data
  //       await into(notes).insert(const NotesCompanion());
  //     },
  //   );
  // }
}

@UseDao(tables: [Notes])
class NoteDaos extends DatabaseAccessor<AppDatabase> with _$NoteDaosMixin {
  final AppDatabase db;
  NoteDaos(this.db) : super(db);
  Future<List<Note>> getAllNotes() => select(notes).get();
  Future insertNote(Note note) => into(notes).insert(note);
  Future updateNote(Note note) => update(notes).replace(note);
  Future deleteNote(Note note) => delete(notes).delete(note);
}

@UseDao(tables: [Categories])
class CategoryDaos extends DatabaseAccessor<AppDatabase>
    with _$CategoryDaosMixin {
  final AppDatabase db;
  CategoryDaos(this.db) : super(db);

  Future<List<Categorie>> getAllCategories() => select(categories).get();
  Future insertCategory(Categorie category) =>
      into(categories).insert(category);
  Future updateCategory(Categorie category) =>
      update(categories).replace(category);
  Future deleteCategory(Categorie category) =>
      delete(categories).delete(category);
}
