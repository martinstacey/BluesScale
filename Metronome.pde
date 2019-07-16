
void fcount() {
  PFont g = createFont("Arial Narrow",12);
  textFont(g);
  
  float metro=frameCount*5%nw;
  strokeWeight(1);
  stroke(0); 
  fill(0);
  rect(nw, nh+100, -80, 100);

  textAlign(RIGHT, TOP);
  textSize(12);
  fill(255);    
  text("FC: "+(frameCount), nw, nh+110);
  text("ME: "+(metro), nw, nh+130);
  text("MX: "+((mouseX-100)/50), nw, nh+150);
  text("MY: "+((mouseY-100)/50), nw, nh+170);  
}