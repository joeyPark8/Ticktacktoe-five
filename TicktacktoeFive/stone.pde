class Stone {
  float size = 50;
  
  float x = 0, y = 0;
  
  int type;
  
  Stone(int type) {
    this.type = type;
  }
  
  void move(ArrayList<Stone> list) {
    if (keyPressed) {
      float pastX = x;
      float pastY = y;
      
      if (key == 'w' || keyCode == UP) y -= size;
      else if (key == 's' || keyCode == DOWN) y += size;
      else if (key == 'd' || keyCode == RIGHT) x += size;
      else if (key == 'a' || keyCode == LEFT) x -= size;
        
      delay(50);
        
      x = constrain(x, 0, width - size);
      y = constrain(y, 0, height - size);
        
      for (Stone i : list) {
        if (i.x == x && i.y == y) {
            x = pastX;
            y = pastY;
        }
      }
    }
  }
  
  void pass() {
    
  }
  
  void lock(ArrayList<Stone> list) {
    Stone clonedStone = new Stone(type);
    clonedStone.x = x;
    clonedStone.y = y;
    list.add(clonedStone);
    
    x = 0;
    y = 0;
  }
  
  void displayActive() {
    if (type == 1) fill(255);
    else if (type == 2) fill(0);
    
    strokeWeight(4);
    stroke(#C64E50);
    ellipse(size / 2 + x, size / 2 +  y, size, size);
  }
  
  void displayLock() {
    if (type == 1) fill(255);
    else if (type == 2) fill(0);
    
    noStroke();
    ellipse(size / 2 + x, size / 2 +  y, size, size);
  }
}
