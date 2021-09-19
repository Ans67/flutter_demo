import 'package:flutter/material.dart';

class Test5 extends StatefulWidget {
  const Test5({Key key}) : super(key: key);

  @override
  _Test5State createState() => _Test5State();
}

class _Test5State extends State<Test5> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        color: Colors.red,
                        child: Center(
                          child: Text("test 1"),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        color: Colors.green,
                        child: Center(
                          child: Text("test2"),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        color: Colors.blue,
                        child: Center(
                          child: Text("test 3"),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Text("test4"),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          Center(child: Icon(Icons.alarm)),
          Align(
            alignment: Alignment.centerLeft,
            child: Icon(Icons.alarm_off),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Icon(Icons.alarm_off_outlined),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Icon(Icons.alarm_off_outlined),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Icon(Icons.alarm_off_outlined),
          ),
         
        ],
      ),
    );
  }
}
