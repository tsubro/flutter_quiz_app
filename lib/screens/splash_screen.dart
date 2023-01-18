import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_quiz_app/widgets/app_progress_indicator.dart';
import 'package:flutter_quiz_app/screens/home_dashboard.dart';
import 'package:flutter_quiz_app/types.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final List<String> _subjectList = [
    "history",
    "philosophy",
    "general_knowledge",
    "english_grammar",
    "history",
    "philosophy",
    "general_knowledge",
    "english_grammar",
    "history",
    "philosophy",
    "general_knowledge",
    "english_grammar"
  ];
  final Map<String, List<List<QuestionOption>>> _questionOptionMap = Map();

  Future<void> _readJson() async {
    for (int i = 0; i < _subjectList.length; i++) {
      String response = await rootBundle
          .loadString('assets/' + _subjectList[i] + '_question.json');
      final questionMap = await json.decode(response);
      List quiz = questionMap['quiz'];

      List<List<QuestionOption>> questionsList = [];

      quiz.forEach((element) {
        List<QuestionOption> questionOptionList = [];
        List quizOptions = element['quizOptions'];

        quizOptions.forEach((element) {
          questionOptionList.add(QuestionOption.fromJson(element));
        });
        questionsList.add(questionOptionList);
      });
      _questionOptionMap[_subjectList[i]] = questionsList;
    }
  }

  @override
  void initState() {
    super.initState();
    _readJson();
    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) =>
                HomeDashboard(_questionOptionMap, _subjectList),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue,
        child: Center(
          child: Container(
            margin: EdgeInsets.all(50.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Quiz Master',
                  style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                AppProgressIndicator()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
