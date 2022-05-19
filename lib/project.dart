import 'package:crochet_counter/data.dart';

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

void LoadProject(){
  SetCounter(mockProject().counterValue.toString());
  SetSaveList(mockProject().savesList);
}

List<Project> GetProjectList(){
  return listOfProjects;
}

void CreateNewProject(String name){
  Project newProject = Project(
    name: name,
    counterValue: 0,
    savesList: <int>[]
  );

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

void SaveProject(){

   currentList = GetSaveList();
   currentProject.savesList = currentList;
   print(currentProject.savesList);
   currentProject.counterValue = int.parse(GetCounterValueString());
}