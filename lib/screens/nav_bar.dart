import 'package:crochet_counter/project.dart';
import 'package:flutter/material.dart';
import 'package:crochet_counter/widgets/create_new_project.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {

    void newProjectPressed(){
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return NewProjectWindow();
          }
      ).then((value) => setState((){})
      );
    }

    return Drawer(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(
              onPressed: newProjectPressed,
              child: Text("New Project"),
            ),
            ListView.builder(
              itemCount: GetProjectList().length,
              shrinkWrap: true,
              itemBuilder: (context, index){
                return ProjectTile(index);
              },
            )
          ],
        )
    );
  }
}

Widget ProjectTile(int projectIndex){
  return ListTile(
    title: Text(GetProjectList()[projectIndex].name),
  );
}
