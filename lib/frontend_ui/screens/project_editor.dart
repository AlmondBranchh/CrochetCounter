import 'package:crochet_counter/logic/data.dart';
import 'package:flutter/material.dart';
import 'package:crochet_counter/logic/project.dart';
import 'package:crochet_counter/frontend_ui/colors.dart';

class ProjectEditor extends StatefulWidget {
  const ProjectEditor({Key? key}) : super(key: key);

  @override
  State<ProjectEditor> createState() => _ProjectEditorState();
}

class _ProjectEditorState extends State<ProjectEditor> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: fourthColor,
      content: SizedBox(
        width: 250,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: thirdColor,
            ),
            onPressed: () {
              DeleteProject(SelectedProject(GetSelectedProjectIndex()));
              Navigator.pop(context);
            },
            child: const Text(
              "Delete",
              style: TextStyle(
                  color: firstColor
              ),
            ),
          ),
        ),
      ),
    );
  }
}