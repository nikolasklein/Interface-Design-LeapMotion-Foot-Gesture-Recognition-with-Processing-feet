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
boolean goingRight = false;
int rightCounter = 0;
int rightCounterBuffer = 0;
boolean goingLeft = false;
int leftCounter = 0;
int leftCounterBuffer = 0;

// Leap vars
Hand leap_hand;
Boolean leap_hand_isset = false;

// Software control vars
Boolean showText = true;
Boolean showFrames = false;
Boolean showCurrent = true;
Boolean showDatasets = false;
Boolean showGestures = true;


void setup() {
  size(800, 700);
  background(255);

  fill(0);
  noStroke();
  // rectMode(CENTER);

  leap = new LeapMotion(this);
}

void draw() {
  // General setup of the draw space
  setupDraw();

  // Get the current Hand object from the leap motion
  setHands();

  // Read the data from the Hand object and put it into a Dataset
  readData();


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

void keyPressed() {
  if (key == TAB) {
    if (showText) { 
      showText = false;
    } else { 
      showText = true;
    }
  } 

  // f
  if (key == 70 || key == 102) {
    if (showFrames) { 
      showFrames = false;
    } else { 
      showFrames = true;
    }
  } 

  // c
  if (key == 67 || key == 99) {
    if (showCurrent) { 
      showCurrent = false;
    } else { 
      showCurrent = true;
    }
  }


  // d
  if (key == 68 || key == 100) {
    if (showDatasets) { 
      showDatasets = false;
    } else { 
      showDatasets = true;
    }
  } 


  // g
  if (key == 71 || key == 103) {
    if (showGestures) { 
      showGestures = false;
    } else { 
      showGestures = true;
    }
  }
}

