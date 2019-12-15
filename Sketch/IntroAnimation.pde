

float rX, rY, fX, fY, mX, mY;
float speedRateY, speedRateX;

float degreeX = 0, degreeY = 0;
int phaze = 0;

void InitializeIntroAnimation(){

  rabbitWhiteIntro = loadShape("rabbitWhite.svg");
  mushroom = loadShape("mushroom.svg");
  GameTitle = loadShape("GameTitle.svg");

  rX = cellDistX * 1 - 50;
  rY = cellDistY * 3 - 50;

  fX = cellDistX * 2 - 50;
  fY = cellDistY * 3 - 50;

  mX = cellDistX * 4 - 50;
  mY = cellDistY * 3 - 50;

  shapeMode(CENTER);
  textAlign(CENTER);
  rectMode(CENTER);
}
void drawIntroAnimation(){
  background(color(67,160,71));

  drawCells();

  shape(mushroom, fX, fY, 100, 100);
  shape(mushroom, mX, mY, 100, 100);
  shape(rabbitWhite, 1.32 * (rX + 6) - 44, (rY - 8), 100, 100);


  animate();
  drawTitle();
}

float dirY = -2;
float dirX = 2;

void animate(){

  if(radians(degreeX) < 3 * PI && phaze <= 1){

    if(radians(degreeX) > PI && phaze == 1){
      phaze++;
    }

    rY += sin( radians( degreeY ) ) * dirY;
    rX += sin( radians( degreeX ) ) * dirX;

    degreeY += 2;
    degreeX += 1;

    rY += sin( radians( degreeY ) ) * dirY;
    rX += sin( radians( degreeX ) ) * dirX;

    degreeY += 2;
    degreeX += 1;

    rY += sin( radians( degreeY ) ) * dirY;
    rX += sin( radians( degreeX ) ) * dirX;

    degreeY += 2;
    degreeX += 1;

  } else {
    degreeX = 0;
    degreeY = 0;
    phaze++;
  }

}


void drawCells(){
  noStroke();

  int x, y;

  x = cellDistX * 1 - 50;
  y = cellDistY * 3 - 50;

  fill(color(46,125,50));
  circle(x, y, 90);

  x = cellDistX * 3 - 50;
  y = cellDistY * 3 - 50;

  fill(color(46,125,50));
  circle(x, y, 90);


  x = cellDistX * 5 - 50;
  y = cellDistY * 3 - 50;

  fill(color(62,39,35));
  circle(x, y , 110);
  fill(color(20, 20, 20, 90));
  circle(x, y, 90);

  fill(color(255, 255, 255, 30));
  strokeWeight(2);
  stroke(255);

  noStroke();

}

float sc = 1;
float offScale = 0;
int ScaleDegree = 180;


void drawTitle(){

  pushMatrix();
  translate(width / 2, 70);
  changeScale();

  scale( sc - offScale );


  fill(color(0, 121, 107));
  rect(0, 0, 250, 90, 20);

  textSize(48);
  fill(255);
  shape(GameTitle, 0, 5, 200, 100);

  popMatrix();
}

void changeScale(){
  offScale = sin(radians(ScaleDegree)) * 0.1;
  ScaleDegree+=2;
}
