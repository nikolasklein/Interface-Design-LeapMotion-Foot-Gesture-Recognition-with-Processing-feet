// Object storing the data of one possible direction to move in
class Direction {
  String direction;
  int counter = 0;
  int buffer = 0;
  int time;
  boolean moving = false;
  
  Direction(String _direction)  {
    this.direction = _direction;
  }
}

