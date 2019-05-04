int levels;
color bg, fg;

void setup() {
  size(800, 600);
  levels = 1;
}

/*Create Sierpiski's Gasket (google an image of this)
 The outer triangle are the vertices: (v1x, v1y), (v2x,v2y), (v3x, v3y)
 levels:
 0 = regular triangle
 1 = triforce (looks like 3 triangles)
 2 = each of the 3 triangles will be cut into 3 triangles.
 etc.
 */

float[] midpoint (float x1, float y1, float x2, float y2) { 
  float[] ans = new float[2]; 
  ans[0] = (x1 + x2) /2 ; 
  ans[1] = (y1 + y2) /2; 
  return ans; 
}

void gasket(int levels, float v1x, float v1y, float v2x, float v2y, float v3x, float v3y) {
  if (levels == 0) { 
    fill (255,0,0); 
    triangle (v1x, v1y, v2x, v2y, v3x, v3y); 
  }
  if (levels == 1) { 
    fill (255, 0, 0); 
    triangle (v1x, v1y, v2x, v2y, v3x, v3y); 
    fill (255); 
    float[] p1 = midpoint (v1x, v1y, v2x, v2y); 
      float nx1 = p1[0]; 
      float ny1 = p1[1]; 
    float[] p2 = midpoint (v1x, v1y, v3x, v3y); 
      float nx2 = p2[0]; 
      float ny2 = p2[1]; 
    float[] p3 = midpoint (v2x, v2y, v3x, v3y); 
      float nx3 = p3[0]; 
      float ny3 = p3[1]; 
    triangle (nx1, ny1, nx2, ny2, nx3, ny3); 
  }
  else { 
    float[] p1 = midpoint (v1x, v1y, v2x, v2y); 
      float nx1 = p1[0]; 
      float ny1 = p1[1]; 
    float[] p2 = midpoint (v1x, v1y, v3x, v3y); 
      float nx2 = p2[0]; 
      float ny2 = p2[1]; 
    float[] p3 = midpoint (v2x, v2y, v3x, v3y); 
      float nx3 = p3[0]; 
      float ny3 = p3[1]; 
    gasket (levels - 1, v1x, v1y, nx1, ny1, nx2, ny2); 
    gasket (levels - 1, nx1, ny1, v2x, v2y, nx3, ny3); 
    gasket (levels - 1, nx2, ny2, v3x, v3y, nx3, ny3); 
  }
  //YOU WRITE THIS METHOD!
}

void draw() { 
  background(50);  

  fill(255);
  text("Click the mouse to increase levels, press a key to decrease levles", 20, 20);

  gasket(levels, 0, height-10, width, height-10, width/2, 10);

  //koch(levels,width-10, height/2,10, height/3 ); 
  //other fractal you can do! This requires a bit more math, or you can look up the coordinates.
}

void mouseClicked() { 
  levels ++;
}

void keyPressed() {
  levels --;
}
