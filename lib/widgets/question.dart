import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String _questionText;

  const Question(this._questionText);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 5.0),
        child: Text(
          _questionText,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20, color: Colors.black87),
        ),
      ),
    );
  }
}
