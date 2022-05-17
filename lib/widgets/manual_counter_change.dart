import 'package:flutter/material.dart';
import 'package:crochet_counter/data.dart';

class ManualCounterEditor extends StatefulWidget {
  const ManualCounterEditor({Key? key}) : super(key: key);

  @override
  State<ManualCounterEditor> createState() => _ManualCounterEditorState();
}

class _ManualCounterEditorState extends State<ManualCounterEditor> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Manual Change"),
      content: SizedBox(
        height: 200,
        width: 200,
      child: Column(
        children: [
          TextField(
            style: const TextStyle(
              fontSize: 84,
            ),
            controller: TextEditingController(

                text: GetCounterValueString()
            ),
            onChanged: (text){
              SetCounter(text);
            },
          ),
        ],
      ),
      )
    );
  }
}
