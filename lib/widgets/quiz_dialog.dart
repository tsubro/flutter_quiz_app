import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/screens/question_board.dart';
import 'package:flutter_quiz_app/types.dart';

class QuizDialog extends StatelessWidget {
  final String _title;
  final List<List<QuestionOption>>? _questionOptionList;
  final bool? _isStopwatchChecked;

  const QuizDialog(
      this._title, this._questionOptionList, this._isStopwatchChecked);

  List<Container> _getQuizList(BuildContext context) {
    List<List<QuestionOption>> _questionOpList = [];

    _questionOptionList?.forEach((element) {
      _questionOpList.add(element);
    });

    List<Container> quizList = [];

    for (int i = 0; i < _questionOpList.length; i++) {
      String quizNo = 'Quiz ' + (i + 1).toString();
      List<QuestionOption> _qOpList = _questionOpList.elementAt(i);
      _qOpList.shuffle();
      quizList.add(
        Container(
          padding: EdgeInsets.all(10.0),
          width: double.infinity,
          child: OutlinedButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => QuestionBoard(
                            _title, quizNo, _qOpList, _isStopwatchChecked)));
              },
              child: Text(quizNo)),
        ),
      );
    }
    return quizList;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Dialog(
        child: Column(
          children: _getQuizList(context),
        ),
      ),
    );
  }
}
