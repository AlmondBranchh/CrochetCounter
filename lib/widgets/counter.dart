import 'package:flutter/material.dart';
import 'package:crochet_counter/data.dart';

class CounterSection extends StatefulWidget {
  const CounterSection({Key? key}) : super(key: key);

  @override
  State<CounterSection> createState() => _CounterSectionState();
}

class _CounterSectionState extends State<CounterSection> {
  @override
  Widget build(BuildContext context) {

    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.only(top: 50),
      child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.min ,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.blue,
            fixedSize: const Size(65, 65),
            shape: const CircleBorder(),
          ),

          onPressed: () {setState((){
            SubFromCounter();
          });
            },
          child: const Icon(Icons.arrow_back_ios_rounded),


        ),ElevatedButton(
          style: ElevatedButton.styleFrom(
            fixedSize: const Size(250, 250),
            shape: const CircleBorder(),
          ),

          onPressed: () {setState((){
            AddToCounter();
          });
            },
          child: Text(
            GetCounterValueString(),
            style: TextStyle(fontSize: 84),
          ),


        ),ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.red,
              fixedSize: const Size(50, 50),
              shape: const CircleBorder(),
            ),

            onPressed: (){setState((){
              ClearCounter();
            });
              },
            child: Icon(Icons.clear)
        ),
        ],
      )
    );
  }
}