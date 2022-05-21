import 'package:crochet_counter/frontend_ui/widgets/saves_list.dart';
import 'package:flutter/material.dart';
import 'package:crochet_counter/frontend_ui/widgets/counter.dart';
import 'package:crochet_counter/logic/project.dart';
import 'package:crochet_counter/frontend_ui/screens/project_selector.dart';
import 'package:crochet_counter/frontend_ui/screens/savelist_screen.dart';
import 'package:crochet_counter/frontend_ui/screens/settings.dart';
import 'package:crochet_counter/frontend_ui/colors.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  void initState(){
    super.initState();
    LoadProject();
  }

  void dispose(){
    SaveProject();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          GetCurrentProjectName(),
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: firstColor,
          ),
        ),
        leading: IconButton(
          onPressed: (){
            SaveProject();
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProjectSelector())
            ).then((value) => setState((){}));
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

      ),
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
      children: [
        CounterSection(),
        SavesList(),
    ],
      )
      )
    );
  }
}

