import de.voidplus.leapmotion.*;
LeapMotion leap;

// General vars
int time = 0;
int noMoveXCount;
int noMoveYCount;

Dataset dataset;
Dataset datasetPrev;
ArrayList<Dataset> datasets = new ArrayList<Dataset>();

// Gestures
String directionX;
ArrayList<Direction> directionHistory = new ArrayList<Direction>();

Direction right = new Direction("right");
Direction left = new Direction("left");
Direction noX = new Direction("noX");

Direction up = new Direction("up");
Direction down = new Direction("down");
Direction noY = new Direction("noY");

Gesture gesture = new Gesture();

// Leap vars
Hand leap_hand;
Boolean leap_hand_isset = false;

// Software control vars
Boolean showText = false;
Boolean showFrames = true;
Boolean showCurrent = true;
Boolean showDatasets = true;
Boolean showGestures = true;

void setup() {
  size(800, 700);
  background(255);

  fill(0);
  noStroke();

  leap = new LeapMotion(this);
}

void draw() {
  // General setup of the draw space
  setupDraw();

  // Get the current Hand object from the leap motion
  setHands();

  // Read the data from the Hand object and put it into a Dataset
  readData();

  // Search for gestures
  gestureRecognition();

  // Display the collected information as text
  if (showText) {
    printText();
  }

  // Display the visualisation of the collected information
  printVis();

  // Replace the previous dataset with this frames dataset for the next frame
  datasetPrev = dataset;
}
