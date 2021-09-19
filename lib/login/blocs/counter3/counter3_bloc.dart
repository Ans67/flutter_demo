import 'dart:async';

import 'package:bloc/bloc.dart';

part 'counter3_event.dart';
part 'counter3_state.dart';

class Counter3Bloc extends Bloc<Counter3Event, Counter3State> {
  Counter3Bloc() : super(Counter3Initial(0));

  @override
  Stream<Counter3State> mapEventToState(
    Counter3Event event,
  ) async* {
     if (event is Counter3EvenEvent){
        yield Counter3EvenState(event.value);
     }else if (event is Counter3OddEvent){
        yield Counter3OddState(event.value);
     }
  }
}
