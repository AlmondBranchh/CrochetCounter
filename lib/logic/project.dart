import 'package:crochet_counter/logic/data.dart';
import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

List<Project> listOfProjects = <Project>[mockProject()];
List<int> currentList = <int>[];


class Project{
  String name;
  int counterValue;
  String savesList;
  String namesList;
  int currentProject;

  Project({
    required this.name,
    required this.counterValue,
    required this.savesList,
    required this.namesList,
    required this.currentProject,
  });
}

Project currentProject = mockProject();

Project mockProject(){
  return Project(
    name: "Tutorial Project",
    counterValue: 7,
    savesList: "43,23,15",
    namesList: "Row 3,Row 2,Row 1",
    currentProject: 0,
  );
}

Future LoadProject() async {
  WidgetsFlutterBinding.ensureInitialized();
  final database = openDatabase(
    join(await getDatabasesPath(), "projects.db"),
    onCreate: (db, version){
      return db.execute(
        "CREATE TABLE projects(name TEXT, counterValue INTEGER, savesList TEXT, namesList TEXT, currentProject INTEGER",
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
          savesList: maps[index]["savesList"],
          namesList: maps[index]["namesList"],
          currentProject: maps[index]["currentProject"],
        );
      });
    }

    listOfProjects = await getProjects();
    for (Project project in listOfProjects){
      if(project.currentProject == 1){
        currentProject = project;
      }
    }
  SetCounter(currentProject.counterValue.toString());
  SetSaveList(currentProject.savesList);
  SetNamesList(currentProject.namesList);
  currentProject.currentProject = 0;
  SaveProject();
  }

List<Project> GetProjectList(){
  return listOfProjects;
}

void CreateNewProject(String name) async {
  Project newProject = Project(
    name: name,
    counterValue: 0,
    savesList: "",
    namesList: "",
    currentProject: 0,
  );

      WidgetsFlutterBinding.ensureInitialized();
  final database = openDatabase(
      join(await getDatabasesPath(), "projects.db"),
      onCreate: (db, version){
  return db.execute(
  "CREATE TABLE projects(name TEXT, counterValue INTEGER, savesList TEXT, namesList TEXT, currentProject INTEGER)",
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
  SetNamesList(currentProject.namesList);
}

String GetCurrentProjectName(){
  return currentProject.name;
}

void SaveProject() async {


   currentProject.savesList = ListToString(GetSaveList());
   currentProject.counterValue = int.parse(GetCounterValueString());
   currentProject.namesList = ListToString(GetNameList());

   WidgetsFlutterBinding.ensureInitialized();
   final database = openDatabase(
     join(await getDatabasesPath(), "projects.db"),
     onCreate: (db, version){
       return db.execute(
         "CREATE TABLE projects(name TEXT, counterValue INTEGER, savesList TEXT, namesList TEXT, currentProject INTEGER)",
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
    "savesList" : project.savesList,
    "namesList" : project.namesList,
    "currentProject" : project.currentProject,
  };
}