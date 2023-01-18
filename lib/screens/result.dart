import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/screens/quiz_dialog_route.dart';
import 'package:flutter_quiz_app/widgets/result_dialog.dart';
import 'package:flutter_quiz_app/types.dart';

class Result extends StatefulWidget {
  final List<QuestionOption> _questionOptionsList;
  final Map<int, String> _answerMap;
  final String _category;
  final String _quizNo;
  final String quizTime;

  const Result(this._questionOptionsList, this._answerMap, this._category,
      this._quizNo, this.quizTime);

  @override
  State<Result> createState() =>
      _ResultState(_questionOptionsList, _answerMap, _category, _quizNo);
}

class _ResultState extends State<Result> {
  final List<QuestionOption> _questionOptionsList;
  final Map<int, String> _answerMap;
  final String _category;
  final String _quizNo;

  _ResultState(
      this._questionOptionsList, this._answerMap, this._category, this._quizNo);

  void getResultDetails() {}

  @override
  void initState() {
    super.initState();

    int score = 0;
    for (int i = 0; i < widget._questionOptionsList.length; i++) {
      if (widget._answerMap[i]?.toLowerCase() ==
          widget._questionOptionsList.elementAt(i).answerText.toLowerCase()) {
        score++;
      }
    }

    Timer(Duration(seconds: 1), () {
      Navigator.push(
          context,
          QuizDialogRoute(
            builder: (context) => ResultDialog(
                score,
                widget._questionOptionsList.length,
                this._category,
                this._quizNo,
                widget.quizTime),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Result'),
      ),
      body: ListView.separated(
        itemBuilder: (context, index) {
          QuestionOption _questionOption =
              _questionOptionsList.elementAt(index);

          String answerValue =
              "Answer Selected : " + _answerMap[index].toString();
          String correctValue =
              "Correct Answer : " + _questionOption.answerText;

          Color ansColor = Colors.red;

          if (_questionOption.answerText.toLowerCase() ==
              _answerMap[index]?.toLowerCase()) {
            ansColor = Colors.green;
            correctValue = "";
          }

          return Container(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: [
                Text(
                  _questionOptionsList.elementAt(index).questionText,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                ),
                Column(
                  children: [
                    Text(
                      answerValue,
                      style: TextStyle(color: ansColor),
                    ),
                    Text(
                      correctValue,
                      style: TextStyle(color: Colors.green),
                    )
                  ],
                )
              ],
            ),
          );
        },
        separatorBuilder: (context, index) {
          return Divider(
            height: 4,
          );
        },
        itemCount: _questionOptionsList.length,
      ),
    );
  }
}
