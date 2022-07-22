import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import '../models/tables/applications.dart';
import '../utils/constants/strings.dart';
import '../utils/constants/regex.dart';
import 'dao/application_dao.dart';

part 'app_database.g.dart';

@DriftDatabase(tables: [Application])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_init());

  @override
  int get schemaVersion => 1;  
}

LazyDatabase _init() {
  return LazyDatabase(() async {
    late File file;
    var dbFolder = await getApplicationDocumentsDirectory();

    if (Platform.isLinux && ConstRegex.docDir.hasMatch(dbFolder.path)) {
      file = await File(
        join(Strings.getUsername(dbFolder.path), 'app_database.db'),
      ).create(recursive: true);
    } else {
      file = File(join(dbFolder.path, 'app_database.db'));
    }
    // Remove logStatements after completing debugging
    return NativeDatabase(file, logStatements: true);
  });
}