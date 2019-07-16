//IMPORTING SOUNDS
import processing.sound.*;
SinOsc [] sines = new SinOsc [6];

//NEW WIDTH AND HEIGHT OF PARTITURE
float  nw=600;
float  nh=300;

//INITIALIZE VARIABLES
PVector[][] xy =new PVector [12][6];
boolean [][] onoff = new boolean [12][6];
boolean [][] metron= new boolean [12][6];
float [] freq= new float [6];
boolean pause = false;
int stop;
int metro;
int rewind;
int f;
int fw;
int tmp;
int tmp2;
int tmpt;
int tmpt2;
int tmptotal;
int tmp3;
int ff;
int ff2;
int frame;
int framerewined;

void setup() {
  //INITIAL CONDITIONS
  size(800, 600);
  background(0); 
  frameRate(10);

  //INSTANCIATION OSCILATORS
  for (int i=0; i<6; i++) {
    sines[i]=new SinOsc(this);
  }

  //INSTANCIATION XY
  for (int i=0; i<12; i++) {
    for (int j=0; j<6; j++) {
      xy[i][j]=new PVector(i*50, j*50);
    }
  }
  //INSTANCIATION STATE
  for (int k=0; k<12; k++) {
    for (int l=0; l<6; l++) {
      onoff[k][l]= false;
    }
  }
  //INSTANCIATION METRONOME
  for (int m=0; m<12; m++) {
    for (int n=0; n<6; n++) {
      metron[m][n]= false;
    }
  }
  //INSTANCIATION FREQUENCIES
  for (int o=0; o<12; o++) {
    freq[0]= 392;
    freq[1]= 466;
    freq[2]= 523.3;
    freq[3]= 587.3;
    freq[4]= 698.5;
    freq[5]= 784;
  }
}

void draw() {
  //INITIAL CONDITIONS
  translate(100, 100);
  backgr(); 
  //PLAY PAUSE REWIND DISPLAY
  //REWIND
  fill(255);
  rect(nw/2+150, 310, 50, 50);
  fill(0);
  triangle(nw/2+190, 320, nw/2+165, 335, nw/2+190, 350);
  rect(nw/2+160, 320, 5, 30); 
  //PLAY STOP
  fill(255);
  rect(nw/2+250, 310, 50, 50);
  fill (0);
  if (pause) triangle(nw/2+200+65, 320, nw/2+200+90, 335, nw/2+200+65, 350);
  else rect(nw/2+260, 320, 30, 30);
  //XY DISPLAY
  for (int m=0; m<12; m++) {
    for (int n=0; n<6; n++) {
      if (onoff[m][n]) fill(160, 160, 200);
      else fill(255);
      rect(xy[m][n].x, xy[m][n].y, 50, 50);
    }
  }
  //METRONOME CHANGE STATE
  f=frameCount;
  if (pause) 
  {
    ff=int((tmp-tmptotal-tmp3)%nw);
    fill(255, 0, 0);
  } else ff=int((f-tmptotal-tmp3)%nw);

  ff2=int(ff*5%nw)/50;
  metro=ff2;
  for (int m=0; m<12; m++) { 
    for (int n=0; n<6; n++) {
      if (metro==m)  metron[m][n]=true;
      else metron[m][n]=false;
    }
  }
  //METRONOME DISPLAY
  for (int m=0; m<12; m++) {
    for (int n=0; n<6; n++) {
      if (metron[m][n]) fill(80, 100, 150);
      else noFill();
      rect(xy[m][n].x, xy[m][n].y, 50, 50);
    }
  }
  //MUSIC CREATION
  for (int m=0; m<12; m++) {
    for (int n=0; n<6; n++) {
      frame= int((frameCount-framerewined)*5%(nw/12));
      println(frame);
      if (onoff[m][n] && metron[m][n] && frame==0) {
        sines[n].freq(freq[n]);  
        sines[n].play();
      }
      if (onoff[m][n] && metron[m][n] && frame==30) sines[n].stop();
    }
    fcount();
  }
}
void mousePressed() {
  int mx = ((mouseX-100)/50);
  int my = ((mouseY-100)/50);

  for (int s=0; s<12; s++) {
    for (int t=0; t<6; t++) {
      if (mx==s && my==t)  onoff[s][t]=!onoff[s][t];
    }
  }
  if (mx==11 && my==6)
  {
    pause=!pause;
    if (pause)  
    {
      tmp=frameCount;
      tmpt=tmpt+tmp;
    } else 
    {
      tmp2=frameCount;
      tmpt2=tmpt2+tmp2;
      tmptotal=tmpt2-tmpt;
    }
  }

  if (mx==9 && my==6)
  {
    tmp3=frameCount-tmptotal;
    framerewined=frameCount;
  }
}