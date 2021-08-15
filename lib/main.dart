import 'package:flutter/material.dart';
import 'package:quiz_app/question.dart';
import 'package:quiz_app/quiz.dart';
import 'package:quiz_app/result.dart';
import 'answer.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  State<MyApp> createState() => _MyAppState();
}
  Color w = Colors.white;
  Color b = Colors.black;
  Color bl = Colors.blue;
  Color r = Colors.red;

class _MyAppState extends State<MyApp> {

  bool isSwitched = false;
  int _totalScore = 0;
  int _questionIndex = 0;
  int num = 0, num1 = 0, num2 = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
      num = 0;
      num1 = 0;
      num2 = 0;
    });
  }

  void answerQuestion(score) {
    if(_questionIndex==0) num = score;
    else if(_questionIndex==1) num1 = score;
    else if(_questionIndex==2) num2 = score;
    num = score;
    _totalScore += score;
    setState(() {
      _questionIndex += 1;
    });
  }

  final List<Map<String, Object>> _question = [
    {
      'questionText': 'What\'s your favorit color?',
      'answers': [
        {'text': 'Black', 'score': 40},
        {'text': 'Green', 'score': 30},
        {'text': 'Yellow', 'score': 20},
        {'text': 'blue', 'score': 10}
      ]
    },
    {
      'questionText': 'What\'s your favorit animal?',
      'answers': [
        {'text': 'Rabbit', 'score': 40},
        {'text': 'Tiger', 'score': 30},
        {'text': 'Elephent', 'score': 20},
        {'text': 'Lion', 'score': 10}
      ]
    },
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor:bl,
          title: Text("Quiz App", style: TextStyle(color: w)),
          actions: [
            Switch(
              value: isSwitched,
              onChanged:(value){
                setState(() {
                  isSwitched = value;
                  if(isSwitched==true){b=Colors.white ; w=Colors.black; bl=Colors.red; r=Colors.blue;}
                  if(isSwitched==false){b=Colors.black; w=Colors.white; bl=Colors.blue; r=Colors.red;}
                });
              },
              activeColor: Colors.white,
                inactiveThumbColor: Colors.black,
                inactiveTrackColor: Colors.grey,
             )
          ],
        ),
        body: Container(
        color: w,
            child: _questionIndex < _question.length
                ? Quiz(_question, _questionIndex, answerQuestion)
                : Result(_resetQuiz, _totalScore)),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.arrow_back , color: w),
          onPressed: (){
            if(_questionIndex==1) _totalScore -= num;
            if(_questionIndex==2) _totalScore -= num1;
            if(_questionIndex==3) _totalScore -= num2;
            setState((){
              if(_questionIndex > 0){
                _questionIndex --;
              }
            });
          },
      ),
    ));
    }
}
    

