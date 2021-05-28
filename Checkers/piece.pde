public class piece {
  float x, y, radius;
  color c;
  boolean selected, kinged;

  piece(float rad, float x, float y, color c) {
    radius = rad;
    this.x = x;
    this.y = y; 
    this.c = c;
  }
  piece() {
  }
}
