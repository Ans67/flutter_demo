import 'package:flutter/material.dart';
import 'package:flutter_application/login/blocs/counter2/counter2_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home2 extends StatefulWidget {
  const Home2({Key key}) : super(key: key);

  @override
  _Home2State createState() => _Home2State();
}

class _Home2State extends State<Home2> {
  var counter = 0;
  var counter2bloc = Counter2Bloc();

  bool hideFloationActionButton = false;

  String image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getVersion(),
        builder: (c, s) {
          if (s.connectionState == ConnectionState.waiting) {
            return Container(child: Center(child: CircularProgressIndicator()));
          } else if (!s.hasData) {
            return Center(child: Text('No data found.'));
          }

          // var data = s.data;

          return BlocProvider(
            create: (context) => counter2bloc,
            child: Column(
              children: [
                // if (image != null) SizedBox(),
                Expanded(
                  child: BlocBuilder<Counter2Bloc, Counter2State>(
                    buildWhen: (p, c) => c is Counter2EvenState,
                    builder: (context, state) {
                      return Container(
                        color: Colors.orange,
                        child: Center(
                          child: Text("Even : ${state.value}"),
                        ),
                      );
                    },
                  ),
                ),
                Expanded(
                  child: BlocBuilder<Counter2Bloc, Counter2State>(
                    buildWhen: (p, c) => c is Counter2OddState,
                    builder: (context, state) {
                      return Container(
                        color: Colors.green,
                        child: Center(
                          child: Text("odd : ${state.value}"),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counter++;
          if (counter % 2 == 0) {
            counter2bloc.add(
              Counter2EvenEvent(counter),
            );
          } else {
            counter2bloc.add(
              Counter2OddEvent(counter),
            );
          }
        },
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    counter2bloc.close();
  }

  Future<String> downloadImage(String url) async {
    return '';
  }

  Future<double> getVersion() async {
    // await Future.delayed(Duration(seconds: 3));
    return 1.0;
  }

  @override
  void initState() {
    super.initState();

    //ViewDidLioad
    WidgetsBinding.instance.addPostFrameCallback((duration) async {
      // print(duration);
      // var result = await downloadImage("url");
      // setState(() {});

      // downloadImage("").then((value) {
      //   image = value;
      //   setState(() {});
      // });
    });
  }
}
