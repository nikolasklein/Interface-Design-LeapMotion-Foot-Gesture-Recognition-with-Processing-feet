void getXMovement() {
  int movementXHistorySize = movementXHistory.size();

  // If the last dataset was moving right
  if (dataset.movementX == "right") {

    // If it wasn't moving right before, reset the buffer, set the time, change the current movement and add it to history
    if (right.moving == false) {
      right.buffer = 0;
      right.startTime = time;
      right.startPosition = dataset.position.x;
      right.moving = true;
      right.averageVelocity = dataset.velocity;
      movementX = "right";
      movementXHistory.add(right);
    }

    // If it was moving left before update the buffer, reset the counter
    if (left.moving == true  && movementXHistorySize > 1) {
      movementXHistory.get(movementXHistorySize-2).endTime = time;
      movementXHistory.get(movementXHistorySize-2).getDuration();
      movementXHistory.get(movementXHistorySize-2).moving = false;
      movementXHistory.get(movementXHistorySize-2).counter = left.counter;
      movementXHistory.get(movementXHistorySize-2).endPosition = dataset.position.x;
      movementXHistory.get(movementXHistorySize-2).getDistance();
      left.buffer = left.counter;
      left.counter = 0;
      left.averageVelocity = 0;
      left.moving = false;
    }

    // If it was not moving  before update reset the counter
    if (noX.moving == true && movementXHistorySize > 1) {
      movementXHistory.get(movementXHistorySize-2).endTime = time;
      movementXHistory.get(movementXHistorySize-2).getDuration();
      movementXHistory.get(movementXHistorySize-2).moving = false;
      movementXHistory.get(movementXHistorySize-2).counter = noX.counter;

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
      left.startTime = time;      
      left.startPosition = dataset.position.x;
      left.moving = true;
      left.averageVelocity = dataset.velocity;
      movementX = "left";
      movementXHistory.add(left);
    }

    // If it was moving right before update the buffer, reset the counter
    if (right.moving == true && movementXHistorySize > 1) {
      movementXHistory.get(movementXHistorySize-2).endTime = time;
      movementXHistory.get(movementXHistorySize-2).getDuration();
      movementXHistory.get(movementXHistorySize-2).moving = false;
      movementXHistory.get(movementXHistorySize-2).counter = right.counter;
      movementXHistory.get(movementXHistorySize-2).endPosition = dataset.position.x;
      movementXHistory.get(movementXHistorySize-2).getDistance();

      right.buffer = right.counter;
      right.counter = 0;     
      right.averageVelocity = 0;
      right.moving = false;
    }

    // If it was not moving  before update reset the counter
    if (noX.moving == true && movementXHistorySize > 1) {
      movementXHistory.get(movementXHistorySize-2).endTime = time;
      movementXHistory.get(movementXHistorySize-2).getDuration();
      movementXHistory.get(movementXHistorySize-2).moving = false;
      movementXHistory.get(movementXHistorySize-2).counter = noX.counter;

      noX.moving = false;
      noX.counter = 0;
    }

    // Count up
    left.counter++;

    // If the last dataset was not moving
  } else if (dataset.movementX == null) {
    // Count up  
    noX.counter++;
  }

  // If there was no movement for a while
  if (noX.counter >= 10) {
    // If it wasn't not moving before, reset the buffer, set the time, change the current movement and add it to history
    if (noX.moving == false) {
      noX.buffer = 0;
      noX.startTime = time;
      noX.moving = true;
      noX.averageVelocity = dataset.velocity;
      movementX = "noX";
      movementXHistory.add(noX);
    }

    // If it was moving right before update the buffer, reset the counter
    if (right.moving == true && movementXHistorySize > 1) {
      movementXHistory.get(movementXHistorySize-2).endTime = time;
      movementXHistory.get(movementXHistorySize-2).getDuration();
      movementXHistory.get(movementXHistorySize-2).moving = false;
      movementXHistory.get(movementXHistorySize-2).counter = right.counter;
      movementXHistory.get(movementXHistorySize-2).endPosition = dataset.position.x;
      movementXHistory.get(movementXHistorySize-2).getDistance();

      right.buffer = right.counter;
      right.counter = 0;     
      right.averageVelocity = 0;
      right.moving = false;
    }

    // If it was moving left before update the buffer, reset the counter
    if (left.moving == true && movementXHistorySize > 1) {
      movementXHistory.get(movementXHistorySize-2).endTime = time;      
      movementXHistory.get(movementXHistorySize-2).getDuration();
      movementXHistory.get(movementXHistorySize-2).moving = false;
      movementXHistory.get(movementXHistorySize-2).counter = left.counter;
      movementXHistory.get(movementXHistorySize-2).endPosition = dataset.position.x;
      movementXHistory.get(movementXHistorySize-2).getDistance();

      left.buffer = left.counter;
      left.counter = 0;     
      left.averageVelocity = 0;
      left.moving = false;
    }
  }
}

