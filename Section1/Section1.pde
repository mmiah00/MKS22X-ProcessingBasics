int MAX_VALUE = 100;
int MIN_VALUE = -100;
Visualizer v;

/*You are simulating a visualizer of multiple values
 You need to create a display method first. 
 Then you can make a method that changes the values each time the update is called. 
 */
class Visualizer {
  float x, y;
  float [] values;
  float [] speeds;
  Visualizer(float x, float y) {
    this.x = x;
    this.y = y;
    values = new float[10];
    speeds = new float[10];
    for (int i = 0; i < values.length; i++) {
      values[i] = random(-99, 99);
      speeds[i] = random(2);
    }
  }

  void display() {
    fill(255);
    rect(x, y, 400, 200);
    line(x, y+100, x+400, y+100);
    
    float w = 400 / values.length; 
    float xcor = x; 
    
    for (float i: values) { 
      float temp = abs (i); 
      if (i < 0) { 
        if (i > -50) { //orange
          fill (255,128,0);
        }
        else { //red
          fill (255,0,0); 
        }
        rect (xcor, y + 100, w, temp); 
      }
      else { 
        if (i < 50) { //yellow 
          fill (255,255,0); 
        }
        else { //green
          fill (0, 255, 0); 
        }
        rect (xcor,y + 100 - temp, w, temp); 
      }
      xcor += w; 
    }
  
  }
  
  void update() {
    for (int i = 0; i < values.length; i++) {
      values[i] += speeds[i]; //the speed updates the values. Do not touch this.
      
      if (values[i] > MAX_VALUE || values[i] < MIN_VALUE) { 
        speeds[i] *= -1; 
      }
    }
  }
}

void setup() {
  size(600, 500);
  v = new Visualizer(20, 20);
}
void draw() {
  background(255);
  v.display();
  v.update();
}
