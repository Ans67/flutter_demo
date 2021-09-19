class AsyncDemo {
  void main() async {
    var future = getValueAsync();
    // print(future);
    future.then((value) => print(value));
    var result = getValue();
    print(result);

    for (var i = 0; i < 10; i++) {
      // var result = await getValueAsync();
    }
  }

  int getValue() {
    return 1;
  }

  Future<int> getValueAsync() async {
    return 2;
  }

  Future<int> sumStream(Stream<int> stream) async {
    var sum = 0;
    await for (var value in stream) {
      sum += value;
    }
    return sum;
  }
}
