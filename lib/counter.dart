import 'package:flutter/material.dart';

int counter = 0;

class CounterSection extends StatefulWidget {
  const CounterSection({Key? key}) : super(key: key);

  int CounterValue(){
    return counter;
  }

  @override
  State<CounterSection> createState() => _CounterSectionState();
}

class _CounterSectionState extends State<CounterSection> {
  @override
  Widget build(BuildContext context) {
    void _counterSub(){
      setState((){
        counter --;
      });
    }
    void _counterAdd(){
      setState((){
        counter ++;
      });
    }
    void _counterClear(){
      setState((){
        counter = 0;
      });
    }

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

          onPressed: _counterSub,
          child: const Icon(Icons.arrow_back_ios_rounded),


        ),ElevatedButton(
          style: ElevatedButton.styleFrom(
            fixedSize: const Size(250, 250),
            shape: const CircleBorder(),
          ),

          onPressed: _counterAdd,
          child: Text(
            "$counter",
            style: TextStyle(fontSize: 64),
          ),


        ),ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.red,
              fixedSize: const Size(50, 50),
              shape: const CircleBorder(),
            ),

            onPressed: _counterClear,
            child: Icon(Icons.clear)
        ),
        ],
      )
    );
  }
}