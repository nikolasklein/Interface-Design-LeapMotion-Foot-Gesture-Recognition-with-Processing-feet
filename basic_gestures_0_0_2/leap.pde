void leapOnInit() {
  println("Leap Motion Init");
}
void leapOnConnect() {
  println("Leap Motion Connect");
}
void leapOnFrame() {
  // println("Leap Motion Frame");
}
void leapOnDisconnect() {
  // println("Leap Motion Disconnect");
}
void leapOnExit() {
  // println("Leap Motion Exit");
}

// Get the current Hand object from the leap motion
void setHands(){
  // Reset leap vars
  leap_hand = null;
  leap_hand_isset = false;
  
  for (Hand hand : leap.getHands()) {
    leap_hand = hand;
    leap_hand_isset = true;    
  }
}
