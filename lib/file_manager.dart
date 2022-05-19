import 'dart:async';

import 'package:crochet_counter/project.dart';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


void databaseStartup() async {
  WidgetsFlutterBinding.ensureInitialized();
  final database = openDatabase(
      join(await getDatabasesPath(), "projects.db"),
    onCreate: (db, version){
        return db.execute(
          "CREATE TABLE projects(name TEXT, counterValue INTEGER)",
        );
    },
    version: 1,
  );

  Future<void> insertProject(Project project) async {
    final db = await database;
    await db.insert(
      "projects",
      projectToMap(project),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}