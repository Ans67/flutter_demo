import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Test2 extends StatefulWidget {
  const Test2({Key key}) : super(key: key);

  @override
  _Test2State createState() => _Test2State();
}

class _Test2State extends State<Test2> {
  var textStyle = TextStyle(
    fontWeight: FontWeight.bold,
  );

  var textStyle2 = TextStyle(
    fontWeight: FontWeight.bold,
    color: Colors.green,
    fontSize: 40.0,
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          child: Column(
            children: [
              Expanded(
                child: _buildMaterialApp(),
              ),
              Expanded(
                child: _buildCupertinoApp(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCupertinoApp() {
    return Center(
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Hello",
              style: textStyle2,
            ),
            Text(
              "World",
              style: textStyle2,
            )
          ],
        ),
      ),
    );
  }

  Widget _buildMaterialApp() {
    return Container(
      color: Colors.blue,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Hello",
              style: textStyle,
            ),
            Text(
              "World",
              style: textStyle,
            ),
          ],
        ),
      ),
    );
  }
}
