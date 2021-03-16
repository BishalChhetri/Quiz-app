import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;

  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    String resultText;
    if (resultScore <= 20) {
      resultText = 'You are awesome and innocent! & your score is $resultScore';
    } else if (resultScore <= 25) {
      resultText = 'Pretty likeable! & your score is $resultScore';
    } else if (resultScore <= 30) {
      resultText = 'You are ... strange?! & your score is $resultScore';
    } else {
      resultText = 'You are so bad! & your score is $resultScore';
    }

    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          FlatButton(
            child: Text(
              'Restart Quiz!',
            ),
            textColor: Colors.blue,
            onPressed: resetHandler,
          ),
        ],
      ),
    );
  }
}
