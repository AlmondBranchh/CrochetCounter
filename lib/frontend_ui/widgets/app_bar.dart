import 'package:crochet_counter/frontend_ui/screens/project_selector.dart';
import 'package:crochet_counter/frontend_ui/screens/savelist_screen.dart';
import 'package:crochet_counter/frontend_ui/screens/settings.dart';
import 'package:crochet_counter/logic/project.dart';
import 'package:flutter/material.dart';
import 'package:crochet_counter/frontend_ui/colors.dart';

AppBar GetAppBar(BuildContext context){
  return AppBar(
    backgroundColor: Colors.transparent,
    title: Text(
      GetCurrentProjectName(),
      textAlign: TextAlign.center,
      style: const TextStyle(
        color: secondColor,
      ),
    ),
    leading: IconButton(
        onPressed: (){
          SaveProject();
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ProjectSelector())
          );
        },
        icon: Icon(Icons.menu),
      color: firstColor,
    ),
    actions: [
      Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: IconButton(
            onPressed: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SavesListScreen())
              );
            },
            icon: Icon(Icons.book),
            color: firstColor,
          )
      ),
      Padding(
        padding: EdgeInsets.only(right: 16),
        child: IconButton(
          onPressed: (){
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsScreen())
            );
          },
          icon: Icon(Icons.settings),
          color: firstColor,
        ),
      )
    ],

  );
}
