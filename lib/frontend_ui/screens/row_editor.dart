import 'package:flutter/material.dart';
import 'package:crochet_counter/logic/data.dart';
import 'package:crochet_counter/frontend_ui/colors.dart';

class RowEditor extends StatefulWidget {
  const RowEditor({Key? key}) : super(key: key);

  @override
  State<RowEditor> createState() => _RowEditorState();
}

class _RowEditorState extends State<RowEditor> {
  @override
  Widget build(BuildContext context) {

    TextEditingController rowTextEditor = TextEditingController(
      text: savesListNames[GetSelectedRowIndex()],
    );

    return AlertDialog(
      backgroundColor: fourthColor,
      content: SizedBox(
        width: 300,
        height: 300,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
                cursorColor: secondColor,
                style: const TextStyle(
                  color: firstColor,
                  fontSize: 28,
                ),
                controller: rowTextEditor,
                decoration: const InputDecoration(
                  labelText: "Row Name",
                  labelStyle: TextStyle(
                    color: secondColor,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: secondColor),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: secondColor),
                  ),
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(color: secondColor),
                  ),
                )
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: fourthColor
                    ),
                    child: const Text(
                      "Cancel",
                      style: TextStyle(
                        color: firstColor,
                      ),
                    ),
                    onPressed: (){
                      Navigator.pop(context);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: secondColor,
                    ),
                    onPressed: (){
                      SetSaveListName(rowTextEditor.text);
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "Save",
                      style: TextStyle(
                          color: fourthColor
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 250,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: thirdColor,
                  ),
                  onPressed: (){
                    DeleteRow(GetSelectedRowIndex());
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "Delete",
                    style: TextStyle(
                        color: firstColor
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
