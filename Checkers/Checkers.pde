int remainingRed, remainingBlack, capturedRed, capturedBlack;
Boolean turn, gameOver;
PImage redMan, redKing, blackMan, blackKing;
PImage[][] boardPositions;

void setup() {
  size(800,800);
  
  //Upload Piece Images
  redMan = loadImage("RedMan.png");
  redKing = loadImage("RedKing.png");
  blackMan = loadImage("BlackMan.png");
  blackKing = loadImage("BlackKing.png");
  
  startingPositions();
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
}

void showBoard() {
  //Create Initial Board
  for (int i = 0; i<8; i++) {
    for (int j = 0; j<8; j++) { 
      if ((i+j) % 2 == 0) {
        fill(255, 0, 0);
      } else {
        fill(0);
      }
      rect(i * 100, j * 100, 100, 100);
      if (boardPositions[j][i] != null) {
        image(boardPositions[j][i], i * 100, j * 100);
      }
    }
  }
}
