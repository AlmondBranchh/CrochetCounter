import 'package:crochet_counter/logic/data.dart';
import 'package:flutter/material.dart';
import 'package:crochet_counter/frontend_ui/colors.dart';
import 'package:crochet_counter/frontend_ui/screens/row_editor.dart';


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
              primary: thirdColor,
              fixedSize: Size(260, 56),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15))
              ),
              
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
                color: firstColor
              ),
            )
        ),
              ListView.builder(
              physics: ScrollPhysics(),
    scrollDirection: Axis.vertical,
    shrinkWrap: true,
    itemCount: GetSaveList().length,
    itemBuilder: (context, index){
    return ListTile(
    title: Padding(
    padding: EdgeInsets.symmetric(vertical: 8),
    child:  Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
    Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
    Text(
    SavesListNameString(index),
    style: TextStyle(
    fontFamily: "Inter",
    color: firstColor,
    fontSize: GetFontSize(index)
    ),
    ),
    Text(
    SavesListValueString(index),
    style:  TextStyle(
    fontFamily: "Inter",
    color: firstColor,
    fontSize: GetFontSize(index)+12
    ),
    ),
    ],
    ),
    Container(
    width: 375,
    height: 2,
    decoration: BoxDecoration(
    color: firstColor,
    borderRadius: BorderRadius.all(Radius.circular(4))
    ),
    )
    ],
    )
    ),
    onLongPress: (){
      SetSelectedRowIndex(index);
    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => RowEditor())
    ).then((value) => setState((){}));
    },
    );
    }
    ),
      ],
    );
  }
}




