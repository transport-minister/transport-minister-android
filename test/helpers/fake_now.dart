class FakeNow {
  FakeNow(this.current);

  DateTime current;

  DateTime call() => current;

  void advance(Duration duration) => current = current.add(duration);
}
