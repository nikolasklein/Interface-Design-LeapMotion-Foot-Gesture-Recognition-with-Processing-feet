import de.voidplus.leapmotion.*;
LeapMotion leap;

// General vars
int time = 0;

// Datasets    
Dataset dataset;
Dataset datasetPrev;
ArrayList<Dataset> datasets = new ArrayList<Dataset>();
int datasetCounter = 0;

// Movements
String movementX;
ArrayList<Movement> movementXHistory = new ArrayList<Movement>();

Movement right = new Movement("right");
Movement left = new Movement("left");
Movement noX = new Movement("noX");

Movement up = new Movement("up");
Movement down = new Movement("down");
Movement noY = new Movement  ("noY");

// Gestures
Gesture gesture = new Gesture();
ArrayList<Gesture> gestureHistory = new ArrayList<Gesture>();
int gestureCounter = 0;

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

  getXMovement();

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
