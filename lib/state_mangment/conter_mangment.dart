class ConterMangment {
  int conter = 0;

  void increment() {
    conter++;
  }

  void decrement() {
    if (conter > 0) {
      conter--;
    }
  }

  void reset() {
    conter = 0;
  }
}
