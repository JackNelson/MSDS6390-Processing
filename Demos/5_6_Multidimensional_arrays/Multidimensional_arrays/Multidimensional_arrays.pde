int cols = 20;
int rows = 20;
int[][] vals2D = new int[cols][rows];
void setup(){
  size(400, 400);
  background(0, 200, 200);
  int colSpan = width/cols;
  int rowSpan = height/rows;
  for(int i = 0; i < vals2D.length; i++){
    for (int j = 0; j < vals2D[i].length; j++){
      rect(colSpan*i, rowSpan*j, colSpan, rowSpan);
    }
  }
}