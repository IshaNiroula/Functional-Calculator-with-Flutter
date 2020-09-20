import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {  
  final String digits;
  final Color colors;
  final Color backgroundColors;
  final Function callback;
  const CalculatorButton({
    Key key,
    this.digits,
    this.colors,
    this.backgroundColors,
    this.callback,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: SizedBox(
        height: 60,
        width: 60,
        child: FlatButton(
          onPressed: () {
            callback(digits);
          },
          child: Text(
            digits,
            style: TextStyle(
              fontSize: 20.0,
              color: colors,
            ),
          ),
          color: backgroundColors,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
      ),
    );
  }
}
