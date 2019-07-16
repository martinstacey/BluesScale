void backgr() {
  
    //FONT
          
PFont f = createFont("Engravers MT",16);
textFont(f);
  //NOTES AND FREQUENCIES 
  String [] notes = new String [6]; 
  float [] freq= new float [notes.length];
  //TEMPO
  String [] tempo = new String [12];

  notes [0]="G";     
  notes [1]="B";     
  notes [2]="C";     
  notes [3]="D";     
  notes [4]="F";     
  notes [5]="G²";    

  freq [0]=392;
  freq [1]=466;
  freq [2]=523.3;
  freq [3]=587.3;
  freq [4]=698.5;
  freq [5]=784.0;

  tempo [0]="1";
  tempo [1]="a";
  tempo [2]="i";
  tempo [3]="2";
  tempo [4]="a";
  tempo [5]="i";
  tempo [6]="3";
  tempo [7]="a";
  tempo [8]="i";
  tempo [9]="4";
  tempo [10]="a";
  tempo [11]="i";

  for (int i=0; i<tempo.length; i++) {   
    for (int j=0; j<notes.length; j++) {

      float xp=nw*i/12;
      float yp=nh*j/6;

      //TITLES
      //TITLE NOTES
      textAlign(RIGHT, TOP);
      textSize(32);
      fill(255);  
      text(notes[j], -10, yp);
      //TITLE TEMPOS 
      textAlign(CENTER, BOTTOM);
      textSize(16);
      fill(255);  
      text(tempo[i], xp, -10);
    }
  }
  //BIG TITTLE
  
      textAlign(LEFT, CENTER);
      textSize(20);

      fill(255);  
      text("THE MARTIN STACEY", 0, nh+20);
      text("BLUES SCALE", 0, nh+50);
  
}