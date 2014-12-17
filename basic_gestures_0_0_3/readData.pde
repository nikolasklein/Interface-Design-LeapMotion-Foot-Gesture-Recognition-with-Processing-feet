  // Read the data from the Hand object and put it into a Dataset
void readData() {
   float posX, posY, posZ;
   
  if (leap_hand_isset) {
    posX = round(map(leap_hand.getPosition().x, 800, 0, 0, width));
    posY = round(map(leap_hand.getPosition().y, 300, 600, height, 0));
    posZ = round(leap_hand.getPosition().z);
  } else {
    posX = 0;
    posY = 0;
    posZ = 0;
  }

  // Create a dataset with the current data
  dataset = new Dataset(leap_hand_isset, datasetCounter, time, posX, posY, posZ);
  datasetCounter++;
  
  // Add the current dataset to datasets
  datasets.add(dataset);

  // If datasets has more than 250 items remove the first one
  if (datasets.size() > 250) {
    datasets.remove(0);
  }
}

