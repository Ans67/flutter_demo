import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  const Test({Key key}) : super(key: key);

  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    // return _buildMaterialApp();
    // return _buildCupertinoApp();

    //Material or Cupertino
    return MaterialApp(
      //Sacffold
      home: Scaffold(
        //Any widget
        body: Column(
          children: [
            Expanded(
              child: _buildMaterialApp(),
              flex: 1,
            ),
            Expanded(
              child: _buildCupertinoApp(),
              flex: 1,
            ),
          ],
        ),
      ),
    );
  }

  CupertinoApp _buildCupertinoApp() {
    return CupertinoApp(
      home: Scaffold(
        body: Container(
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Hello",
                  style: TextStyle(
                    fontSize: 40.0,
                    color: Colors.green,
                  ),
                ),
                Text(
                  "World",
                  style: TextStyle(
                    fontSize: 40.0,
                    color: Colors.green,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  MaterialApp _buildMaterialApp() {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          color: Colors.blue,
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Hello",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  " world",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
