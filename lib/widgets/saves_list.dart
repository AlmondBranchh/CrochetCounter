import 'package:crochet_counter/data.dart';
import 'package:flutter/material.dart';

class SavesList extends StatefulWidget {
  const SavesList({Key? key}) : super(key: key);

  @override
  State<SavesList> createState() => _SavesListState();
}

class _SavesListState extends State<SavesList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
            onPressed: (){
              setState((){
                AddCounterValueToSavesList();
              });
              },
            child: Text("Save")
        ),
        SavesListRow(0),
        SavesListRow(1),
        SavesListRow(2),
        SavesListRow(3),
        SavesListRow(4),
      ],
    );
  }
}

Widget SavesListRow(int index){
  return Container(
    child: Row(
      children: [
        Text(LastSavesListValueString(index)),
      ],
    ),
  );
}
