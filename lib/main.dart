import 'package:flutter/material.dart';
import 'package:crochet_counter/counter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Crochet Couter",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Project name"),
        ),
        body: Column(
          children: const [
            CounterSection(),
          ],
        )
      ),
    );
  }
}








