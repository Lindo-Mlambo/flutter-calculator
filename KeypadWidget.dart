class Keypad extends StatelessWidget {
  Keypad({Key key, @required this.handleInput}) : super(key: key);

  final ValueChanged<String> handleInput;

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
              color: Colors.grey[700],
            ),
            width: 80,
            height: 60,
            alignment: Alignment.center,
            child: Text(
              '$icon',
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
              ),
            ),
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
                _buildKey("x", "x")
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
                _buildKey("+/-", "+/-"),
                _buildKey("=", "=")
              ],
            ),
          ),
        ],
      ),
    );
  }
}
