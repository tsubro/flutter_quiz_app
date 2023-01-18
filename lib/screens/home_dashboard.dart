import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/widgets/quiz_dialog.dart';
import 'package:flutter_quiz_app/screens/quiz_dialog_route.dart';
import 'package:flutter_quiz_app/types.dart';

class HomeDashboard extends StatelessWidget {
  final Map<String, List<List<QuestionOption>>> _questionOptionMap;
  final List<String> _subjectList;
  bool? _isStopwatchChecked = false;

  HomeDashboard(this._questionOptionMap, this._subjectList);

  String _getTitle(String subject) {
    List<String> split = subject.split("_");

    String title = "";
    split.forEach((subject) {
      title = title +
          subject.substring(0, 1).toUpperCase() +
          subject.substring(1) +
          " ";
    });
    return title.trim();
  }

  List<Container> _getGridSubjectWidgets(BuildContext context) {
    return _subjectList
        .map(
          (subject) => Container(
            padding: EdgeInsets.all(15.0),
            child: InkWell(
              splashColor: Colors.black26,
              onTap: (() {
                Navigator.push(
                  context,
                  QuizDialogRoute(
                    builder: (context) {
                      return QuizDialog(_getTitle(subject),
                          _questionOptionMap[subject], _isStopwatchChecked);
                    },
                  ),
                );
              }),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Ink.image(
                    image: AssetImage('assets/img/' + subject + '.jpeg'),
                    fit: BoxFit.cover,
                    height: 140,
                    width: 200,
                  ),
                  Text(
                    _getTitle(subject),
                    style: TextStyle(fontSize: 15, color: Colors.black26),
                  ),
                ],
              ),
            ),
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Quiz'),
          actions: [
            PopupMenuButton(
              itemBuilder: ((context) => <PopupMenuEntry>[
                    PopupMenuItem(
                      child: StatefulBuilder(
                        builder: (BuildContext context, StateSetter setState) =>
                            Row(
                          children: [
                            Checkbox(
                                value: _isStopwatchChecked,
                                onChanged: (isChecked) {
                                  setState(
                                    () => this._isStopwatchChecked = isChecked!,
                                  );
                                }),
                            Text('Stopwatch'),
                          ],
                        ),
                      ),
                    ),
                  ]),
            ),
          ],
        ),
        body: Container(
          child: GridView(
            children: _getGridSubjectWidgets(context),
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          ),
        ));
  }
}
