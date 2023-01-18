import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/widgets/answer.dart';
import 'package:flutter_quiz_app/widgets/question.dart';
import 'package:flutter_quiz_app/screens/result.dart';
import 'package:flutter_quiz_app/types.dart';
import 'package:flutter_quiz_app/widgets/quiz_stopwatch.dart';

class QuestionBoard extends StatefulWidget {
  final String _title;
  final String _quizNo;
  final List<QuestionOption> _questionOptionList;
  final bool? _isStopwatchChecked;

  const QuestionBoard(this._title, this._quizNo, this._questionOptionList,
      this._isStopwatchChecked);

  @override
  State<QuestionBoard> createState() => _QuestionBoardState();
}

class _QuestionBoardState extends State<QuestionBoard> {
  int _questionIndex = 0;
  Map<int, String> _answerMap = Map();
  QuizTime _quizTime = new QuizTime();

  List<Answer> getAnswerWidgets(List<String> options) {
    return options
        .map((o) => Answer(o, () {
              _answerMap[_questionIndex] = o;
              setState(() {
                if (_questionIndex == widget._questionOptionList.length - 1) {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Result(
                            widget._questionOptionList,
                            _answerMap,
                            widget._title,
                            widget._quizNo,
                            _quizTime.timeStr),
                      ));
                  ;
                } else {
                  _questionIndex++;
                }
              });
            }))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    QuestionOption questionOption =
        widget._questionOptionList.elementAt(_questionIndex);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget._title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          widget._isStopwatchChecked == true
              ? QuizStopwatch(_quizTime)
              : SizedBox(
                  height: 15.0,
                ),
          Question((_questionIndex + 1).toString() +
              ") " +
              questionOption.questionText),
          Container(
            margin: EdgeInsets.symmetric(vertical: 50.0),
            child: Column(
              children: getAnswerWidgets(questionOption.answerOptions),
            ),
          ),
        ],
      ),
    );
  }
}
