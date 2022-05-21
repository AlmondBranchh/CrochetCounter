import 'package:crochet_counter/frontend_ui/colors.dart';
import 'package:crochet_counter/logic/project.dart';
import 'package:flutter/material.dart';
import 'package:crochet_counter/frontend_ui/screens/home_screen.dart';
import 'dart:async';

void main() async {
  runApp( const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver{

  void initState(){
    WidgetsBinding.instance.addObserver(this);
    print("initState");
    super.initState();
    LoadProject();
  }

  void dispose(){
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
    SaveProject();
  }

  void didChangeAppLifecycleState(AppLifecycleState state){
    switch (state){
      case AppLifecycleState.resumed:
        currentProject.currentProject = 0;
        SaveProject();
        print("resumed");
        break;
      case AppLifecycleState.paused:
        currentProject.currentProject = 1;
        SaveProject();
        print("paused");
        break;
    }
  }


  @override
  Widget build(BuildContext context){
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: fourthColor,
      ),
      title: "Crochet Counter",
      home: HomeScreen(),
    );
  }
}









