import 'dart:async';

import 'package:crochet_counter/frontend_ui/colors.dart';
import 'package:flutter/material.dart';

bool timerOn = false;
Timer? timer;
Duration duration = Duration(seconds: 0);

class ClockWidget extends StatefulWidget {
  const ClockWidget({Key? key}) : super(key: key);

  @override
  State<ClockWidget> createState() => _ClockWidgetState();
}

class _ClockWidgetState extends State<ClockWidget> {
  @override
  Widget build(BuildContext context) {

    void addTime(){
      final seconds = duration.inSeconds + 1;
      duration = Duration(seconds: seconds);
      setState((){
      });
    }

    void startTimer(){
      timer = Timer.periodic(Duration(seconds: 1),(_) => addTime());
    }

    void toggleTimer(){
        if (timerOn == false){startTimer(); timerOn = true; }
        else{timer?.cancel(); timerOn = false;}
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
          "${duration.inHours.toString().padLeft(2, "0")}:"+
          "${duration.inMinutes.remainder(60).toString().padLeft(2, "0")}:"
          "${duration.inSeconds.remainder(60).toString().padLeft(2, "0")}",
              style: TextStyle(
                color: firstColor,
                fontFamily: "Inter",
                    fontSize: 24,
              ),
        ),
      ),
    );
  }
}
