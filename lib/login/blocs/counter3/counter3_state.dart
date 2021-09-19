part of 'counter3_bloc.dart';

abstract class Counter3State {
  final int value ;
  const Counter3State(this.value);
}

class Counter3Initial extends Counter3State {
  Counter3Initial(int value) : super(value);
}

class Counter3EvenState extends Counter3State{
  Counter3EvenState(int value) : super(value);
}

class Counter3OddState extends Counter3State{
  Counter3OddState(int value) : super(value);
}