int remainingRed, remainingBlack, x1, y1, x2, y2, midX, midY;
Boolean turn, gameOver, kingMe, click, multiJump, jump;
PImage redMan, redKing, blackMan, blackKing;
PImage[][] boardPositions;

void setup() {
  size(800,800);
  
  //Upload And Fit Piece Images
  redMan = loadImage("RedMan.png");
  redMan.resize(100, 100);
  redKing = loadImage("RedKing.png");
  redKing.resize(100, 100);
  blackMan = loadImage("BlackMan.png");
  blackMan.resize(100, 100);
  blackKing = loadImage("BlackKing.png");
  blackKing.resize(100, 100);
  
  startingPositions();
}

void draw() {
  showBoard();
  if (gameOver) {
    if (remainingRed == 0) {
      fill (255);
      textSize(100);
      textAlign(CENTER);
      text ("Black Wins", 400, 437);
    } else {
      if (remainingBlack == 0) {
        fill (255);
        textSize(50);
        textAlign(CENTER);
        text ("Red Wins", 400, 418);
      } else {
        fill (255);
        textSize(50);
        textAlign(CENTER);
        text ("Tie", 400, 416);
      }
    }
  }
}

void showBoard() {
  //Create Initial Board
  for (int i = 0; i < 8; i++) {
    for (int j = 0; j < 8; j++) { 
      if ((i + j) % 2 == 0) {
        fill(255, 0, 0);
        rect(i * 100, j * 100, 100, 100);
      } else {
        fill(0);
        rect(i * 100, j * 100, 100, 100);
      }
      if (boardPositions[j][i] != null) {
        image(boardPositions[j][i], i * 100, j * 100);
      }
      if (click) {
        if (canMove(x1, y1, j, i, turn, boardPositions)) {
          fill(255, 255, 255);
          ellipse(i * 100 + 50, j * 100 + 50, 50, 50);
        }
        if (j == x1 && i == y1 && boardPositions[j][i] != null) {
          fill (255, 255, 255, 50);
          rect(i * 100, j * 100, 100, 100);
        }
      }
    }
  }
}

void mousePressed() {
  if (gameOver) {
    startingPositions();
  }
  if (click) {
    x2 = round(mouseY / 100 - 0.5);
    y2 = round(mouseX / 100 - 0.5);
    if (canMove(x1, y1, x2, y2, turn, boardPositions)) {
      boardPositions = move(x1, y1, x2, y2, boardPositions);
      click = false;
    } else {
      x1 = x2;
      y1 = y2;
      click = true;
    }
  } else {
    x1 = round(mouseY / 100 - 0.5);
    y1 = round(mouseX / 100 - 0.5);
    click = true;
  }
}

void startingPositions() {
  boardPositions = new PImage[8][8];
  
  //Spawn Red Pieces
  boardPositions[0][1] = redMan;
  boardPositions[0][3] = redMan;
  boardPositions[0][5] = redMan; 
  boardPositions[0][7] = redMan;
  boardPositions[1][0] = redMan;
  boardPositions[1][2] = redMan;
  boardPositions[1][4] = redMan;
  boardPositions[1][6] = redMan;
  boardPositions[2][1] = redMan;
  boardPositions[2][3] = redMan;
  boardPositions[2][5] = redMan; 
  boardPositions[2][7] = redMan;
  
  //Spawn Black Pieces
  boardPositions[5][0] = blackMan;
  boardPositions[5][2] = blackMan;
  boardPositions[5][4] = blackMan;
  boardPositions[5][6] = blackMan;
  boardPositions[6][1] = blackMan;
  boardPositions[6][3] = blackMan;
  boardPositions[6][5] = blackMan;
  boardPositions[6][7] = blackMan;
  boardPositions[7][0] = blackMan;
  boardPositions[7][2] = blackMan;
  boardPositions[7][4] = blackMan;
  boardPositions[7][6] = blackMan;
  
  kingMe = false;
  x1 = -1;
  x2 = -1;
  y1 = -1;
  y2 = -1;
  click = false;
  turn = false;
  gameOver = false;
  multiJump = false;
  jump = false;
  remainingRed = 12;
  remainingBlack = 12;
}

PImage[][] move(int x1, int y1, int x2, int y2, PImage[][] boardPositions) {
  if (boardPositions[x1][y1] == redMan) {
    if (x2 == 7) {
      boardPositions[x1][y1] = redKing;
      kingMe = true;
      multiJump = false;
    }
  } else {
    if (boardPositions[x1][y1] == blackMan) {
      if (x2 == 0) {
        boardPositions[x1][y1] = blackKing;
        kingMe = true;
        multiJump = false;
      }
    }
  }
  boardPositions[x2][y2] = boardPositions[x1][y1];
  boardPositions[x1][y1] = null;
  if (abs(y1 - y2) == 2) {
    boardPositions[(x1 + x2) / 2][(y1 + y2) / 2] = null;
    if (turn) {
      remainingRed--;
    } else {
      remainingBlack--;
    }
    if (!kingMe) {
      if (canMove(x1, y1, x2 + 2, y2 + 2, turn, boardPositions) || canMove(x1, y1, x2 + 2, y2 - 2, turn, boardPositions) || canMove(x1, y1, x2 - 2, y2 + 2, turn, boardPositions) || canMove(x1, y1, x2 - 2, y2 - 2, turn, boardPositions)) {
        turn = !turn;
        multiJump = true;
        midX = x2;
        midY = y2;
      } else {
        multiJump = false;
      }
    }
  }
  kingMe = false;
  if (mustJump(!turn)) {
    jump = true;
  } else {
    jump  = false;
  }
  if (endGame(!turn)) {
    gameOver = true;
  }
  turn = !turn;
  return boardPositions;
}

boolean endGame(boolean turn) {
  for (int i = 0; i < 8; i++) {
    for (int j = 0; j < 8; j++) {
      if (turn == false) {
        if (notRed(i, j, boardPositions)) {
          continue;
        }
      } else {
        if (notBlack(i, j, boardPositions)) {
          continue;
        }
      }
      for (int k = 0; k < 8; k++) {
        for (int l = 0; l < 8; l++) {
          if (canMove(i, j, k, l, turn, boardPositions)) {
            return false;
          }
        }
      }
    }
  }
  return true;
}

boolean mustJump(boolean side) {
  for (int i = 0; i < 8; i++) {
    for (int j = 0; j < 8; j++) {
      if (turn) {
        if (notRed(i, j, boardPositions))
          continue;
      } else {
        if (notBlack(i, j, boardPositions)) {
          continue;
        }
      }
      for (int k = 0; k < 8; k++) {
        for (int l = 0; l < 8; l++) {
          if (canMove(i, j, k, l, side, boardPositions) && abs(i - k) == 2) return true;
        }
      }
    }
  }
  return false;
}

boolean canMove(int x1, int y1, int x2, int y2, boolean turn, PImage[][] boardPositions) {
  if (x1 > 7 || x1 < 0 || x2 > 7 || x2 < 0 || y1 > 7 || y1 < 0 || y2 > 7 || y2 < 0) {
    return false;
  }
  if (multiJump) {
    if (x1 != midX || y1 != midY || abs(y2 - y1) != 2) {
      return false;
    }
  }
  if (jump) {
    if (abs(y2 - y1) != 2) {
      return false;
    }
  }
  if (turn) {
    if (boardPositions[x1][y1] == blackMan) {
      if (abs(y2 - y1) == 1 && x2 == x1 - 1 && boardPositions[x2][y2] == null) {
        return true;
      }
      if (abs(y2 - y1) == 2 && x2 == x1 - 2 && boardPositions[x2][y2] == null && red(x1 - 1, (y1 + y2) / 2, boardPositions)) {
        return true;
      }
    } else if (boardPositions[x1][y1] == blackKing) {
      if (abs(y2 - y1) == 1 && abs(x2 - x1) == 1 && boardPositions[x2][y2] == null) {
        return true;
      }
      if (abs(y2 - y1) == 2 && abs(x2 - x1) == 2 && boardPositions[x2][y2] == null && red((x1 + x2) / 2, (y1 + y2) / 2, boardPositions)) {
        return true;
      }
    }
  } else {
    if (boardPositions[x1][y1] == redMan) {
      if (abs(y2 - y1) == 1 && x2 == x1+1 && boardPositions[x2][y2] == null) {
        return true;
      }
      if (abs(y2 - y1) == 2 && x2 == x1+2 && boardPositions[x2][y2] == null && black(x1+1, (y1 + y2)/2, boardPositions)) {
        return true;
      }
    } else if (boardPositions[x1][y1] == redKing) {
      if (abs(y2 - y1) == 1 && abs(x2-x1) == 1 && boardPositions[x2][y2] == null) {
        return true;
      }
      if (abs(y2 - y1) == 2 && abs(x2-x1) == 2 && boardPositions[x2][y2] == null && black((x1+x2)/2, (y1 + y2)/2, boardPositions)) {
        return true;
      }
    }
  }
  return false;
}

boolean black (int x2, int y2, PImage[][] boardPositions) {
  return (boardPositions[x2][y2] == blackMan || boardPositions[x2][y2] == blackKing);
}

boolean red (int x2, int y2, PImage[][] boardPositions) {
  return (boardPositions[x2][y2] == redMan || boardPositions[x2][y2] == redKing);
}

boolean notBlack (int x2, int y2, PImage[][] boardPositions) {
  return (red(x2, y2, boardPositions) || boardPositions[x2][y2] == null);
}

boolean notRed (int x2, int y2, PImage[][] boardPositions) {
  return (black(x2, y2, boardPositions) || boardPositions[x2][y2] == null);
}
