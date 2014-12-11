import de.voidplus.leapmotion.*;

LeapMotion leap;

float leap_hand_bottom = 0;
Hand leap_hand;
boolean leap_handset = false;
float handX, handY, handZ, centerX, centerY;

float bottom = 0;
float bottomHeight = 50;

float lowest = 0;

boolean exitBottom = false;
boolean exitBottomXSet = false;
float exitBottomX = 0;




void setup() {
  size(600 , 700);
  background(255);
  
  leap = new LeapMotion(this);
  rectMode(CENTER);
  
  
}

void draw() {
  // int fps = leap.getFrameRate();
  noStroke();
  background(255, 255, 255);
  
  setHands();

  // anzeigen der werte
  // zum besseren tracken wird hier eine hand drangeklebt
  if (leap_handset) {
    
    //ummappen der werte aufgrund der umgekehrten leap motion 
    handX = round(map(leap_hand.getPosition().x, 500, 0, 0, width));
    handY = round(map(leap_hand.getPosition().y, 200, 600, height, 0));
    handZ = round(leap_hand.getPosition().z);
    
    if(lowest < handY){
      lowest = handY;
    }
    
    text(" x // "  + handX, 20, 40);
    text(" y // "  + handY, 20, 60);
    text(" z // "  + handZ, 20, 80);
    
    text(" centerX // "  + centerX, 20, 110);
    text(" centerY // "  + centerY, 20, 130);
    
    //bottom is actually the highest value, because the leap motion is turned around
    text(" lowest // "  + lowest, 20, 160);
    
    

    fill(255, 0, 0);
    ellipse(handX, handY, 10, 10);
    
    if(handY < bottom-bottomHeight){
      exitBottom = true;
    }else{
      exitBottom = false;
      exitBottomXSet = false;
    }
    
    if(exitBottom && !exitBottomXSet){
      exitBottomXSet = true;
      exitBottomX = handX;
    }
    
    if(centerX != 0){
      fill(0, 0, 0);
      ellipse(centerX, centerY, 5, 5);
    }
    
    
    if(bottom != 0){
      stroke(0, 0, 0, 40);
      line(0, bottom-bottomHeight, width, bottom-bottomHeight);
      stroke(0, 0, 0, 50);
      line(0, bottom, width, bottom);
      
      stroke(0, 0, 0, 20);
      line(0, lowest, width, lowest);
    }
    
    if(exitBottomXSet){
      fill(0, 0, 0, 50);
      ellipse(exitBottomX, bottom-bottomHeight, 2, 2);
    }
    
        
  }

}// END DRAW

void keyPressed() {
  if (key == ' ') {
    if(leap_handset){
      centerX = handX;
      centerY = handY;
      bottom = centerY;
    }
  }
}


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

