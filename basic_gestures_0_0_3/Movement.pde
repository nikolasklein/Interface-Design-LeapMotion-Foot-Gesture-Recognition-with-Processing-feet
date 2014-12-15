// Object storing the data of one possible movement to move in
class Movement {
  String movement;
  int counter = 0;
  int buffer = 0;
  int starttime;
  int endtime;
  boolean moving = false;
  float averageVelocity;
  
  Movement(String _movement)  {
    this.movement = _movement;
  }
  
  void addToAverageVelocity(float _currentVelocity)  {
    this.averageVelocity = (this.averageVelocity + _currentVelocity) / 2;
  }
}

