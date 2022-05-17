import 'package:crochet_counter/data.dart';
import 'package:flutter/material.dart';
import 'package:crochet_counter/styles/text.dart';

class SavesList extends StatefulWidget {
  const SavesList({Key? key}) : super(key: key);

  @override
  State<SavesList> createState() => _SavesListState();
}

class _SavesListState extends State<SavesList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
            onPressed: (){
              setState((){
                AddCounterValueToSavesList();
              });
              },
            child: Text("Save")
        ),
        FirstSaveListRow(0),
        SavesListRow(1),
        SavesListRow(2),
        SavesListRow(3),
        SavesListRow(4),
      ],
    );
  }
}

Widget SavesListRow(int index){
  if(SavesListIndex() - index < 1) {
    return Container(
      child: Text(" "),
    );
  } else {
  return Container(
    child: Row(
      children: [
        Text(
            "Row""${SavesListIndex() - index}"": ",
          style: TextStyle(
            fontSize: 32,
          ),
        ),
        Text(
            SavesListValueString(SavesListIndex()-index-1),
          style: TextStyle(
            fontSize: 28,
          ),
        ),
      ],
    ),
  );
}
}

Widget FirstSaveListRow(int index){
  if(SavesListIndex() - index < 1) {
    return Container(
      child: Text(" "),
    );
  } else {
    return Container(
      child: Row(
        children: [
          Text(
              "Row""${SavesListIndex() - index}"": ",
              style: TextStyle(
                fontSize: 56,
              ),
          ),
          Text(
              SavesListValueString(SavesListIndex()-index-1),
              style: TextStyle(
                fontSize: 48,
              ),

          ),
        ],
      ),
    );
  }
}
