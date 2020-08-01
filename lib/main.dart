
import 'dart:io';

import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Center(child: Text('Dice')),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int ldn = 1;
  int rdn = 4;
  int total;
  void rand() {
    ldn = Random().nextInt(6) + 1;
    rdn = Random().nextInt(6) + 1;
    total = ldn + rdn;
  }

  String mood() {
    if (total > 5) {
      return 'Icons.mood,';
    } else {
      return 'Icons.mood_bad,';
    }
  }

  @override
  Widget build(BuildContext context) {
    rand();
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: FlatButton(
                    onPressed: () {
                      setState(() {
                        rand();
                      });
                    },
                    child: Image.asset('images/dice$ldn.png')),
              ),
              Expanded(
                child: FlatButton(
                    onPressed: () {
                      setState(() {
                        rand();
                      });
                    },
                    child: Image.asset('images/dice$rdn.png')),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListTile(
              leading: Icon(
                Icons.mood,
              ),
              trailing: Icon(
                Icons.mood,
              ),
              title: Center(
                child: Text(
                  '$total',
                  style: TextStyle(
                    fontSize: 32,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}