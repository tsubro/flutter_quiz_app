import 'package:flutter/material.dart';

class ResultDialog extends StatelessWidget {
  final int _totalScore;
  final int _totalNumberOfQuestions;
  final String _category;
  final String _quizNo;
  final String quizTime;

  ResultDialog(this._totalScore, this._totalNumberOfQuestions, this._category,
      this._quizNo, this.quizTime);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Center(
        child: SimpleDialog(
          contentPadding: EdgeInsets.all(10.0),
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text("Category : " + _category.toString()),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text("Quiz No : " + _quizNo.toString()),
            ),
            quizTime == ""
                ? SizedBox(
                    height: 0,
                  )
                : Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text("Time Taken : " + quizTime),
                  ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text("Total Number of Questions : " +
                  _totalNumberOfQuestions.toString()),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text("Total Score : " +
                  _totalScore.toString() +
                  "/" +
                  _totalNumberOfQuestions.toString()),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text("Percentage (%) : " +
                  (_totalScore / _totalNumberOfQuestions * 100)
                      .toStringAsFixed(0)),
            ),
          ],
        ),
      ),
    );
  }
}
