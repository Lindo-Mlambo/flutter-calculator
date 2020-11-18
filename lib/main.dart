import 'package:flutter/material.dart';
import './ScreenWidget.dart';
import './KeypadWidget.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Calculator',
      home: MyCalculator(),
    ),
  );
}

class MyCalculator extends StatefulWidget {
  @override
  _MyCalculatorState createState() => _MyCalculatorState();
}

class _MyCalculatorState extends State<MyCalculator> {
  String _answer = "";
  String _query = "";

  void _handleInput(String buttonValue) {
    setState(() {
      if (_isNumeric(buttonValue) || buttonValue == '.') {
        _query += buttonValue;
        _answer = _evaluate(_query).toString();
      } else {
        if (buttonValue == '=') {
          _query = _evaluate(_query).toString();
          _answer = "";
        } else if (buttonValue == 'DEL') {
          _answer = "";
          _query = _query.substring(0, _query.length - 1);
        } else if (buttonValue == 'C') {
          _query = '';
          _answer = "";
        } else {
          int charIndex = "/X+".indexOf(_query[_query.length - 1]);
          if (charIndex > -1) {
            _query = _query.substring(0, _query.length - 1);
          }
          _query += buttonValue;
        }
      }
    });
  }

  double _evaluate(String payload) {
    var operands;

    // BODMAS
    if (payload.indexOf('+') > -1) {
      operands = payload.split('+');
      return _evaluate(operands[0]) + _evaluate(operands.sublist(1).join('+'));
    } else if (payload.indexOf('-') != -1) {
      operands = payload.split("-");
      return _evaluate(operands[0]) - _evaluate(operands.sublist(1).join('-'));
    } else if (payload.indexOf('X') != -1) {
      operands = payload.split("X");
      return _evaluate(operands[0]) * _evaluate(operands.sublist(1).join('*'));
    } else if (payload.indexOf('/') != -1) {
      operands = payload.split('/');
      return _evaluate(operands[0]) / _evaluate(operands.sublist(1).join('/'));
    }
    double result = double.tryParse(payload);
    return result == null ? 0 : result;
  }

  bool _isNumeric(String value) {
    if (value == null) return false;
    return double.tryParse(value) != null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        toolbarHeight: 120,
        backgroundColor: Colors.black,
        title: Container(
          margin: EdgeInsets.only(top: 30, left: 15),
          child: Text(
            'Calculator',
            style: TextStyle(
              color: Colors.white,
              fontSize: 68,
            ),
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(15, 20, 15, 20),
        color: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: ScreenWidget(
                query: _query,
                answer: _answer,
              ),
            ),
            Expanded(
              child: Keypad(
                handleInput: _handleInput,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
