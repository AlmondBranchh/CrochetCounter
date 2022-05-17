import 'package:crochet_counter/widgets/saves_list.dart';
import 'package:flutter/material.dart';
import 'package:crochet_counter/widgets/counter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Project"),
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
