Stone stone;
Stone blackStone;
Board board;
Detector detector;

ArrayList<Stone> stoneState = new ArrayList<Stone>();
ArrayList<Stone> whiteState = new ArrayList<Stone>();
ArrayList<Stone> blackState = new ArrayList<Stone>();

int term = 1;

void setup() {
  size(1000, 800);
  
  stone = new Stone(1);
  blackStone = new Stone(2);
  
  board = new Board();
  
  detector = new Detector();
  
}

void draw() {
  background(#C99A22);
  
  board.build();
  
  if (term > 0) {
    stone.move(stoneState);
    stone.displayActive();
  }
  else {
    blackStone.move(stoneState);
    blackStone.displayActive();
  }
  
  if (keyPressed) {
    if (key == 'e') {
      if (term > 0) {
        stone.lock(stoneState, whiteState);
        term = term * -1;
      }
      else {
        blackStone.lock(stoneState, blackState);
        term = term * -1;
      }
      
      detector.detect(stoneState);
    }
    delay(50);
  }
  
  for (Stone i : stoneState) {
    i.displayLock();
    i.showLockedDebug(false);
    //println("x: " + i.x + ", y:" + i.y);
  }
  
  stone.showDebug(false);
}
