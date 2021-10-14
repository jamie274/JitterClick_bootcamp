import processing.sound.*;

int clickCount = 0;
int randomColour = color(random(255), random(255), random(255));
boolean mousePressed = false;

int timer;
int startTime;
int countingDown;
int clicksPerSecond;

int p1Score = 0;
int p2Score = 0;
int difference;

void setup() {
  size(700, 400);
  textSize(72);
  fill(200);
  background(254, 232, 134);

  p1Score = 0;
  p2Score = 0;
}

void draw() {
  fill(0);
  textSize(72);
  text(clickCount, width/2, height/2);
}

void mousePressed() {
  mousePressed = true;
  if (mousePressed == true) {
    clickCount = clickCount + 1;
    background(randomColour);
    mousePressed = false;

    countDown();
    player1Score();
    player2Score();
  }
}

void player1Score() {
  clicksPerSecond = clickCount/startTime;
  if (countingDown == 0) {
    text("Player 1 score: " + clickCount, width/2-60, 350);
    text("Avg clicks per second: " + clicksPerSecond, width/2-60, 375);
    p1Score = clickCount;

    reset();
    text("click for player 2. stop at -10", width/2-130, 305);
    countDown();
    player2Score();
  }
}

void player2Score() {
  if (countingDown == -10) {
    text("Player 2 score: " + clickCount, width/2-60, 350);
    text("Avg clicks per second: " + clicksPerSecond, width/2-60, 375);
    p2Score = clickCount;
    if (p1Score > p2Score) {
      difference = p1Score - p2Score;
      text("PLAYER 1 WINS WITH " + p1Score + " CLICKS", width/2-150, 90);
      text("PLAYER 2 WAS " + difference + " CLICKS BEHIND WITH " + p2Score + " CLICKS", width/2-200, 120);
    } else {
      difference = p2Score - p1Score;
      text("PLAYER 2 WINS WITH " + p2Score + " CLICKS", width/2-150, 90);
      text("PLAYER 1 WAS " + difference + " CLICKS BEHIND WITH " + p1Score + " CLICKS", width/2-200, 120);
    }
  }
}

void countDown() {
  fill(#080000);
  textSize(25);
  timer = millis()/1000;

  startTime = 10;
  countingDown = startTime - timer;

  text("Time remaining: " + countingDown, 150, 50);
}

void reset() {
  clickCount = 0;
  startTime = 10;
}
