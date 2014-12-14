class Dataset {
  boolean tracked;
  int time;
  PVector position = new PVector();

  float distance;
  float distanceXY;

  String directionX;
  String directionY;
  
  float velocity;
  float velocityXY;

  Dataset(boolean _leap_hand_isset, int _time, float _posX, float _posY, float _posZ) {
    this.tracked = _leap_hand_isset;
    this.time = _time;
    this.position.set(_posX, _posY, _posZ);

    if (datasets.size() > 0 && datasetPrev.tracked) {
      // Get the distance from the last tracked position
      distance = PVector.dist(this.position, datasetPrev.position);
      distanceXY = dist(this.position.x, this.position.y, datasetPrev.position.x, datasetPrev.position.y);

      // Get the direction of the movement
      float differenceX = datasetPrev.position.x - this.position.x;
      float differenceY = datasetPrev.position.y - this.position.y;

      if (differenceX > 2) {
        directionX = "left";
      } else if (differenceX < -2) {
        directionX = "right";
      }

      if (differenceY > 2) {
        directionY = "up";
      } else if (differenceY < -2) {
        directionY = "down";
      }

      // Get the velocity of the movement
      int timeSinceLastDataset = this.time - datasetPrev.time; 
      this.velocity = this.distance / timeSinceLastDataset;
      this.velocityXY = this.distanceXY / timeSinceLastDataset;
    }
  }
}
