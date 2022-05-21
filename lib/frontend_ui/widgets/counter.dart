import 'package:flutter/material.dart';
import 'package:crochet_counter/logic/data.dart';
import 'package:crochet_counter/frontend_ui/widgets/manual_counter_change.dart';
import 'package:flutter/services.dart';
import 'package:crochet_counter/frontend_ui/colors.dart';
import 'dart:math' as math;

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
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max ,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: secondColor,
            fixedSize: const Size(60, 60),
            shape: const CircleBorder(),
          ),

          onPressed: () {
            setState((){
            SubFromCounter();
          });
            },
            child: Container(
                            width: 26,
                            height: 8,
                            decoration: BoxDecoration(
                              borderRadius : BorderRadius.only(
                                topLeft: Radius.circular(3),
                                topRight: Radius.circular(3),
                                bottomLeft: Radius.circular(3),
                                bottomRight: Radius.circular(3),
                              ),
                              color : Color.fromRGBO(133, 88, 111, 1),
                            )
                        )
                    ),

        ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: secondColor,
            fixedSize: const Size(230, 230),
            shape: const CircleBorder(),
          ),

          onPressed: () {setState((){
            AddToCounter();
          });
            HapticFeedback.lightImpact();
            },
          onLongPress: (){
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return ManualCounterEditor();
              }
            ).then((value) => setState((){})
            );
            HapticFeedback.mediumImpact();
          },
          child: Text(
            GetCounterValueString(),
            style: TextStyle(
              fontFamily: "Inter",
                fontWeight: FontWeight.bold,
                fontSize: 86,
              color: fourthColor
            ),
          ),


        ),ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: secondColor,
              fixedSize: const Size(60, 60),
              shape: const CircleBorder(),
            ),

            onPressed: (){setState((){
              ClearCounter();
            });
              },
            child: Stack(
    children: <Widget>[
    Positioned(
    top: 25,
    left: 2,
    child: Transform.rotate(
    angle: 45 * (math.pi / 180),
    child: Container(
    width: 28,
    height: 8,
    decoration: BoxDecoration(
    borderRadius : BorderRadius.only(
    topLeft: Radius.circular(3),
    topRight: Radius.circular(3),
    bottomLeft: Radius.circular(3),
    bottomRight: Radius.circular(3),
    ),
    color : Color.fromRGBO(133, 88, 111, 1),
    )
    ),
    )
    ),Positioned(
    top: 25,
    left: 2,
    child: Transform.rotate(
    angle: -45 * (math.pi / 180),
    child: Container(
    width: 28,
    height: 8,
    decoration: BoxDecoration(
    borderRadius : BorderRadius.only(
    topLeft: Radius.circular(3),
    topRight: Radius.circular(3),
    bottomLeft: Radius.circular(3),
    bottomRight: Radius.circular(3),
    ),
    color : Color.fromRGBO(133, 88, 111, 1),
    )
    ),
    )
    ),
    ]
    )
    ),
    ]
    )
    );
  }
}