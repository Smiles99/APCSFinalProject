int remainingRed, remainingBlack;
Boolean turn, gameOver, kingMe, click;
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
      text ("Black Wins", 0, 400, 800, 800);
    } else {
      if (remainingBlack == 0) {
        fill (255);
        text ("Red Wins", 0, 400, 800, 800);
      }
    }
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
  click = false;
  gameOver = false;
  remainingRed = 12;
  remainingBlack = 12;
}

void showBoard() {
  //Create Initial Board
  for (int i = 0; i<8; i++) {
    for (int j = 0; j<8; j++) { 
      if ((i+j) % 2 == 0) {
        fill(255, 0, 0);
        rect(i * 100, j * 100, 100, 100);
      } else {
        fill(0);
        rect(i * 100, j * 100, 100, 100);
      }
      if (boardPositions[j][i] != null) {
        image(boardPositions[j][i], i * 100, j * 100);
      }
    }
  }
}

void mousePressed() {
  
  //if (boardPositions[mouseY / 100][mouseX / 100] == redMan) {
  //  boardPositions[mouseY / 100][mouseX / 100] = redKing;
  //} else {
  //  if (boardPositions[mouseY / 100][mouseX / 100] == blackMan) {
  //    boardPositions[mouseY / 100][mouseX / 100] = blackKing;
  //  }
  //}
}
