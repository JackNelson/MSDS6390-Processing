// initializeConstellations : Function to initialize the constellations integer Dictionary and the coordinates array
void initializeConstellations(int centerX, int centerY) {
  starLocation = loadTable("stars.csv", "header, csv");

  // re-scale the coordinates according to the current image
  for (TableRow row : starLocation.rows()) {
    row.setFloat(1, row.getFloat(1) - centerX);
    row.setFloat(2, row.getFloat(2) - centerY);
  }

  // Load the updated data in a csv file in data folder for reference
  // saveTable(starLocation, "data/updated.csv");

  // Get number of Constellations
  String constellationName = "";
  int countOfConstellations=0;

  // Get the count of the constellations
  for (TableRow row : starLocation.rows()) {
    if (! constellationName.equals(row.getString(0).trim())) {
      constellationName = row.getString(0).trim();
      countOfConstellations++;
    }
  }

  constellationName = "";
  int objectCount=0, recordCount = 0;

  // Create the constellation objects
  constellation = new Constellation[countOfConstellations];
  // Used Set to get number of distinct stars in the constellation
  //   This is because the constellation stars location has been collected in a way that when redrawn, the shape of the constellation does not change
  //   For this reason, the same star coordinates could be repeated in the collection
  Set toCountDistinctCord = new HashSet<String>();
  int numberOfPoints = 0;
  int startIndexInFile = 0;
  for (TableRow row : starLocation.rows()) {
    if (! constellationName.equals(row.getString(0).trim())) {
      if (recordCount>0) {
        constellation[objectCount] = new Constellation(constellationName, numberOfPoints, toCountDistinctCord.size(), startIndexInFile);
        objectCount++;
      } 
      constellationName = row.getString(0).trim();
      toCountDistinctCord.clear();
      numberOfPoints = 0;
      startIndexInFile = recordCount;
    }
    toCountDistinctCord.add(String.valueOf(row.getFloat(1))+String.valueOf(row.getFloat(2)));
    numberOfPoints++;
    recordCount++;
  }
  constellation[objectCount] = new Constellation(constellationName, numberOfPoints, toCountDistinctCord.size(), startIndexInFile);
}