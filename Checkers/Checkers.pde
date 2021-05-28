ArrayList<piece> redPieces;
ArrayList<piece> blackPieces;
int remainingRed, remainingBlack, capturedRed, capturedBlack;
Boolean turn, gameOver;
void setup() {
  //Board Creation
  size(800,800);
  for (int i = 0; i<8; i++) {
    for (int j = 0; j<8; j++) { 
      if ((i+j) % 2 == 0) {
        fill(255, 0, 0);
      } else {
        fill(25);
      }
      rect(i * 100, j * 100, 100, 100);
    }
  }
}
