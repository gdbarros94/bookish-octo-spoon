void incrementCounterExternal(Function(void Function()) setState, int current, void Function(int) update) {
  setState(() {
    update(current + 1);
  });
}
