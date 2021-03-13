Stone stone;
Stone blackStone;
Board board;

ArrayList<Stone> whiteStoneState = new ArrayList<Stone>();
ArrayList<Stone> blackStoneState = new ArrayList<Stone>();

void setup() {
  size(1000, 800);
  
  stone = new Stone(1);
  blackStone = new Stone(2);
  
  board = new Board();
}

void draw() {
  background(#C99A22);
  
  board.build();
  
  stone.move(whiteStoneState);
  stone.displayActive();
  
  if (keyPressed) {
    if (key == 'e') {
      stone.lock(whiteStoneState);
    }
    delay(50);
  }
  
  for (Stone i : whiteStoneState) {
    i.displayLock();
    println("x: " + i.x + ", y:" + i.y);
  }
}
