class Board {
  void build() {
    stroke(0);
    strokeWeight(1.5);
    for (int i = 0; i < width; i += stone.size) {
      for (int j = 0; j < height; j += stone.size) {
        line(i, j, width, j);
        line(i, j, i, height);
      }
    }
  }
}
