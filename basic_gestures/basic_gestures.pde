import de.voidplus.leapmotion.*;

LeapMotion leap;

float leap_hand_bottom = 0;
Hand leap_hand;
boolean leap_handset = false;
float handX, handY, handZ;





void setup() {
  size(600 , 700, P3D);
  background(255);
  noStroke(); 
  fill(50);

  leap = new LeapMotion(this);
  rectMode(CENTER);
  
  
}

void draw() {
  // int fps = leap.getFrameRate();
  
  setHands();




  

  // anzeigen der werte
  // zum besseren tracken wird hier eine hand drangeklebt
  if (leap_handset) {
    
    //ummappen der werte aufgrund der umgekehrten leap motion 
    handX = map(leap_hand.getPosition().x, 500, 0, 0, width) ;
    handY = map(leap_hand.getPosition().y, 200, 600, height, 0);
    handZ = leap_hand.getPosition().z;
    
    text(" x // "  + leap_hand.getPosition().x, 20, 40);
    text(" y // "  + leap_hand.getPosition().y, 20, 60);
    text(" z // "  + handZ, 20, 80);
    
    
    fill(255, 0, 0, 50);
    ellipse(handX, handY, 2, 2);
    
    //leap_hand.leap_hand.getPosition().x;    
  }

}// END DRAW




void setHands(){
 // hand info reset
  leap_hand_bottom = 0;
  leap_hand = null;
  leap_handset = false;
  int number = 0;
  
  
  
  //setHand Start
  for (Hand hand : leap.getHands()) {
    
    //proof draw for wrong positions and wrong stuff
    number++;
    fill(#FF0000);
    
    leap_hand = hand;
    leap_handset = true;
    
    int     hand_id          = hand.getId();
    PVector hand_position    = hand.getPosition();
    PVector hand_stabilized  = hand.getStabilizedPosition();
    PVector hand_direction   = hand.getDirection();
    PVector hand_dynamics    = hand.getDynamics();
    float   hand_roll        = hand.getRoll();
    float   hand_pitch       = hand.getPitch();
    float   hand_yaw         = hand.getYaw();
    float   hand_time        = hand.getTimeVisible();
    PVector sphere_position  = hand.getSpherePosition();
    float   sphere_radius    = hand.getSphereRadius();

    
  }
}




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

