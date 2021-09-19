part of 'counter_bloc.dart';

abstract class CounterState {
  Color color;
  int value;
  CounterState(this.value, {this.color});
}

class CounterInitial extends CounterState {
  CounterInitial(int value) : super(value);
}

class CounterEvenState extends CounterState {
  CounterEvenState(int value) : super(value, color: Colors.orange);
}

class CounterOddState extends CounterState {
  CounterOddState(int value) : super(value, color: Colors.green);
}
