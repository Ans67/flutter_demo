part of 'counter2_bloc.dart';

abstract class Counter2Event {
  const Counter2Event(this.value);
  final int value;
}

class Counter2EvenEvent extends Counter2Event {
  Counter2EvenEvent(int value) : super(value);
}

class Counter2OddEvent extends Counter2Event {
  Counter2OddEvent(int value) : super(value);
}
