import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import '../models/tables/applications.dart';

part 'app_database.g.dart';

@DriftDatabase(tables: [Application])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_init());

  @override
  int get schemaVersion => 1;

  // Adding all the code here because we won't be needing multiple DAOs

}

LazyDatabase _init() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(join(dbFolder.path, 'app_database.db'));
    // Remove logStatements after completing debugging
    return NativeDatabase(file, logStatements: true);
  });
}
