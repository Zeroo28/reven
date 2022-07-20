import 'package:drift/drift.dart';

@DataClassName('Applications')
class Application extends Table {
  // id: id of the application, used to identify the application in the database, primary key
  IntColumn get id => integer().autoIncrement()();
  // body: contains json data of the application, nullable
  TextColumn get body => text().nullable()();
  // active: indicates if the application is active or not, default false
  BoolColumn get active => boolean().withDefault(const Constant(false))();
  // createdAt: date when the application was created, defaults to current date
  DateTimeColumn get createdAt => dateTime().withDefault(Constant(DateTime.now()))();
  // lastUsed: date when the application was last used, nullable
  DateTimeColumn get lastUsed => dateTime().nullable()();
}