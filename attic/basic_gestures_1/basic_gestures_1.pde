import de.voidplus.leapmotion.*;

LeapMotion leap;

float leap_hand_mostright = 0;

Hand leap_lefthand;
boolean leap_lefthandset = false;
Hand leap_righthand;
boolean leap_righthandset = false;

int leap_lefthand_fingercount = 0;
int prevFrameCount = 0;
int lastFrameCount = 0;

int focusenergy = 150, focusenergymax = 150, focustime = 0;


boolean focusenergyfull = true;
boolean focusmode = false;
boolean normal = true;
boolean focusfailed = false;

void setup() {
  size(1280, 800, P3D);
  background(255);
  noStroke(); 
  fill(50);
  // ...

  leap = new LeapMotion(this);

  rectMode(CENTER);
}

void draw() {
  background(255);
  // ...
  int fps = leap.getFrameRate();

  // hand info reset
  leap_hand_mostright = 0;
  leap_righthand = null;
  leap_righthandset = false;
  leap_lefthand = null;
  leap_lefthandset = false;
  int number = 0;

  for (Hand hand : leap.getHands()) {
    //hand.draw();
    //proof draw for wrong positions and wrong stuff
    number++;
    fill(#FF0000);
    text(number, hand.getPosition().x+15, hand.getPosition().y+15);
    ellipse(hand.getPosition().x, hand.getPosition().y, 10, 10);
    fill(0);
    if (hand.getPosition().y < 100 || hand.getPosition().z < 0){
      break;
    }
    
    if (hand.getPosition().x > leap_hand_mostright) {
      if (!leap_righthandset) { // checken ob rechte hand schon gesetzt ist
        leap_righthand = hand;
        leap_hand_mostright = hand.getPosition().x;
        leap_righthandset = true;
      }
      else { // die rechteste hand auf rechts - die andere dann auf links - korrigiert falsche erkennungen weil es in der for Hand schleife läuft
        Hand savehand = leap_righthand;
        leap_righthand = hand;
        leap_righthandset = true;

        leap_hand_mostright = hand.getPosition().x;

        leap_lefthand = savehand;
        leap_lefthandset = true;
      }
    }
    else { // xpos nicht größer als leap_hand_mostright => muss also links sein
      leap_lefthand = hand;
      leap_lefthandset = true;
    }
    
    if(leap_lefthandset && leap_righthandset){
      break;
    }

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

    // FINGERS
    for (Finger finger : hand.getFingers()) {

      // Basics
      //finger.draw();
      int     finger_id         = finger.getId();
      PVector finger_position   = finger.getPosition();
      PVector finger_stabilized = finger.getStabilizedPosition();
      PVector finger_velocity   = finger.getVelocity();
      PVector finger_direction  = finger.getDirection();
      float   finger_time       = finger.getTimeVisible();

      // Touch Emulation
      int     touch_zone        = finger.getTouchZone();
      float   touch_distance    = finger.getTouchDistance();
    }
  }

  if (leap_righthandset) { // rechte hand kann nicht auf der linken Seite sein
    if (!leap_lefthandset && leap_righthand.getPosition().x < width/2) {
      leap_righthand = null;
      leap_righthandset = false;
      text("only one hand - not allowed on left side", 20, 200);
    }
  }

  // lefthand gesten
  if (leap_lefthandset) {
    //finger reset
    leap_lefthand_fingercount=0;
    PVector fingertime = new PVector(0, 0, 0);
    // FINGERS
    for (Finger finger : leap_lefthand.getFingers()) {
      leap_lefthand_fingercount++;
      // Basics
      //finger.draw();
      int     finger_id         = finger.getId();
      PVector finger_position   = finger.getPosition();
      PVector finger_stabilized = finger.getStabilizedPosition();
      PVector finger_velocity   = finger.getVelocity();
      PVector finger_direction  = finger.getDirection();
      float   finger_time       = finger.getTimeVisible();
    }

    text(leap_lefthand_fingercount, 20, 60);

    if (leap_lefthand_fingercount>1 || focusfailed){
      if (frameCount-lastFrameCount<20 && !normal) {
          text("boom * " + focustime, 20, 80);
          focusmode = false;
      }
      else {
        normal = true;
        text("normal", 20, 80);
      }
      
      if(leap_lefthand_fingercount>1 && focusfailed){
        focusfailed = false;
      }
      
      float slowdown = floor(map(focusenergy, focusenergymax, 0, 4, 2)); // slowdown => easing 
      if (focusenergy<focusenergymax && frameCount % slowdown == 0) {
        focusenergy++;
      }
      
      prevFrameCount = frameCount;
    }
    else {
      if (focusenergy>30 || focusmode) {
        focusfailed = false;
        normal = false;
        focusmode = true;
        focustime = frameCount-prevFrameCount;
        lastFrameCount = frameCount;
        
        float slowdown = floor(map(focusenergy, focusenergymax, 0, 2, 3));
        
        text( focusenergy + " focusenergy % " + slowdown, 20,100 );
        
        if (focusenergy>0 && frameCount % slowdown == 0) {
          focusenergy--;
        }
        
        if(focusenergy <= 0){
          focusmode = false;
          focusfailed = true;
        }
        text("focustime! " + focustime, 20, 80);
      }
      else {
        text("not enough focusenergy to start! ", 20, 80);
      }
    }
  }

  //focusenergybar
  fill(255,0,0, 100);
  rect(width/2, height-1, focusenergymax, 2);
  fill(#FF0000);
  rect(width/2, height-1, focusenergy, 2);
  fill(0); 



  // anzeigen der werte
  if (leap_righthandset) {
    text(leap_righthand.getId() + " right // "  + leap_righthand.getPosition(), 20, 20);
    leap_righthand.draw();
    for (Finger finger : leap_righthand.getFingers()) {
      finger.draw();
    }
  }
  if (leap_lefthandset) {
    text(leap_lefthand.getId() + " left // "  + leap_lefthand.getPosition(), 20, 40);
    leap_lefthand.draw();
    for (Finger finger : leap_lefthand.getFingers()) {
      finger.draw();
    }
  }
}// END DRAW

void leapOnInit() {
  // println("Leap Motion Init");
}
void leapOnConnect() {
  // println("Leap Motion Connect");
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

