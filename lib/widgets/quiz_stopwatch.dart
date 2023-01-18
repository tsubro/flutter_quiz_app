import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/types.dart';

class QuizStopwatch extends StatefulWidget {
  QuizTime _quizTime;
  QuizStopwatch(this._quizTime);

  @override
  State<QuizStopwatch> createState() => _StopwatchState();
}

class _StopwatchState extends State<QuizStopwatch> {
  late Stopwatch stopwatch;
  late Timer timer;

  String returnFormatedText() {
    var milli = stopwatch.elapsed.inMilliseconds;
    String second = ((milli ~/ 1000) % 60).toString().padLeft(2, "0");
    String minute = (((milli ~/ 1000) ~/ 60) % 60).toString().padLeft(2, "0");
    widget._quizTime.timeStr = "$minute:$second";
    return "$minute:$second";
  }

  @override
  void initState() {
    super.initState();
    stopwatch = Stopwatch();

    stopwatch.start();

    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
    stopwatch.stop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topRight,
      padding: EdgeInsets.all(2.0),
      child: Container(
        child: Container(
          padding: EdgeInsets.all(7),
          child: Text(
            returnFormatedText(),
            style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
                color: Colors.black54),
          ),
        ),
      ),
    );
  }
}
