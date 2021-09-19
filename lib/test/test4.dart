
import 'package:flutter/material.dart';

const Color color = Colors.red;

class Test4 extends StatefulWidget {
  final String text1;
  final String text2;
  final double textsize1;
  final double textsize2;

  const Test4(
      {Key key,
      @required this.text1,
      @required this.text2,
      this.textsize1,
      this.textsize2})
      : super(key: key);

  @override
  _Test4State createState() => _Test4State();
}

class _Test4State extends State<Test4> {
  var children;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                alignment: Alignment.center,
                color: Colors.blue,
                child: _buildText(
                  widget.text1,
                  textsize: widget.textsize1,
                  textColor: Colors.black,
                  textBgColor: Colors.red,
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: _buildText(
                  widget.text2,
                  textsize: widget.textsize2,
                  textColor: Colors.black,
                  textBgColor: Colors.yellow,
                ),
              ),
            ),
          ],
        ),
      ),
    );

    // return MaterialApp(
    //   home: Scaffold(
    //     body: Column(
    //       children: [
    //         Expanded(
    //           child: Container(
    //             color: Colors.blue,
    //             child: Center(
    //               child: _buildText(
    //                 widget.text1,
    //                 textsize: widget.textsize1,
    //                 textColor: Colors.grey,
    //               ),
    //             ),
    //           ),
    //         ),
    //         Expanded(
    //           child: Center(
    //             child: _buildText(
    //               widget.text2,
    //               textsize: widget.textsize2,
    //               textColor: Colors.grey,
    //             ),
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }

  Widget _buildText(
    String text, {
    double textsize,
    Color textColor,
    Color textBgColor,
  }) {
    return Text(
      text,
      style: TextStyle(
        fontSize: textsize,
        color: textColor,
        backgroundColor: textBgColor,
      ),
    );
  }
}
