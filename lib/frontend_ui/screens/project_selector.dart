import 'package:flutter/material.dart';
import 'package:crochet_counter/frontend_ui/widgets/create_new_project.dart';
import 'package:crochet_counter/logic/project.dart';

class ProjectSelector extends StatefulWidget {
  const ProjectSelector({Key? key}) : super(key: key);

  @override
  State<ProjectSelector> createState() => _ProjectSelectorState();
}

class _ProjectSelectorState extends State<ProjectSelector> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Projects"),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: (){
              showDialog(
                context: context,
                builder: (BuildContext context){
                  return NewProjectWindow();
                }
              ).then((value) => setState((){}));
            },
            child: Text("New Project"),
          ),
          ListView.builder(
            itemCount: GetProjectList().length,
            shrinkWrap: true,
            itemBuilder: (context, index){
              return ListTile(
                title: Text(GetProjectList()[index].name),
                onTap: (){
                OpenProject(GetProjectList()[index]);
                Navigator.pop(context);
                },
              );
            }
          )
        ],
      ),
    );
  }
}
