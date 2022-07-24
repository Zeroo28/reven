// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:drift/native.dart';
import 'package:test/test.dart';

import 'package:reven/database/app_database.dart';
import 'package:reven/database/dao/application_dao.dart';
import 'package:reven/models/presence.dart';

void main() {
  late AppDatabase db;
  late ApplicationsDao dao;

  setUp(() async {
    db = AppDatabase.test(NativeDatabase.memory());
    dao = ApplicationsDao(db);

    final presence = Presence(id: 4729274916284015);
    await dao.saveApplication(presence);
  });

  test('Application can be saved', () async {
    final presence = Presence(id: 4729274916284016);
    final res = await dao.saveApplication(presence);

    expect(res, isNot(null));
  });

  test('Get all applications from the database', () async {
    final res = await dao.getApplications;
    expect(res.length, equals(1));
  });

  test('Get single application referring to its id', () async {
    final res = await dao.getApplicationById(1);
    expect(res, isNot(null));
  });

  test('Querying an application returns valid body', () async {
    final res = await dao.getApplicationById(1);
    final body = res?.body;

    expect(body, isNot(null));

    final presence = Presence.fromJson(jsonDecode(body!));
    expect(presence, isNot(null));
  });

  tearDown(() async {
    db.delete(dao.application);
    await db.close();
  });
}
