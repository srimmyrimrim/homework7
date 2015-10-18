//i did number 3 and 7
import java.util.HashSet;

HashSet<FlickeringStar> stars;
HashSet<FlickeringStarz> starz;
void setup() {
  size(500, 500);
  background(0);
  colorMode(HSB, 255);
  smooth();
  stars = new HashSet<FlickeringStar>();
  starz = new HashSet<FlickeringStarz>();
  mouseX = 250;
  mouseY = 250;
  addStars();
  addStarz();
}  
 void keyReleased()
  {
    loop();
  }
void keyPressed()
{
  noLoop();
  if (keyPressed==false)
  {
    keyReleased();
  }
}

void draw() {
  background(0);
  HashSet<FlickeringStar> finishedStars = new HashSet<FlickeringStar>();
  for (FlickeringStar s : stars) {
    s.draw();
    s.step();
    if (s.isFinished()) {
      finishedStars.add(s);
    }
  }
  stars.removeAll(finishedStars);
  
HashSet<FlickeringStarz> finishedStarz = new HashSet<FlickeringStarz>();
  for (FlickeringStarz z : starz) {
    z.draw();
    z.step();
    if (z.isFinished()) {
      finishedStarz.add(z);
    }
  }
  starz.removeAll(finishedStarz);
  
  if (mousePressed) {
    addStarz();
  }
 
}

void addStars() {
  color c = color(random(255), 200, 255); 
  for (int i = 0; i < 5; ++i) {
    stars.add(new FlickeringStar(
      mouseX + random(-5, 5), 
      mouseY + random(-5, 5), 
      random(-2.5, 2.5), 
      random(-3.5, 1.5),
      14 + random(-6, 6),
      c));
  }
}
void addStarz() {
  color c = color(random(255), 200, 255); 
  for (int i = 0; i < 5; ++i) {
    starz.add(new FlickeringStarz(
      mouseX + random(-5, 5), 
      mouseY + random(-5, 5), 
      random(-2.5, 2.5), 
      random(-3.5, 1.5),
      14 + random(-6, 6),
      c));
  }
}


void mouseMoved() {
  if (pow(pmouseX - mouseX, 2) + pow(pmouseY - mouseY, 2) >= 30) {
    addStars();
  }
}

class FlickeringStar {
  float x, y, vx, vy, r;
  color c;
  float e; // 0..1

  FlickeringStar(float x, float y, float vx, float vy, float r, color c) {
    this.x = x;
    this.y = y;
    this.vx = vx;
    this.vy = vy;
    this.r = r;
    this.c = c;
  }

  void step() {
    x += vx;
    y += vy;

    vy += 0.08; // gravity
    vx *= 0.98; // slow down
    vy *= 0.98; // slow down

    r -= 0.05 + 0.05 * min(r / 10, 1) + 0.15 * min(r / 5, 1);
    if (r < 5 && e < 0.5) {
      e = 0.5;
    }
  }
  


  void draw() {
    final float[] o = {1, 0, 0, 1, -1, 0, 0, -1};
    stroke(c);
    fill(c);
    beginShape();
    vertex(x+o[0]*r, y+o[1]*r);
    bezierVertex(x+o[0]*r*e, y+o[1]*r*e, x+o[2]*r*e, y+o[3]*r*e, x+o[2]*r, y+o[3]*r);
    bezierVertex(x+o[2]*r*e, y+o[3]*r*e, x+o[4]*r*e, y+o[5]*r*e, x+o[4]*r, y+o[5]*r);
    bezierVertex(x+o[4]*r*e, y+o[5]*r*e, x+o[6]*r*e, y+o[7]*r*e, x+o[6]*r, y+o[7]*r);
    bezierVertex(x+o[6]*r*e, y+o[7]*r*e, x+o[0]*r*e, y+o[1]*r*e, x+o[0]*r, y+o[1]*r);
    endShape();
 
  }

  boolean isFinished() {
    return r <= 0;
    
  }
}
class FlickeringStarz {
  float x, y, vx, vy, r;
  color c;
  float e; // 0..1

  FlickeringStarz(float x, float y, float vx, float vy, float r, color c) {
    this.x = x;
    this.y = y;
    this.vx = vx;
    this.vy = vy;
    this.r = r;
    this.c = c;
  }

  void step() {
    x += vx;
    y += vy;

    vy += 0.08; // gravity
    vx *= 0.98; // slow down
    vy *= 0.98; // slow down

    r -= 0.05 + 0.05 * min(r / 10, 1) + 0.15 * min(r / 5, 1);
    if (r < 5 && e < 0.1) {
      e = 0.1;
    }
  }
  


  void draw() {
    final float[] o = {1, 0, 0, 2, -1, 0, 0, -2};
    stroke(c);
    fill(c);
    beginShape();
    vertex(x+o[0]*r, y+o[1]*r);
    bezierVertex(x+o[0]*r*e, y+o[1]*r*e, x+o[2]*r*e, y+o[3]*r*e, x+o[2]*r, y+o[3]*r);
    bezierVertex(x+o[2]*r*e, y+o[3]*r*e, x+o[4]*r*e, y+o[5]*r*e, x+o[4]*r, y+o[5]*r);
    bezierVertex(x+o[4]*r*e, y+o[5]*r*e, x+o[6]*r*e, y+o[7]*r*e, x+o[6]*r, y+o[7]*r);
    bezierVertex(x+o[6]*r*e, y+o[7]*r*e, x+o[0]*r*e, y+o[1]*r*e, x+o[0]*r, y+o[1]*r);
    endShape();
 
  }

  boolean isFinished() {
    return r <= 0;
    
  }
}
