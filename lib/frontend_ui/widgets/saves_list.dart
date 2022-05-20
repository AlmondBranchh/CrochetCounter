import 'package:crochet_counter/logic/data.dart';
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
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
            style: ElevatedButton.styleFrom(
              fixedSize: Size(150, 50),
              shape: RoundedRectangleBorder(),
            ),
            onPressed: (){
              setState((){
                AddCounterValueToSavesList();
              });
              },
            child: Text(
                "Save",
              style: TextStyle(
                fontSize: 24,
              ),
            )
        ),
        savesListSection(context),

      ],
    );
  }
}

Widget savesListSection(BuildContext context){

  return ListView.builder(
    scrollDirection: Axis.vertical,
    shrinkWrap: true,
    itemCount: GetItemCount(),
    itemBuilder: (context, index){
      return saveListTile(index);
    }
  );
}

Widget saveListTile(int index){
  return ListTile(
    title: Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child:  Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          SavesListNameString(index),
          style: TextStyle(
            fontSize: GetFontSize(index)
          ),
        ),
        Text(
          SavesListValueString(index),
          style:  TextStyle(
              fontSize: GetFontSize(index)
          ),
        ),
      ],
    )
    )
  );
}

/*Widget FirstSaveListRow(int index){
  if(SavesListIndex() - index < 1) {
    return Container(
      child: Text(" "),
    );
  } else {
    return Container(
      child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
        children: [
          Text(
              "Row""${SavesListIndex() - index}"": ",
              style: TextStyle(
                fontSize: 64,
              ),
          ),
          Text(
              SavesListValueString(SavesListIndex()-index-1),
              style: TextStyle(
                fontSize: 56,
              ),

          ),
        ],
      ),
    );
  }
}

 */
