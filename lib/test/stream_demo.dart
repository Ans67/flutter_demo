import 'dart:async';

class StreamDemo {
  Future<int> sumStream(Stream<int> stream) async {
    var sum = 0;
    try {
      await for (var value in stream) {
        sum += value;
      }
    } catch (e) {
      return -1;
    }
    return sum;
  }

  Stream<int> countStream(int to) async* {
    for (int i = 1; i <= to; i++) {
      await Future.delayed(Duration(seconds: 1));
      if (i == 4) {
        // continue;
      } else {}
      yield i;
    }
  }

  Stream stream;
  StreamSubscription subscription;

  Future<void> main() async {
    // int sum = 0;
    stream = countStream(10);
    subscription = stream.listen((event) {
      if (event == 4) {
        subscription.cancel();
      } else {
        // sum += event;
        print(event);
      }
    });
    // var sum = await sumStream(stream);
    // print(sum); // -1
  }
}
