import 'dart:async';

import 'package:crochet_counter/frontend_ui/colors.dart';
import 'package:flutter/material.dart';
import 'package:crochet_counter/logic/data.dart';

bool timerOn = false;
Timer? timer;
Timer? blinker;
Duration duration = Duration();
Color color = secondColor;

class ClockWidget extends StatefulWidget {
  const ClockWidget({Key? key}) : super(key: key);

  @override
  State<ClockWidget> createState() => _ClockWidgetState();
}

class _ClockWidgetState extends State<ClockWidget> {
  @override
  Widget build(BuildContext context) {

    void addTime(){
      final seconds = GetProjectTimer().inSeconds + 1;
      SetProjectTime(Duration(seconds: seconds));
      setState((){
      });
    }

    void startTimer(){
      color = firstColor;
      timer = Timer.periodic(Duration(seconds: 1),(_) => addTime());
    }

    void blink(){
      if(color == secondColor){
        color = firstColor;
        setState((){});
      } else {
        color = secondColor;
        setState((){});
      }
    }

    void startBlink(){
      blinker = Timer.periodic(Duration(seconds: 1), (_) => blink());
    }

    void toggleTimer(){
        if (timerOn == false){
          startTimer();
          blinker?.cancel();
          timerOn = true;
        }
        else{
          startBlink();
          timer?.cancel();
          timerOn = false;
        }
    }

    return Padding(
      padding: const EdgeInsets.only(
        top: 8,
        left: 8,
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: thirdColor,
          fixedSize: Size(140, 40),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(7))
          )
        ),
        onPressed: toggleTimer,
        child: Text(
          "${GetProjectTimer().inHours.toString().padLeft(2, "0")}:"+
          "${GetProjectTimer().inMinutes.remainder(60).toString().padLeft(2, "0")}:"
          "${GetProjectTimer().inSeconds.remainder(60).toString().padLeft(2, "0")}",
              style: TextStyle(
                color: color,
                fontFamily: "Inter",
                    fontSize: 24,
              ),
        ),
      ),
    );
  }
}
