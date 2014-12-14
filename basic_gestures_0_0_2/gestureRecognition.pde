void gestureRecognition() {

  if (dataset.directionX == null) {
    noMoveXCount++;
  } else {
    noMoveXCount = 0;
  }

  if (dataset.directionY == null) {
    noMoveYCount++;
  } else {
    noMoveYCount = 0;
  }

  if (dataset.directionX == "right") {

    goingRight = true;

    if (goingLeft == true) {
      leftCounterBuffer = leftCounter;
      leftCounter = 0;
      goingLeft = false;
    }

    rightCounter++;
  } else if (dataset.directionX == "left") {

    goingLeft = true;

    if (goingRight == true) {
      rightCounterBuffer = rightCounter;
      rightCounter = 0;
      goingRight = false;
    }

    leftCounter++;
  }
  
  if (noMoveXCount >= 20)  {
    rightCounterBuffer = 0;
    leftCounterBuffer = 0;
  }
}

