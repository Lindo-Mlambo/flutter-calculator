import 'package:flutter/material.dart';

class ScreenWidget extends StatelessWidget {
  ScreenWidget({Key key, @required this.query, @required this.answer})
      : super(key: key);

  final String answer;
  final String query;

  @override
  Widget build(BuildContext context) {
    Row answerRow = Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          '$answer',
          style: TextStyle(
            color: Colors.white,
            fontSize: 50,
          ),
        ),
      ],
    );

    Row queryRow = Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          '$query',
          style: TextStyle(
            color: Colors.white,
            fontSize: 40,
          ),
        )
      ],
    );

    return Container(
      margin: EdgeInsets.only(top: 60),
      padding: EdgeInsets.fromLTRB(15, 20, 15, 15),
      child: Column(
        children: [
          Expanded(
            child: queryRow,
          ),
          Expanded(
            child: answerRow,
          ),
        ],
      ),
    );
  }
}
