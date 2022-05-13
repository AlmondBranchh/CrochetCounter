import 'package:flutter/material.dart';
import 'package:crochet_counter/counter.dart';

    List<String> stringList = <String>[];

    class ListSection extends StatefulWidget {
      const ListSection({Key? key}) : super(key: key);

      @override
      State<ListSection> createState() => _ListSectionState();
    }

    class _ListSectionState extends State<ListSection> {
      @override
      Widget build(BuildContext context) {

        void CounterSave(){
          setState((){

              stringList.add("${const CounterSection().CounterValue()}");
          });
        }

        return Column(

        children: [
          ElevatedButton(
            onPressed: CounterSave,
            child: Text("Save"),
          ),
            ListView.builder(
                physics: const ScrollPhysics(),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: stringList.length,
                itemBuilder: (context, int index){
                  return ListTile(
                    title: Text(stringList[index]),
                  );
                }
            ),
        ],
          );
      }
    }
