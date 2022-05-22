import 'package:crochet_counter/frontend_ui/colors.dart';
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
      backgroundColor: fourthColor,
      alignment: Alignment.center,
      title: Text(
          "Counter Input",
        style: TextStyle(
          color: secondColor,
        ),
      ),
      content: SizedBox(
        height: 150,
        width: 200,
      child: Column(
        children: [
          TextField(
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 84,
              fontFamily: "Inter",
              color: secondColor,
            ),
            cursorColor: secondColor,
            keyboardType: TextInputType.number,
            controller: TextEditingController(
                text: GetCounterValueString(),
            ),
          decoration: const InputDecoration(
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: secondColor),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: secondColor),
            ),
            border: UnderlineInputBorder(
              borderSide: BorderSide(color: secondColor),
            ),
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
