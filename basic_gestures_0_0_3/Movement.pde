// Object storing the data of one possible movement to move in
class Movement {
  String movement;
  int counter = 0;
  int buffer = 0;
  int startTime;
  int endTime;
  int duration;
  float startPosition;
  float endPosition;
  float distance;
  boolean moving = false;
  float averageVelocity;

  Movement(String _movement) {
    this.movement = _movement;
  }

  void addToAverageVelocity(float _currentVelocity) {
    this.averageVelocity = (this.averageVelocity + _currentVelocity) / 2;
  }

  void getDistance() {
    this.distance = this.endPosition - this.startPosition;
  }

  void getDuration() {
    this.duration = this.endTime - this.startTime;
  }
}

