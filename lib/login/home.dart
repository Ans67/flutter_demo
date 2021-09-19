import 'package:flutter/material.dart';
import 'package:flutter_application/database/users_db.dart';
import 'package:flutter_application/login/blocs/counter/counter_bloc.dart';
import 'package:flutter_application/login/login.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var count = 0;
  CounterBloc counterBloc =
      CounterBloc(); //BlocProvider.of<CounterBloc>(context);

  @override
  void dispose() {
    super.dispose();
    counterBloc.close();
  }

  @override
  void initState() {
    super.initState();

    //Priority 1
    counterBloc.listen((state) {
      if (state is CounterEvenState) {
        state.color = Colors.blue;
        print('CounterEvenState');
      }

      if (state is CounterOddState) print('CounterOddState');
      if (state is CounterInitial) print('CounterInitial');
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => counterBloc,
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text("Home"),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
              icon: Icon(
                Icons.logout,
              ),
            )
          ],
        ),
        body: Column(
          children: [
            if (UsersDB.authUser != null) _buildWelcomeUser(),
            Expanded(
              //Priority 2
              child: BlocBuilder<CounterBloc, CounterState>(
                buildWhen: (p, c) => c is CounterEvenState,
                builder: (context, state) {
                  return state is CounterInitial
                      ? SizedBox()
                      : Container(
                          color: state.color,
                          child: Center(child: Text("Even: ${state.value}")),
                        );
                },
              ),
            ),
            Expanded(
              child: BlocBuilder<CounterBloc, CounterState>(
                buildWhen: (p, c) => c is CounterOddState,
                builder: (context, state) {
                  return state is CounterInitial
                      ? SizedBox()
                      : Container(
                          color: state.color,
                          child: Center(child: Text("Odd: ${state.value}")),
                        );
                },
              ),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            count++;
            if ((count % 2) == 0) //Even
            {
              counterBloc.add(CounterEvenEvent(count));
            } else //Odd
            {
              counterBloc.add(CounterOddEvent(count));
            }
            // setState(() {});
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }

  Padding _buildWelcomeUser() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Align(
        alignment: Alignment.centerRight,
        child: Text(
          'Welcome ${UsersDB.authUser.firstName} ${UsersDB.authUser.lastName}',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
