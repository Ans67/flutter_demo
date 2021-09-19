part of 'counter_bloc.dart';

abstract class CounterEvent {
  int value;
  CounterEvent(this.value);
}

class CounterEvenEvent extends CounterEvent {
  CounterEvenEvent(int value) : super(value);
}

class CounterOddEvent extends CounterEvent {
  CounterOddEvent(int value) : super(value);
}
