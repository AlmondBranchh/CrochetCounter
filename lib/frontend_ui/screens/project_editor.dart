import 'package:crochet_counter/logic/data.dart';
import 'package:flutter/material.dart';
import 'package:crochet_counter/logic/project.dart';

class ProjectEditor extends StatefulWidget {
  const ProjectEditor({Key? key}) : super(key: key);

  @override
  State<ProjectEditor> createState() => _ProjectEditorState();
}

class _ProjectEditorState extends State<ProjectEditor> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SizedBox(
        child: ElevatedButton(
          onPressed: (){
      DeleteProject(SelectedProject(GetSelectedProjectIndex()));
      Navigator.pop(context);
           },
          child: Text(
            "Delete"
          ),
        ),
      ),
    );
  }
}
