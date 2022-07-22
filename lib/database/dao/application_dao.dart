import 'package:drift/drift.dart';

import '../../models/presence.dart';
import '../../models/tables/applications.dart';
import '../../utils/helpers/logger_helper.dart';
import '../app_database.dart';

part 'application_dao.g.dart';

@DriftAccessor(tables: [Application])
class ApplicationsDao extends DatabaseAccessor<AppDatabase>
    with _$ApplicationsDaoMixin {
  final logger = Logger();

  ApplicationsDao(AppDatabase db) : super(db);

  /// Upsert an application in the database, i.e. insert item into the database
  /// but update it on conflict.
  ///
  /// Params: required `Presence`.
  ///
  /// Returns: `Future<int>` index of updated column.
  Future saveApplication(Presence app) {
    logger.debug('App: ${app.toJsonString()}');
    final col = ApplicationCompanion(
      body: Value(app.toJsonString()),
      createdAt: Value(DateTime.now()),
    );
    return into(application).insertOnConflictUpdate(col);
  }

  /// Query all applications from the database, no filtering. Use
  /// `ApplicationsDao.getApplicationById` to get a single application with
  /// matching id.
  ///
  /// Returns `Future<List<Applications>>`, list will be empty if no applications
  /// are found in the database.
  Future<List<Applications>> get getApplications => select(application).get();

  /// Query single application from the database with matching ID.
  ///
  /// Returns: `Future<Application>` or `null` if no applications are found.
  Future<Applications>? getApplicationById(int id) {
    try {
      return (select(application)
            ..where(
              (app) => app.id.equals(id),
            ))
          .getSingle();
    } catch (e, st) {
      logger.error(
        'Something went wrong in ApplicationsDao.getApplicationById.',
        error: e,
        stackTrace: st,
      );
      return null;
    }
  }
}
