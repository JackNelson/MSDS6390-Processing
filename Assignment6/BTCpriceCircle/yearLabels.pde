void yearLabels(){    
  String[] years = {"2012","2013","2014","2015","2016","2017"};
  textSize(10);
  fill(0, 0, 0);
  textAlign(LEFT);
  rotate(theta * 3); //rotate to month label starting point
  rotate(theta * (13 - startMonth)); //rotate to beginning of first full year
  
  // Based on tutorial at https://www.openprocessing.org/sketch/129166
  for(int i = 0; i < years.length; i++){
    float startAngle = (theta*13 - (textWidth(years[i]) / (innerR - textAscent()))) / 2 ; //calculate rotation to year label start

    rotate(startAngle); //rotate to year label start
    
    for (int j = 0; j < years[i].length(); j++) {
      char currentChar = years[i].charAt(j); //charAt(j) gets the character at position j in the String
      float charAngle = textWidth(currentChar) / (innerR - textAscent());

      rotate(charAngle / 2);
      text(currentChar, 0, -innerR + textAscent());
      rotate(charAngle / 2);
    }
    rotate(startAngle); //rotate to beginning of next year
  }
}