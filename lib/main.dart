import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.green,
        appBar: AppBar(
          title: const Text('My Dice Game'),
          backgroundColor: Colors.teal,
        ),
        body: const DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  const DicePage({Key? key}) : super(key: key);

  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;
  int score = 6;
  String log = 'Score : 6';

  void changeDiceFace() {
    setState(() {
      leftDiceNumber = Random().nextInt(6) + 1;
      rightDiceNumber = Random().nextInt(6) + 1;
      if (leftDiceNumber == rightDiceNumber) {
        score += 4;
      } else if ((leftDiceNumber + rightDiceNumber) % 2 == 0) {
        score += 1;
      } else if ((leftDiceNumber + rightDiceNumber) % 2 == 1) {
        score -= 2;
      }
      if (score >= 0 && score < 12) {
        log = 'Score : $score';
      } else if (score < 0) {
        log = "You don't have good luck today";
      } else if (score >= 12) {
        log = "Yay, you won!!!";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            log,
            style: TextStyle(
              fontSize: 80.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'Pacifico',
              color: Colors.blueGrey.shade800,
            ),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: TextButton(
                  child: Image.asset(
                    'images/dice$leftDiceNumber.png',
                  ),
                  onPressed: () {
                    changeDiceFace();
                  },
                ),
              ),
              Expanded(
                child: TextButton(
                  child: Image.asset(
                    'images/dice$rightDiceNumber.png',
                  ),
                  onPressed: () {
                    changeDiceFace();
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
