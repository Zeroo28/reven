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

  Future saveApplication(Presence app) {
    final col = ApplicationCompanion(
      body: Value(app.toJsonString()),
      createdAt: Value(DateTime.now()),
    );
    return into(application).insert(col);
  }

  Future<List<Applications>> get getApplications => select(application).get();

  Future<Applications> getApplicationsById(int id) => (select(application)
        ..where(
          (app) => app.id.equals(id),
        ))
      .getSingle();
}
