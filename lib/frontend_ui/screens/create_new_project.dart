import 'package:crochet_counter/frontend_ui/colors.dart';
import 'package:flutter/material.dart';
import 'package:crochet_counter/logic/project.dart';

class NewProjectWindow extends StatefulWidget {
  const NewProjectWindow({Key? key}) : super(key: key);

  @override
  State<NewProjectWindow> createState() => _NewProjectWindowState();
}

class _NewProjectWindowState extends State<NewProjectWindow> {

  TextEditingController projectNameController = TextEditingController();

  void _createNewProject(){
    CreateNewProject(projectNameController.text);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: thirdColor,
        title: const Center(
          child: Text(
            "Create New Project",
            style: TextStyle(
              color: firstColor,
            ),
          ),
        ),
        content: SizedBox(
          width: 300,
          height: 150,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
               TextField(
                cursorColor: secondColor,
                style: const TextStyle(
                  color: firstColor,
                  fontSize: 28,
                ),
                controller: projectNameController,
                decoration: const InputDecoration(
                  labelText: "Project Name",
                  labelStyle: TextStyle(
                    color: secondColor,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: secondColor),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: secondColor),
                  ),
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(color: secondColor),
                  ),
                  )
                  ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: fourthColor
                      ),
                    child: const Text(
                        "Cancel",
                      style: TextStyle(
                        color: firstColor,
                      ),
                    ),
                    onPressed: (){
                      Navigator.pop(context);
                    },
                ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: secondColor,
                      ),
                      onPressed: _createNewProject,
                      child: const Text(
                          "Save",
                        style: TextStyle(
                          color: fourthColor
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
    );
  }
}
