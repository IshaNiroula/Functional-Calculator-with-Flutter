import 'package:calculator/widget/buttons.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(MaterialApp(
    title: 'Calculator',
    debugShowCheckedModeBanner: false,
    home: Calculator(),
  ));
}

class Calculator extends StatefulWidget {
  Calculator({Key key}) : super(key: key);
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  final digitColor = Colors.black;
  final charColor = Colors.white;
  final backgroundColor = Colors.black38;

  String _uppertext = '';
  String _resulttext = '';

  void numClick(String digits) {
    setState(() {
      _resulttext += digits;
    });
  }

  void allClear(String digits) {
    setState(() {
      _resulttext = '';
      _uppertext = '';
    });
  }

  void clear(String digits) {
    setState(() {
      _resulttext = '';
    });
  }

  void evaluate(String digits) {
    Parser p = Parser();
    Expression exp = p.parse(_resulttext);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);

    setState(() {
      _uppertext = _resulttext;
      _resulttext = eval.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[300],
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              padding: EdgeInsets.only(right: 12),
              child: Text(
                _uppertext,
                style: TextStyle(
                  fontSize: 25,
                  letterSpacing: 2.0,
                  color: Colors.black38,
                ),
              ),
              alignment: Alignment(1, 1),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.only(right: 12),
              child: Text(
                '$_resulttext',
                style: TextStyle(
                  fontSize: 35,
                  color: Colors.black87,
                ),
              ),
              alignment: Alignment(1, 1),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CalculatorButton(
                  digits: 'AC',
                  colors: digitColor,
                  backgroundColors: backgroundColor,
                  callback: allClear,
                ),
                CalculatorButton(
                  digits: 'C',
                  colors: digitColor,
                  backgroundColors: backgroundColor,
                  callback: clear,
                ),
                CalculatorButton(
                  digits: '%',
                  colors: digitColor,
                  backgroundColors: backgroundColor,
                  callback: numClick,
                ),
                CalculatorButton(
                  digits: '/',
                  colors: digitColor,
                  backgroundColors: backgroundColor,
                  callback: numClick,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CalculatorButton(
                  digits: '7',
                  colors: digitColor,
                  callback: numClick,
                ),
                CalculatorButton(
                  digits: '8',
                  colors: digitColor,
                  callback: numClick,
                ),
                CalculatorButton(
                  digits: '9',
                  colors: digitColor,
                  callback: numClick,
                ),
                CalculatorButton(
                  digits: '*',
                  colors: digitColor,
                  backgroundColors: backgroundColor,
                  callback: numClick,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CalculatorButton(
                  digits: '4',
                  colors: digitColor,
                  callback: numClick,
                ),
                CalculatorButton(
                  digits: '5',
                  colors: digitColor,
                  callback: numClick,
                ),
                CalculatorButton(
                  digits: '6',
                  colors: digitColor,
                  callback: numClick,
                ),
                CalculatorButton(
                  digits: '-',
                  colors: digitColor,
                  backgroundColors: backgroundColor,
                  callback: numClick,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CalculatorButton(
                  digits: '1',
                  colors: digitColor,
                  callback: numClick,
                ),
                CalculatorButton(
                  digits: '2',
                  colors: digitColor,
                  callback: numClick,
                ),
                CalculatorButton(
                  digits: '3',
                  colors: digitColor,
                  callback: numClick,
                ),
                CalculatorButton(
                  digits: '+',
                  colors: digitColor,
                  backgroundColors: backgroundColor,
                  callback: numClick,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CalculatorButton(
                  digits: '.',
                  colors: digitColor,
                  callback: numClick,
                ),
                CalculatorButton(
                  digits: '0',
                  colors: digitColor,
                  callback: numClick,
                ),
                CalculatorButton(
                  digits: '00',
                  colors: digitColor,
                  callback: numClick,
                ),
                CalculatorButton(
                  digits: '=',
                  colors: digitColor,
                  backgroundColors: backgroundColor,
                  callback: evaluate,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
