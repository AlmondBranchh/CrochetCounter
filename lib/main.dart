import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

int counter = 0;
int timerSeconds = 0;
int timerMinutes = 0;
int timerHours = 0;
//branchOffAdded

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Crochet Couter",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Project name"),
        ),
        body: Column(
          children: [
            CounterWidget,
          ],
        )
      ),
    );
  }
}

//Starting widgets from the top of the page to the Bottom

//Timer Widget


Widget TimeWidget = Container(
  child: Row(

  ),
);

//Counter Widgets

Widget CounterWidget = Container(
  alignment: Alignment.center,
  padding: const EdgeInsets.only(top: 50),
  child: const CounterSection(),
);


//Counter stateful
class CounterSection extends StatefulWidget {
  const CounterSection({Key? key}) : super(key: key);

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
    return Row(
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
    );
  }
}








