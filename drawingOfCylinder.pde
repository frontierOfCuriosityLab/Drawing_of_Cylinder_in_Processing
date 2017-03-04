FloatList cylinderCordinates;

void setup() {
  size(500, 500, P3D);
  cylinderCordinates = new FloatList();
  
}

void draw() {

  background(255);
  translate(width/2, height/2, -200);

  camera(0, 50, -750, 0, 0, 0, 0, 1, 0);

  rotateY(mouseX/20);
  rotateX(mouseY/20);

  noFill();
  //radius height resolution
  setCylinderCordinates(50, 100, 24);
  
}

void setCylinderCordinates(int radius, int heightSize, int resolution) {

  float deg = 360/resolution;
  for (int i = 0; i < resolution; i++) {
    cylinderCordinates.append(radius * cos(radians(deg * i))); 
    cylinderCordinates.append(radius * sin(radians(deg * i)));
  }
  //upside lid
  beginShape();
  for (int i = 0; i < cylinderCordinates.size()-1; i+=2) {
    vertex(cylinderCordinates.get(i), heightSize * -1, cylinderCordinates.get(i+1));
  }
  endShape(CLOSE);

  //bottom lid
  beginShape();
  for (int i = 0; i < cylinderCordinates.size()-1; i+=2) {
    vertex(cylinderCordinates.get(i), heightSize, cylinderCordinates.get(i+1));
  }
  endShape(CLOSE);

  int arraySize = cylinderCordinates.size();
    
  for (int i = 0; i < arraySize - 3; i+=2) {
    beginShape();
    vertex(cylinderCordinates.get(i), heightSize, cylinderCordinates.get(i+1));
    vertex(cylinderCordinates.get(i+2), heightSize, cylinderCordinates.get(i+3));
    vertex(cylinderCordinates.get(i+2), heightSize * -1, cylinderCordinates.get(i+3));
    vertex(cylinderCordinates.get(i), heightSize * -1, cylinderCordinates.get(i+1));
    endShape(CLOSE);
  }
  
  beginShape();
  vertex(cylinderCordinates.get(0), heightSize, cylinderCordinates.get(1));
  vertex(cylinderCordinates.get(arraySize-2), heightSize, cylinderCordinates.get(arraySize-1));
  vertex(cylinderCordinates.get(arraySize-2), heightSize * -1, cylinderCordinates.get(arraySize-1));
  vertex(cylinderCordinates.get(0), heightSize * -1, cylinderCordinates.get(1));
  endShape(CLOSE);
  
}