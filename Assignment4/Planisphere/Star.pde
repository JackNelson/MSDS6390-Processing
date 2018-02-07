class Constellation {
  String constellationName;
  int numberOfPoints;
  int numberDistinctStars;
  int startIndexInFile;

  //Constructor
  Constellation(String constellationName, int numberOfPoints, int numberDistinctStars, int startIndexInFile) {
    this.constellationName = constellationName;
    this.numberOfPoints = numberOfPoints;
    this.numberDistinctStars = numberDistinctStars;
    this.startIndexInFile = startIndexInFile;
  }

  // Overloaded toString Method
  String toString() {
    return (constellationName + "\n" + "Number of Stars: " + String.valueOf(numberDistinctStars));
  }

  // getter to get numberOfPoints
  int getNumberOfPoints() {
    return this.numberOfPoints;
  }

  // getter to get numberOfPoints
  int getStartIndexInFile() {
    return this.startIndexInFile;
  }

  // getter to get ConstellationName
  String getConstellationName() {
    return this.constellationName;
  }
}