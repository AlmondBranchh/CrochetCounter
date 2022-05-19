import 'package:crochet_counter/data.dart';
import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

List<Project> listOfProjects = <Project>[mockProject(),mockProject2()];
List<int> currentList = <int>[];


class Project{
  String name;
  int counterValue;
  List<int> savesList;

  Project({
    required this.name,
    required this.counterValue,
    required this.savesList,
  });
}

Project currentProject = mockProject();

Project mockProject(){
  return Project(
    name: "My Project",
    counterValue: 7,
    savesList: <int>[23,67,4,5],
  );
}

Project mockProject2(){
  return Project(
    name: "My Project2",
    counterValue: 69,
    savesList: <int>[23],
  );
}

void LoadProject() async {
  SetCounter(mockProject().counterValue.toString());
  SetSaveList(mockProject().savesList);

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
    Future<List<Project>> getProjects() async{
      final db = await database;
      final List<Map<String, dynamic>> maps = await db.query("projects");
      return List.generate(maps.length, (index) {
        return Project(
          name: maps[index]["name"],
          counterValue: maps[index]["counterValue"],
          savesList: <int>[],
        );
      });
    }
    listOfProjects = await getProjects();
  }

List<Project> GetProjectList(){
  return listOfProjects;
}

void CreateNewProject(String name) async {
  Project newProject = Project(
    name: name,
    counterValue: 0,
    savesList: <int>[]
  );

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
  insertProject(newProject);

  listOfProjects.add(newProject);
}

void OpenProject(Project project){
  currentProject = project;
  SetCounter(currentProject.counterValue.toString());
  SetSaveList(currentProject.savesList);
}

String GetCurrentProjectName(){
  return currentProject.name;
}

void SaveProject() async {

   currentList = GetSaveList();
   currentProject.savesList = currentList;
   currentProject.counterValue = int.parse(GetCounterValueString());

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

   Future<void> updateProject(Project project) async {
     final db = await database;
     await db.update(
       "projects",
       projectToMap(project),
       where: "name = ?",
       whereArgs: [project.name],
     );
   }
   updateProject(currentProject);

}

Map<String, dynamic> projectToMap(Project project){
  return{
    "name" : project.name,
    "counterValue" : project.counterValue,
  };
}