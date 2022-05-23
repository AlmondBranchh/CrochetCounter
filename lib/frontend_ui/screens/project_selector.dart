import 'package:crochet_counter/frontend_ui/colors.dart';
import 'package:crochet_counter/logic/data.dart';
import 'package:flutter/material.dart';
import 'package:crochet_counter/frontend_ui/screens/create_new_project.dart';
import 'package:crochet_counter/logic/project.dart';
import 'package:crochet_counter/frontend_ui/screens/project_editor.dart';

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
        backgroundColor: Colors.transparent,
        title: const Text(
            "Project Selector",
          style: TextStyle(
            color: secondColor
          ),
        ),
      ),
      body: ListView.builder(
            itemCount: GetProjectList().length,
            shrinkWrap: true,
            itemBuilder: (context, index){
              return ListTile(
                title: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              GetProjectList()[index].name,
                              style: const TextStyle(
                                  fontSize: 28,
                                  color: firstColor
                              ),
                            ),
                            Text(
                              "${Duration(seconds: GetProjectList()[index].totalTime).inHours.toString().padLeft(2, "0")}:"+
                                  "${Duration(seconds: GetProjectList()[index].totalTime).inMinutes.remainder(60).toString().padLeft(2, "0")}:"
                                      "${Duration(seconds: GetProjectList()[index].totalTime).inSeconds.remainder(60).toString().padLeft(2, "0")}",
                              style: TextStyle(
                                fontSize: 18,
                                color: secondColor,
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: 375,
                        height: 1,
                        decoration: const BoxDecoration(
                            color: firstColor,
                            borderRadius: BorderRadius.all(Radius.circular(4))
                        ),
                      )
                    ],
                  ),
                ),
                onTap: (){
                  OpenProject(GetProjectList()[index]);
                  Navigator.pop(context);
                },
                onLongPress: (){
                  SelectedProjectIndex(index);
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProjectEditor())
                  ).then((value) => setState((){}));
                },
              );
            }
          ),
      floatingActionButton: FloatingActionButton.large(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return NewProjectWindow();
              }
          ).then((value) => setState(() {}));
        },
        backgroundColor: secondColor,
        child: Icon(
            Icons.add,
          size: 82,
          color: fourthColor,
        ),
      ),
    );
  }
}
