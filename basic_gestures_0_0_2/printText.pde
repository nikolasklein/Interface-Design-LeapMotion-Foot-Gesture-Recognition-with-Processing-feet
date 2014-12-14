// Display the collected information as text

int textPositionY = 70;
int textLineHeight = 20;

void printText() {
  fill(0);
  textAlign(LEFT);

  textPositionY = 70;
  textLineHeight = 20;

  if (showFrames) {
    printFrames();
  }

  if (showCurrent) {
    printCurrent();
  }

  if (showDatasets) {
    printDatasets();
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
    text("directionX: "  + dataset.directionX, 20, textPositionY);
    textPositionY += textLineHeight;
    text("directionY: "  + dataset.directionY, 20, textPositionY);
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
    text("noMoveXCount: "  + noMoveXCount, 20, textPositionY);
    textPositionY += textLineHeight;

    text("noMoveYCount: "  + noMoveYCount, 20, textPositionY);
    textPositionY += textLineHeight;

    text("goingLeftCounter: "  + leftCounter, 20, textPositionY);
    textPositionY += textLineHeight;

    text("goingLeftCounterBuffer: "  + leftCounterBuffer, 20, textPositionY);
    textPositionY += textLineHeight;

    text("goingRightCounter: "  + rightCounter, 20, textPositionY);
    textPositionY += textLineHeight;

    text("goingRightCounterBuffer: "  + rightCounterBuffer, 20, textPositionY);
    textPositionY += textLineHeight;
  } else {
    text("No data", 20, textPositionY);
    textPositionY += textLineHeight * 2;
  }
}

