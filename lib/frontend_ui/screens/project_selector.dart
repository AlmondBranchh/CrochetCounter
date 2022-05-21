import 'package:crochet_counter/frontend_ui/colors.dart';
import 'package:flutter/material.dart';
import 'package:crochet_counter/frontend_ui/screens/create_new_project.dart';
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
        backgroundColor: Colors.transparent,
        title: Text(
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
              return ListViewTile(context , index);
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

Widget ListViewTile(BuildContext context, int index){
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
                  "2:00:00",
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
  );
}
