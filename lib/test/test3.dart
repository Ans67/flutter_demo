import 'package:flutter/material.dart';

class Test3 extends StatefulWidget {
  final String title;
  final int size;
  const Test3(this.title, {Key key, @required this.size}) : super(key: key);

  @override
  _Test3State createState() => _Test3State();
}

class _Test3State extends State<Test3> {
  var textstyle1 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          height: 300,
          width: double.infinity,
          color: Colors.red,
          child: Stack(
            alignment: Alignment.center,
            // mainAxisAlignment: MainAxisAlignment.start, //Vertical (Top ,Bottom) center
            // crossAxisAlignment: CrossAxisAlignment.start, //horizontal(Left, Right) end
            children: [
              Container(
                color: Colors.green,
                height: 100,
                width: 100,
              ),
              _buildText(
                widget.title,
                textColor: Colors.black,
                textSize: 20.0,
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: OutlinedButton(
                  onPressed: () => {},
                  child: Text("button"),
                  style: ButtonStyle(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildText(
    String text, {
    Color textColor = Colors.green,
    @required double textSize,
  }) {
    return Text(
      text ?? "",
      style: textstyle1.copyWith(
        color: textColor,
        fontSize: textSize,
      ),
    );
  }
}
