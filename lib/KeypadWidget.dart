import 'package:flutter/material.dart';

class Keypad extends StatelessWidget {
  Keypad({Key key, @required this.handleInput}) : super(key: key);

  final ValueChanged<String> handleInput;

  bool _isMathOp(String op) {
    final ops = "/X-+%";

    return ops.indexOf(op) > -1;
  }

  bool _isNumeric(String value) {
    if (value == null) return false;
    return double.tryParse(value) != null;
  }

  bool _isSpecialOp(String op) {
    final ops = "C DEL";

    return ops.indexOf(op) > -1;
  }

  TextStyle getStyle(String key) {
    if (_isMathOp(key)) {
      return TextStyle(
        color: Colors.green[400],
        fontSize: 28,
      );
    }
    if (_isSpecialOp(key)) {
      return TextStyle(
        color: Colors.orange[700],
        fontSize: 28,
      );
    }

    return TextStyle(
      color: Colors.white,
      fontSize: 28,
    );
  }

  GestureDetector _buildKey(String icon, String value) {
    return GestureDetector(
      onTap: () => handleInput(value),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(40.0),
              ),
              color: (value == "=" ? Colors.green[400] : Colors.grey[700]),
            ),
            width: (value == "=" ? 165 : 80),
            height: 60,
            alignment: Alignment.center,
            child: Text('$icon', style: getStyle(value)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildKey("C", "C"),
                _buildKey("DEL", "DEL"),
                _buildKey("%", "%"),
                _buildKey("/", "/")
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildKey("7", "7"),
                _buildKey("8", "8"),
                _buildKey("9", "9"),
                _buildKey("X", "X")
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildKey("4", "4"),
                _buildKey("5", "5"),
                _buildKey("6", "6"),
                _buildKey("-", "-")
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildKey("1", "1"),
                _buildKey("2", "2"),
                _buildKey("3", "3"),
                _buildKey("+", "+")
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildKey("0", "0"),
                _buildKey(".", "."),
                // _buildKey("+/-", "+/-"),
                _buildKey("=", "=")
              ],
            ),
          ),
        ],
      ),
    );
  }
}
