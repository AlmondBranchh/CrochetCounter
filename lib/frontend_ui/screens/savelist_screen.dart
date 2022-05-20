import 'package:flutter/material.dart';
import 'package:crochet_counter/logic/data.dart';

class SavesListScreen extends StatefulWidget {
  const SavesListScreen({Key? key}) : super(key: key);

  @override
  State<SavesListScreen> createState() => _SavesListScreenState();
}

class _SavesListScreenState extends State<SavesListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: GetSaveList().length,
          itemBuilder: (context , index){
            return ListTile(
              title: Text("${GetSaveList()[index]}"),
            );
          }
      ),
    );
  }
}
