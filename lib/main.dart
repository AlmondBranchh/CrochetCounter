import 'package:flutter/material.dart';
import 'package:crochet_counter/counter.dart';
import 'package:crochet_counter/tabList.dart';

import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/widgets.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

   final database = openDatabase(
    join(await getDatabasesPath(), "project_db.db"),
    onCreate: (db, version) {
      return db.execute(
        "CREATE TABLE projects(id INTEGER, name TEXT, saveList TEXT)"
      );
    },
      version: 1,
  );

   Future<void> insertProject(Project project) async {
     final db = await database;
     await db.insert(
       "projects" ,
       project.toMap(),
       conflictAlgorithm: ConflictAlgorithm.replace
     );
   }

   Future<List<Project>> GetProjects() async{
     final db = await database;
     final List<Map<String, dynamic>> maps = await db.query('projects');

     return List.generate(maps.length, (i){
       return Project(
         id: maps[i]['id'],
         name: maps[i]['name'],
         saveList: maps[i]['saveList']
       );
     });
   }

   var firstProject = const Project(id: 0, name: "My First Project" , saveList: "10:14");

   await insertProject(firstProject);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Crochet Couter",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Project name"),
        ),
        body: Column(
          children: [
            CounterSection(),
            Text()
            listSection,
          ],
        )
      ),
    );
  }
}

Widget listSection = Expanded(child: const ListSection());


class Project {
  final int id;
  final String name;
  final String saveList;

  const Project({
    required this.id,
    required this.name,
    required this.saveList,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'saveList': saveList,
    };
  }
}







