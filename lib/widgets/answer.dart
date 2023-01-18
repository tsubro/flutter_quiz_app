import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final String _answerText;
  final VoidCallback _selectHandler;

  Answer(this._answerText, this._selectHandler);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 10.0),
      child: OutlinedButton(
        onPressed: _selectHandler,
        child: Text(_answerText),
      ),
    );
  }
}
