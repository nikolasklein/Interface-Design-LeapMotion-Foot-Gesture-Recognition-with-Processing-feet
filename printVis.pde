// Display the visualisation of the collected information
void printVis() {

  // Diplay a warning if there is no hand visible
  if (!leap_hand_isset) {
    textSize(14);
    noStroke();
    fill(255, 0, 0);
    rectMode(CORNER);
    rect(0, 0, width, 40);
    fill(255);
    textAlign(CENTER);
    text("NOT TRACKING", width/2, 25);
  }

  // Draw lines beteween the datasets (if they are tracked)
  if (datasets.size() > 1) {
    for (int i = floor (datasets.size ()*0.8); i < datasets.size(); i++) {
      if (datasets.get(i).tracked && datasets.get(i-1).position.x != 0 && datasets.get(i-1).position.y != 0) {
        float alpha = map(i, floor(datasets.size()*0.8), datasets.size(), 200, 50);
        stroke(alpha);
        strokeWeight(4);
        line(datasets.get(i).position.x, datasets.get(i).position.y, datasets.get(i-1).position.x, datasets.get(i-1).position.y);
      }
    }
  }

  // Draw the current position (if it is tracked)
  if (leap_hand_isset) {
    fill(255, 0, 0);
    noStroke();
    ellipse(dataset.position.x, dataset.position.y, 10, 10);
  }
}

