import 'package:crochet_counter/screens/savelist_screen.dart';
import 'package:crochet_counter/widgets/saves_list.dart';
import 'package:flutter/material.dart';
import 'package:crochet_counter/widgets/counter.dart';
import 'package:crochet_counter/project.dart';
import 'package:crochet_counter/screens/project_selector.dart';


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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            GetCurrentProjectName(),
          textAlign: TextAlign.center,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
      children: [
        Row(
        children: [
        ElevatedButton(
        onPressed: (){
          SaveProject();
      Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ProjectSelector())
      ).then((value) => setState((){}));
      },
        child: Text("Projects"),
      ),
          ElevatedButton(
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SavesListScreen())
              );
            },
            child: Text("Saves List"),
          )
      ],
    ),
        CounterSection(),
        SavesList(),
    ],
      )
      )
    );
  }
}
