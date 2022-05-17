import 'package:crochet_counter/data.dart';


class Project{
  final int id;
  final String name;
  final int counterValue;
  final List<int> savesList;

  const Project({
    required this.id,
    required this.name,
    required this.counterValue,
    required this.savesList,
  });
}

Project mockProject(){
  return const Project(
    id: 1,
    name: "My Project",
    counterValue: 7,
    savesList: <int>[23,67,4,5],
  );
}

void LoadProject(){
  SetCounter(mockProject().counterValue.toString());
  SetSaveList(mockProject().savesList);
}

String GetProjectName(){
  return mockProject().name;
}