import processing.sound.*;
import processing.serial.*;
import ddf.minim.*;

AudioPlayer player;
Minim minim;

Serial myPort;
void setup()
{
  fullScreen();
  String bellyDance = Serial.list()[0];
  myPort = new Serial(this, bellyDance, 9600);
  minim = new Minim(this);
  player = minim.loadFile("beat.aiff");
}

int tummyMovt;
int val;

void draw()
{
  if (myPort.available()>0) {
    val=myPort.read();
  }

  if (val ==1) {
    background(255);

    //face
    fill(255);
    strokeWeight(10);
    stroke(0);
    ellipse((width/2), (height-665), 150, 150);

    //eyes
    strokeWeight(5);
    line((width/2)-50, (height-690), (width/2)-20, (height-695));
    line((width/2)+50, (height-690), (width/2)+20, (height-695));

    //mouth
    line((width/2)-30, (height-628), (width/2)+40, (height-630));

    //tummy
    fill(0);
    strokeWeight(16);
    stroke(0);
    ellipse(width/2, height-400, 280, 350 );

    //legs
    line((width/2) -40, (height-200), (width/2)-40, (height));
    line((width/2) +40, (height-200), (width/2)-20, (height-75));
    line((width/2) -20, (height-75), (width/2)+40, height);

    //arms
    strokeWeight(10);
    stroke(255);
    fill(255);
    line((width/2)-100, (height-508), (width/2)-25, (height-320));
    line((width/2)+100, (height-508), (width/2), (height-350));
    ellipse((width/2)-25, (height-320), 20, 20);
    ellipse((width/2), (height-350), 20, 20);
    // stop();
    player.close();
    player = minim.loadFile("beat.aiff");
 
} else if (val==0) {
    // IT'S DARK!
    background(0);
    display();
    squiggle();
    circles();

    //face
    fill(255);
    strokeWeight(10);
    stroke(0);
    ellipse((width/2), (height-665), 150, 150);

    //eyes
    strokeWeight(5);
    fill(0);
    ellipse((width/2)-25, (height-680), 20, 30);
    ellipse((width/2)+25, (height - 680), 20, 30);
    fill(255);
    noStroke();
    ellipse((width/2)-25, (height-670), 25, 30);
    ellipse((width/2)+25, (height - 670), 25, 30);

    //mouth
    fill(0);
    arc((width/2), (height-645), 80, 90, 0, PI, CHORD);

    //arms
    strokeWeight(10);
    stroke(255);
    line((tummyMovt+width/2)-100, (height-508), (width/2)-200, (height-700));
    line((tummyMovt+width/2)+100, (height-508), (width/2)+200, (height-700));
    ellipse((width/2)-200, (height-700), 20, 20);
    ellipse((width/2)+200, (height-700), 20, 20);

    //legs
    line((tummyMovt+width/2)-40, (height-200), (width/2)-60, (height));
    line((tummyMovt+width/2)+40, (height-200), (width/2)+70, (height));
  }
  println(val);
}

void display() {
  fill(255);
  ellipse(tummyMovt+width/2, height-400, 280, 350);
  player.play();
}

void squiggle() {
  tummyMovt += random(-5, 5);
}


float circleSize = random(20, 100);
void circles() {
  noStroke();
  fill(random(0-255), random(0, 255), random(0, 255));
  ellipse(random(0, width), random(0, height), circleSize, circleSize);
  delay(20);
}

void stop() {
  player.close();
  minim.stop();
  super.stop();
}
