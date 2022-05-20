import 'package:flutter/material.dart';
import 'package:crochet_counter/frontend_ui/screens/home_screen.dart';

void main() {
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Crochet Counter",
      home: HomeScreen(),
    );
  }
}








