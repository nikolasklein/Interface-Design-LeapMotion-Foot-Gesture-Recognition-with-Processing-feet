// Display the collected information as text

int textPositionY = 70;
int textLineHeight = 24;

void printText() {
  fill(0);
  textAlign(LEFT);
  textSize(14);


  textPositionY = 70;
  textLineHeight = 20;

  if (showFrames) {
    printFrames();
  }

  if (showDatasets) {
    printDatasets();
  }

  if (showCurrent) {
    printCurrent();
  }

  if (showGestures) {
    printGestures();
  }
}

void printFrames() {
  // Display frame information
  text("FRAMES", 20, textPositionY);
  textPositionY += textLineHeight;
  text("frameCount: "  + frameCount, 20, textPositionY);
  textPositionY += textLineHeight;
  text("frameRate: "  + floor(frameRate), 20, textPositionY);

  textPositionY += textLineHeight * 2;
}

void printCurrent() {
  // Display information about the current position
  text("CURRENT", 20, textPositionY);
  textPositionY += textLineHeight;

  if (leap_hand_isset) {
    text("x: "  + dataset.position.x, 20, textPositionY);
    textPositionY += textLineHeight;
    text("y: "  + dataset.position.y, 20, textPositionY);
    textPositionY += textLineHeight;
    text("z: "  + dataset.position.z, 20, textPositionY);
    textPositionY += textLineHeight;
    text("distanceXY: "  + round(dataset.distanceXY), 20, textPositionY);
    textPositionY += textLineHeight;
    text("velocityXY: "  + dataset.velocityXY, 20, textPositionY);
    textPositionY += textLineHeight;
    text("movementX: "  + dataset.movementX, 20, textPositionY);
    textPositionY += textLineHeight;
    text("movementY: "  + dataset.movementY, 20, textPositionY);
  } else {
    text("No current data", 20, textPositionY);
    textPositionY += textLineHeight * 6;
  }

  textPositionY += textLineHeight * 2;
}

void printDatasets() {
  // Display information about the collected data
  text("DATASETS", 20, textPositionY);
  textPositionY += textLineHeight;

  if (datasets.size() > 0) {
    text("length: "  + datasets.size(), 20, textPositionY);
    textPositionY += textLineHeight;

    text("earliest timestamp: "  + datasets.get(0).time, 20, textPositionY);
    textPositionY += textLineHeight;

    text("latest timestamp: "  + dataset.time, 20, textPositionY);
    textPositionY += textLineHeight;

    text("time difference: "  + (dataset.time - datasets.get(0).time), 20, textPositionY);
  }

  textPositionY += textLineHeight * 2;
}

void printGestures() {
  text("GESTURES", 20, textPositionY);
  textPositionY += textLineHeight;

  if (datasets.size() > 0) {
    text("movementX: "  + movementX, 20, textPositionY);
    textPositionY += textLineHeight; 
    
    if (movementXHistory.size() > 3)  {
    text("Distance of last movementX: "  + movementXHistory.get(movementXHistory.size()-1).duration, 20, textPositionY);
    textPositionY += textLineHeight;
    }
    
    text("left.counter: "  + left.counter, 20, textPositionY);
    textPositionY += textLineHeight;

    text("left.buffer: "  + left.buffer, 20, textPositionY);
    textPositionY += textLineHeight;

    text("right.counter: "  + right.counter, 20, textPositionY);
    textPositionY += textLineHeight;

    text("right.buffer: "  + right.buffer, 20, textPositionY);
    textPositionY += textLineHeight;

    text("gesture: "  + gesture.gesture, 20, textPositionY);
    textPositionY += textLineHeight;
  }
}

