import 'package:crochet_counter/data.dart';

List<Project> listOfProjects = <Project>[mockProject()];

class Project{
  final String name;
  final int counterValue;
  final List<int> savesList;

  const Project({
    required this.name,
    required this.counterValue,
    required this.savesList,
  });
}

Project currentProject = mockProject();

Project mockProject(){
  return const Project(
    name: "My Project",
    counterValue: 7,
    savesList: <int>[23,67,4,5],
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
  SetCounter(project.counterValue.toString());
  SetSaveList(project.savesList);
  currentProject = project;
}

String GetCurrentProjectName(){
  return currentProject.name;
}