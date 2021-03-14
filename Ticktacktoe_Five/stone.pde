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
      
      char pressedKey = ' ';
      
      if (key == 'w' || keyCode == UP) {
        y -= size;
        pressedKey = 'w';
      }
      else if (key == 's' || keyCode == DOWN) {
        y += size;
        pressedKey = 's';
      }
      else if (key == 'd' || keyCode == RIGHT) {
        x += size;
        pressedKey = 'd';
      }
      else if (key == 'a' || keyCode == LEFT) {
        x -= size;
        pressedKey = 'a';
      }
        
      delay(50);
        
      x = constrain(x, 0, width - size);
      y = constrain(y, 0, height - size);
      
      pass(list, pressedKey, pastX, pastY);
      
      //prevent(list, pastX, pastY);
      
    }
  }
  
  void prevent(ArrayList<Stone> list, float pastX, float pastY) {
    if (isBeingUsed(list, x, y)) {
      x = pastX;
      y = pastY;
    }
  }
  
  void pass(ArrayList<Stone> list, char pressedKey, float pastX, float pastY) {
    if (pressedKey == 'w') {
      while (isBeingUsed(list, x, y)) {
        if (y == 0) {
          x = pastX;
          y = pastY;
          break;
        }
        y -= size;
      }
    }
    else if (pressedKey == 's') {
      while (isBeingUsed(list, x, y)) {
        if (y == height - size) {
          x = pastX;
          y = pastY;
          break;
        }
        y += size;
      }
    }
    else if (pressedKey == 'd') {
      while (isBeingUsed(list, x, y)) {
        if (x == width - size) {
          x = pastX;
          y = pastY;
          break;
        }
        x += size;
      }
    }
    else if (pressedKey == 'a') {
      while (isBeingUsed(list, x, y)) {
        if (x == 0) {
          x = pastX;
          y = pastY;
          break;
        }
        x -= size;
      }
    }
  }
  
  boolean isBeingUsed(ArrayList<Stone> list, float x, float y) {
    for (Stone i : list) {
      if (i.x == x && i.y == y) {
        return true;
      }
    }
    
    return false;
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
  
  void showDebug(boolean enabled) {
    if (enabled) {
      noStroke();
      fill(#FF0000);
      ellipse(x, y, 10, 10);
      
      fill(#00FF00);
      ellipse(x, y - size, 10, 10);
      
      fill(#0000FF);
      ellipse(x, y + size, 10, 10);
      
      fill(#FFFF00);
      ellipse(x - size, y, 10, 10);
      
      fill(#FF00FF);
      ellipse(x + size, y, 10, 10);
    }
  }
  
  void showLockedDebug(boolean enabled) {
    if (enabled) {
      fill(#00FFFF);
      ellipse(x, y, 10, 10);
    }
  }
}
