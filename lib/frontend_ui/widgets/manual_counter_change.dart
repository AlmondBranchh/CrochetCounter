import 'package:flutter/material.dart';
import 'package:crochet_counter/logic/data.dart';

class ManualCounterEditor extends StatefulWidget {
  const ManualCounterEditor({Key? key}) : super(key: key);

  @override
  State<ManualCounterEditor> createState() => _ManualCounterEditorState();
}

class _ManualCounterEditorState extends State<ManualCounterEditor> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      alignment: Alignment.center,
      title: Text("Counter Change"),
      content: SizedBox(
        height: 200,
        width: 200,
      child: Column(
        children: [
          TextField(
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 84,
            ),
            keyboardType: TextInputType.number,
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
