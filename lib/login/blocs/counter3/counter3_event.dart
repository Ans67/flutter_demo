part of 'counter3_bloc.dart';

abstract class Counter3Event {
  final int value;
  const Counter3Event(this.value);
}


class Counter3EvenEvent extends Counter3Event{
  Counter3EvenEvent(int value) : super(value);
}

class Counter3OddEvent extends Counter3Event{
  Counter3OddEvent(int value) : super(value);
}