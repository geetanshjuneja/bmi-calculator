import 'dart:ui';

import 'package:bmi_calculator/reuseable_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ResultPage extends StatelessWidget {

  ResultPage(this.bmiCalculated,this.resultText,this.interpretation);

  final String bmiCalculated;
  final String resultText ;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:  Color(0xFF0A0E21),
        title: Text(
          'BMI CALCULATOR'
        ),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    'YOUR RESULT',
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                    ),

                  ),
                ),
              ),
            ),
            Expanded(child: ReuseableCard(Color(0xFF1D1E33),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  resultText,
                  style: TextStyle(
                    color: Color(0xFF24D876),
                    fontWeight: FontWeight.bold,
                    fontSize: 22.0,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  bmiCalculated,
                  style: TextStyle(
                    fontSize: 100.0,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                 interpretation,
                  style: TextStyle(
                    fontSize: 22.0,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            ),
              flex: 5,),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  child: Center(
                    child: Text(
                      'RE-CALCULATE',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 50.0,
                      ),
                    ),
                  ),
                  color: Color(0xFFE81555),
                  margin: EdgeInsets.all(10.0),
                  width: double.infinity,
                  height: 80,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
