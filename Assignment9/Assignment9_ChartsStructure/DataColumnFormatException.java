public class DataColumnFormatException extends RuntimeException {
  String message;
  public DataColumnFormatException(ERRORTYPE obj) {
    message = getMessage(obj);
  }

  public DataColumnFormatException(String arg0, ERRORTYPE obj) {
    super(arg0);
    message = getMessage(obj);
  }

  public DataColumnFormatException(Throwable arg0, ERRORTYPE obj) {
    super(arg0);
    message = getMessage(obj);
  }

  public DataColumnFormatException(String arg0, Throwable arg1, ERRORTYPE obj) {
    super(arg0, arg1);
    message = getMessage(obj);
  }

  public DataColumnFormatException(String arg0, Throwable arg1, boolean arg2, boolean arg3, ERRORTYPE obj) {
    super(arg0, arg1, arg2, arg3);
    message = getMessage(obj);
  }
  
  private String getMessage(ERRORTYPE obj) {
    if(obj == ERRORTYPE.EXCEEDSMAXCATEGORY)
      return "Maximum of 20 Categories supported";
    else if(obj == ERRORTYPE.NOTDATE_CATEGORY)
      return "Column listing the various categories to draw the chart is not valid.\n" +
          "Category can only be either a categorical value with maximum 20 categories or a date field "
          + "\nwith format - should begin with - aabbyyyy or aasbbsyyyy)\n"
          + "where \n'aa' and 'bb' should be either mmdd or ddmm type \n's' can be any separator";
    else if(obj == ERRORTYPE.INVALIDDATEVALUE)
      return "The column with date values are having different formats. Kindly reverify the dataset. \nThere should not be any missing values and all the dates should be in the format:-"
          + "\n Must begin with - aabbyyyy or aasbbsyyyy)\n where \n'aa' and 'bb' should be either mmdd or ddmm type \n's' can be any separator";
    else return "Enum ERRORTYPE attribute not defined.";
  }
  
  public String getMessage() {
    return message;
  }

}
