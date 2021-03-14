class Board {
  void build() {
    stroke(0);
    strokeWeight(1.5);
    for (int i = (int)-stone.size / 2; i < width; i += stone.size) {
      for (int j = (int)-stone.size / 2; j < height; j += stone.size) {
        line(i, j, width, j);
        line(i, j, i, height);
      }
    }
  }
}
