import 'package:crochet_counter/widgets/saves_list.dart';
import 'package:flutter/material.dart';
import 'package:crochet_counter/widgets/counter.dart';
import 'package:crochet_counter/project.dart';
import 'package:crochet_counter/screens/nav_bar.dart';


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
      drawer: NavBar(),
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
      children: const [
        CounterSection(),
        SavesList(),
    ],
      )
      )
    );
  }
}
