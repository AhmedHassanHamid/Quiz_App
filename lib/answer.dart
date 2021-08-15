import 'package:flutter/material.dart';

import 'main.dart';

class Answer extends StatelessWidget {
  final String answerText;
  final Function x;

  Answer(this.x, this.answerText);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        child: RaisedButton(
          color: bl,
          textColor: Colors.white,
          child: Text(
            answerText,
            style: TextStyle(fontSize: 25, color: w),
          ),
          onPressed: x,
        ));
  }
}
