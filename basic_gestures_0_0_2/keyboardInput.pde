// Keyboard inputs to trigger the text displayscc
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

