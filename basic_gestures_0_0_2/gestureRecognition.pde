// Search for gestures
void gestureRecognition() {

  // Display the gesuture at the bottom
  if (time - gesture.time  < 800) {
    textAlign(CENTER);
    textSize(40);
    float alpha = map (time - gesture.time, 0, 800, 0, 255);
    fill(alpha);
    text(gesture.gesture, width/2, height - 60);
  } else {
    gesture.gesture = "none";
  }

  // Get the current movements in x dimension
  getXMovement();

  // Check for swipes
  if (directionHistory.size() > 3) {
    int size = directionHistory.size();

    if (directionHistory.get(size-3).direction == "right" && directionHistory.get(size-2).direction == "left" && directionHistory.get(size-1).direction == "noX") {
      gesture.gesture = "Swipe Right";
      gesture.id++;
      gesture.time = time;
      directionHistory.add(noX);
    } else if (directionHistory.get(size-3).direction == "left" && directionHistory.get(size-2).direction == "right" && directionHistory.get(size-1).direction == "noX") {
      gesture.gesture = "Swipe Left";
      gesture.id++;
      gesture.time = time;
      directionHistory.add(noX);
    }
  }
}

void getXMovement() {
  // If the last dataset wasn't moving in this frame start counting up noX
  if (dataset.directionX == null) {
    noX.counter++;
  }

  // If the last dataset was moving right
  if (dataset.directionX == "right") {

    // If it wasn't moving right before, reset the buffer, set the time, change the current direction and add it to history
    if (right.moving == false) {
      right.buffer = 0;
      right.time = time;
      right.moving = true;
      directionX = "right";
      directionHistory.add(right);
    }

    // If it was moving left before update the buffer, reset the counter
    if (left.moving == true) {
      left.buffer = left.counter;
      left.counter = 0;
      left.moving = false;
    }

    // If it was not moving  before update reset the counter
    if (noX.moving == true) {
      noX.moving = false;
      noX.counter = 0;
    }

    // Count up
    right.counter++;

    // If the last dataset was moving left
  } else if (dataset.directionX == "left") {

    // If it wasn't moving left before, reset the buffer, set the time, change the current direction and add it to history
    if (left.moving == false) {
      left.buffer = 0;
      left.time = time;
      left.moving = true;
      directionX = "left";
      directionHistory.add(left);
    }

    // If it was moving right before update the buffer, reset the counter
    if (right.moving == true) {
      right.buffer = right.counter;
      right.counter = 0;
      right.moving = false;
    }

    // If it was not moving  before update reset the counter
    if (noX.moving == true) {
      noX.moving = false;
      noX.counter = 0;
    }

    // Count up
    left.counter++;
  }

  // If there was no movement for a while
  if (noX.counter >= 10) {
    // If it wasn't not moving before, set the time, change the current direction and add it to history
    if (noX.moving == false) {
      noX.time = time;
      noX.moving = true;
      directionHistory.add(noX);
      directionX = "noX";
    }

    // Reset right and left
    right.counter = 0;
    right.buffer = 0;
    right.moving = false;

    left.counter = 0;
    left.buffer = 0;
    left.moving = false;
  }
}

