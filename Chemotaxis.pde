// ****** CLASS DEFINITION *******
double xAvg = 0;
double yAvg = 0;

class Cell {
  double x, y, xSwarm, ySwarm, xMouse, yMouse;
  color myColor;
  Cell(int insertX, int insertY) {
    myColor = color((int)(Math.random()*255), (int)(Math.random()*255), (int)(Math.random()*255));
    x = insertX;
    y = insertY;
  }
  void show() {
    fill(myColor);
    ellipse((float)x, (float)y, (int)(Math.random()*5+20), (int)(Math.random()*5+20));
  }
  void walk() {
    double xDist = mouseX - x;
    double yDist = mouseY - x;
    double force = 5000 / Math.sqrt((xDist)*(xDist)+(yDist)*(yDist) + 1);
    xMouse = force * (1/(xDist));
    yMouse = force * (1/(yDist));
    x +=xSwarm + xMouse + Math.random()*10 -5;
    //x += xMouse * 0.01 + Math.random()*10 -5;
    y +=ySwarm * 0.1 + yMouse + Math.random()*10 -5;
    //y += yMouse * 0.01 + Math.random()*10 -5;
  }
}

Cell [] colony;

//*****Main program*****

void setup() {
  size(1000, 10000);
  colony = new Cell[100];
  for (int i = 0; i<colony.length; i++)
    colony[i] = new Cell((int)((Math.random()*1000)), (int)((Math.random()*1000)));
}

void draw() {
  fill(0, 0, 0, 20);
  rect(0, 0, 1000, 1000);
  xAvg = 0;
  yAvg = 0;
  for (int i = 0; i<colony.length; i++) {
    xAvg += colony[i].x;
    yAvg += colony[i].y;
  }
  xAvg /= colony.length;
  yAvg /= colony.length;
  for (int i = 0; i<colony.length; i++) {
    colony[i].show();
    colony[i].walk();
  }
  fill(255);
  println(xAvg);
  println(yAvg);
}
