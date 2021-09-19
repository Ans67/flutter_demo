import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_application/login/blocs/counter3/counter3_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home3 extends StatefulWidget {
  const Home3({Key key}) : super(key: key);

  @override
  _Home3State createState() => _Home3State();
}

class _Home3State extends State<Home3> {
  var counter = 0;
  var counter3bloc = Counter3Bloc();

  @override
  void dispose() {
    super.dispose();
    counter3bloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) {
          return counter3bloc;
        },
        child: Column(
          children: [
            Expanded(
              child: Container(
                color: Colors.orange,
                child: Center(
                  child: BlocBuilder<Counter3Bloc, Counter3State>(
                    buildWhen: (p, c) => c is Counter3EvenState,
                    builder: (context, state) {
                      return Text("Even:${state.value}");
                    },
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.green,
                child: Center(
                  child: BlocBuilder<Counter3Bloc, Counter3State>(
                    buildWhen: (p, c) => c is Counter3OddState,
                    builder: (context, state) {
                      return Text("Odd:${state.value}");
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counter++;
          if (counter % 2 == 0) {
            counter3bloc.add(Counter3EvenEvent(counter));
          } else {
            counter3bloc.add(Counter3OddEvent(counter));
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
