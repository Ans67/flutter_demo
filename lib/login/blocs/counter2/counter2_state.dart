part of 'counter2_bloc.dart';

abstract class Counter2State {
  const Counter2State(this.value);
  final int value;
}

class Counter2Initial extends Counter2State {
  Counter2Initial(int value) : super(value);
}

class Counter2EvenState extends Counter2State {
  Counter2EvenState(int value) : super(value);
}

class Counter2OddState extends Counter2State {
  Counter2OddState(int value) : super(value);
}
