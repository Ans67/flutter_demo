import 'dart:async';

import 'package:bloc/bloc.dart';

part 'counter2_event.dart';
part 'counter2_state.dart';

class Counter2Bloc extends Bloc<Counter2Event, Counter2State> {
  Counter2Bloc() : super(Counter2Initial(0));

  @override
  Stream<Counter2State> mapEventToState(
    Counter2Event event,
  ) async* {
    if (event is Counter2EvenEvent) {
      yield Counter2EvenState(event.value);
    } else if (event is Counter2OddEvent) {
      yield Counter2OddState(event.value);
    }
  }
}
