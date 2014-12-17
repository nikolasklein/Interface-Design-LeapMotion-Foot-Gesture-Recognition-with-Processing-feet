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

  // Check for swipes
  if (movementXHistory.size() > 3) {
    int size = movementXHistory.size();

    if (movementXHistory.get(size-3).movement == "right" && movementXHistory.get(size-2).movement == "left" && movementXHistory.get(size-1).movement == "noX") {
      gestureCounter++;

      gesture.gesture = "Swipe Right";
      gesture.id = gestureCounter;
      gesture.time = time;
      gestureHistory.add(gesture);

      movementXHistory.add(right);
    } else if (movementXHistory.get(size-3).movement == "left" && movementXHistory.get(size-2).movement == "right" && movementXHistory.get(size-1).movement == "noX") {
      gestureCounter++;

      gesture.gesture = "Swipe Left";
      gesture.id = gestureCounter;
      gesture.time = time;
      gestureHistory.add(gesture);

      movementXHistory.add(left);
    }
  }
}


