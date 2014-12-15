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
  if (movementXHistory.size() > 3) {
    int size = movementXHistory.size();

    if (movementXHistory.get(size-3).movement == "right" && movementXHistory.get(size-2).movement == "left" && movementXHistory.get(size-1).movement == "noX") {
      gestureCounter++;

      gesture.gesture = "Swipe Right";
      gesture.id = gestureCounter;
      gesture.time = time;
      gestureHistory.add(gesture);

      movementXHistory.add(noX);
    } else if (movementXHistory.get(size-3).movement == "left" && movementXHistory.get(size-2).movement == "right" && movementXHistory.get(size-1).movement == "noX") {
      gestureCounter++;

      gesture.gesture = "Swipe Left";
      gesture.id = gestureCounter;
      gesture.time = time;
      gestureHistory.add(gesture);

      movementXHistory.add(noX);
    }
  }
}

void getXMovement() {
  // If the last dataset wasn't moving in this frame start counting up noX
  if (dataset.movementX == null) {
    noX.counter++;
  }

  // If the last dataset was moving right
  if (dataset.movementX == "right") {

    // If it wasn't moving right before, reset the buffer, set the time, change the current movement and add it to history
    if (right.moving == false) {
      right.buffer = 0;
      right.starttime = time;
      right.moving = true;
      right.averageVelocity = dataset.velocity;
      movementX = "right";
      movementXHistory.add(right);
    }

    // If it was moving left before update the buffer, reset the counter
    if (left.moving == true) {
      movementXHistory.get(0).endtime = time;
      movementXHistory.get(0).moving = false;
      movementXHistory.get(0).counter = left.counter;

      left.buffer = left.counter;
      left.counter = 0;
      left.averageVelocity = 0;
      left.moving = false;
    }

    // If it was not moving  before update reset the counter
    if (noX.moving == true) {
      noX.moving = false;
      noX.counter = 0;
    }

    // Count up
    right.addToAverageVelocity(dataset.velocity);
    right.counter++;

    // If the last dataset was moving left
  } else if (dataset.movementX == "left") {

    // If it wasn't moving left before, reset the buffer, set the time, change the current movement and add it to history
    if (left.moving == false) {
      left.buffer = 0;
      left.starttime = time;
      left.moving = true;
      left.averageVelocity = dataset.velocity;
      movementX = "left";
      movementXHistory.add(left);
    }

    // If it was moving right before update the buffer, reset the counter
    if (right.moving == true) {
      movementXHistory.get(0).endtime = time;
      movementXHistory.get(0).moving = false;
      movementXHistory.get(0).counter = right.counter;

      right.buffer = right.counter;
      right.counter = 0;     
      right.averageVelocity = 0;
      right.moving = false;
    }

    // If it was not moving  before update reset the counter
    if (noX.moving == true) {
      movementXHistory.get(0).endtime = time;
      movementXHistory.get(0).moving = false;
      movementXHistory.get(0).counter = noX.counter;

      noX.moving = false;
      noX.counter = 0;
    }

    // Count up
    left.counter++;
  }

  // If there was no movement for a while
  if (noX.counter >= 10) {
    // If it wasn't not moving before, set the time, change the current movement and add it to history
    if (noX.moving == false) {
      noX.starttime = time;
      noX.moving = true;
      movementXHistory.add(noX);
      movementX = "noX";
    }

    // If it was moving right before update the buffer, reset the counter
    if (right.moving == true) {
      movementXHistory.get(0).endtime = time;
      movementXHistory.get(0).moving = false;
      movementXHistory.get(0).counter = right.counter;

      right.buffer = right.counter;
      right.counter = 0;
      right.moving = false;
    }

    // If it was moving left before update the buffer, reset the counter
    if (left.moving == true) {
      movementXHistory.get(0).endtime = time;
      movementXHistory.get(0).moving = false;
      movementXHistory.get(0).counter = left.counter;

      left.buffer = left.counter;
      left.counter = 0;
      left.moving = false;
    }
  }
}

