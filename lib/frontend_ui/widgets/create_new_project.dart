import 'package:flutter/material.dart';
import 'package:crochet_counter/logic/project.dart';

class NewProjectWindow extends StatefulWidget {
  const NewProjectWindow({Key? key}) : super(key: key);

  @override
  State<NewProjectWindow> createState() => _NewProjectWindowState();
}

class _NewProjectWindowState extends State<NewProjectWindow> {

  TextEditingController projectNameController = new TextEditingController();

  void _createNewProject(){
    CreateNewProject(projectNameController.text);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        content: SizedBox(
          width: 200,
          height: 200,
          child: Column(
            children: [
              TextField(
                controller: projectNameController,
              ),
              Row(
                children: [
                  ElevatedButton(
                    child: Text("Save"),
                    onPressed: _createNewProject,
                  )
                ],
              )
            ],
          ),
        ),
    );
  }
}
