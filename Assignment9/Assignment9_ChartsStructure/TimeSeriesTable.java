import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import processing.data.*;
import processing.core.*;
import processing.awt.*;

/**
 * @author Hari Narayan Sanadhya, Ireti Fasere, Jack Nelson
 *
 */
public class TimeSeriesTable extends Table {
  public static String sketchDataPath;
  private int categoricalColumnIndex;
  public Table summaryData;
  private String[] formats = { "mm/dd/yyyy", "mmddyyyy", "mm/dd/yyyy hh:mm:ss", "mm/dd/yyyy hhmmss",
      "mmddyyyy hhmmss" };

  /**
   * 
   */
  protected TimeSeriesTable() {
    super();
    categoricalColumnIndex = 0;
  }

  /**
   * @param file
   * @param options
   * @throws IOException
   */
  protected TimeSeriesTable(File file, String options) throws IOException {
    super(file, options);
    categoricalColumnIndex = 0;
  }

  /**
   * @param file
   * @throws IOException
   */
  protected TimeSeriesTable(File file) throws IOException {
    super(file);
    categoricalColumnIndex = 0;
  }

  /**
   * @param input
   * @param options
   * @throws IOException
   */
  protected TimeSeriesTable(InputStream input, String options) throws IOException {
    super(input, options);
    categoricalColumnIndex = 0;
  }

  /**
   * @param input
   * @throws IOException
   */
  protected TimeSeriesTable(InputStream input) throws IOException {
    super(input);
    categoricalColumnIndex = 0;
  }

  /**
   * @param rows
   */
  protected TimeSeriesTable(Iterable<TableRow> rows) {
    super(rows);
    categoricalColumnIndex = 0;
  }

  /**
   * @param rs
   */
  protected TimeSeriesTable(ResultSet rs) {
    super(rs);
    categoricalColumnIndex = 0;
  }

  private boolean validateDataset() throws DataColumnFormatException {
    if (this.getUnique(0).length > 20) {
      int formatIndex = -1;
      
        formatIndex = checkIfDateType(this.getRow(0).getString(0));
        if (formatIndex == -1)
          throw new DataColumnFormatException(ERRORTYPE.NOTDATE_CATEGORY);
      
      categoricalColumnIndex = createYearColumn(formatIndex);

    } else {
      categoricalColumnIndex = 0;
    }
    return true;
  }

  private int createYearColumn(int formatIndex) throws DataColumnFormatException {
    this.addColumn("Year", Table.INT);
    for (int i = 0; i < this.getRowCount(); i++) {
      try {
        this.setInt(i, "Year", Integer.valueOf(this.getString(i, 0).substring(6, 9)));
      } catch (Exception exp) {
        try {
          this.setInt(i, "Year", Integer.valueOf(this.getString(i, 0).substring(4, 7)));
        } catch (Exception e) {
          throw new DataColumnFormatException(ERRORTYPE.INVALIDDATEVALUE);
        }
      }
    }
    if(this.getUnique("Year").length > 20)
      throw new DataColumnFormatException(ERRORTYPE.EXCEEDSMAXCATEGORY);
    return this.getColumnIndex("Year");
  }

  private int checkIfDateType(String dateToValdate) {
    int index = -1;
    try {
      int year = Integer.valueOf(dateToValdate.substring(6, 9));
      return 0;
    } catch (Exception exp) {
      try {
        int year = Integer.valueOf(dateToValdate.substring(4, 7));
        return 0;
      } catch (Exception e) {
        return -1;
      }
    }
  }

  private boolean checkHuePresent() {
    if (this.getColumnCount() <= 2)
      return false;
    else if (this.getColumnCount() > 3)
      return true; // The third column in this case is a hue column
    else
      try {
        return (!this.getColumnTitle(2).equals("Year"));
      } catch (NullPointerException exp) {
        return false;
      }
  }

  public void summarizeData(String method) throws DataColumnFormatException {
    validateDataset();
    this.sort(categoricalColumnIndex);
    // method-local inner class
    class MethodInnerClass {
      String category;
      int value;
      String hue;

      public MethodInnerClass() {

      }

      MethodInnerClass(String category, String hue) {
        this.category = category;
        this.hue = hue;
        this.value = 0;
      }

      MethodInnerClass(String category) {
        this.category = category;
        this.hue = "";
        this.value = 0;
      }

      public int getValue() {
        return value;
      }

      void incrementValue(int amount) {
        this.value += amount;
      }

      boolean validateObj(String category, String hue) {
        return ((this.category == category) && (this.hue == hue));
      }

      public String getCategory() {
        return category;
      }

      public String getHue() {
        return hue;
      }

      private int getHueIndexOfCurCat(String hueToFind, String currentCat, int curCatIndex,
          MethodInnerClass[] summaryDataRcd) {
        for (int i = curCatIndex; i < summaryDataRcd.length; i++)
          if (summaryDataRcd[i].getCategory().equals(currentCat)
              && summaryDataRcd[i].getHue().equals(hueToFind))
            return i;
        return -1;
      }

      public int getNextCatIndex(int curCatIndex, boolean huePresent, MethodInnerClass[] summaryDataRcd) {
        if (!huePresent)
          return ++curCatIndex;
        else
          for (int i = curCatIndex + 1; i < summaryDataRcd.length; i++)
            if (!summaryDataRcd[i].getCategory().equals(summaryDataRcd[curCatIndex].getCategory()))
              return i;
        return -1;
      }

      private int getCatIndex(String category, int curCatIndex, boolean huePresent,
          MethodInnerClass[] summaryDataRcd) {
        if (!huePresent) {
          if (summaryDataRcd[curCatIndex].getCategory().equals(category))
            return curCatIndex;
          else
            return ++curCatIndex;
        } else
          for (int i = curCatIndex; i < summaryDataRcd.length; i++)
            if (summaryDataRcd[i].getCategory().equals(category))
              return i;
        return -1;
      }

      public int incrementValueGivenHueCat(int value, String hueToFind, String currentCat, int curCatIndex,
          MethodInnerClass[] summaryDataRcd) {
        int index = getHueIndexOfCurCat(hueToFind, currentCat, curCatIndex, summaryDataRcd);
        summaryDataRcd[index].incrementValue(value);
        return getCatIndex(currentCat, curCatIndex, !hueToFind.isEmpty(), summaryDataRcd);
      }
    }
    Table temp1 = new Table();
    // temp1.addColumn(this.getColumnTitle(categoricalColumnIndex),
    // this.getColumnType(categoricalColumnIndex));
    // temp1.addColumn(this.getColumnTitle(1), this.getColumnType(1));
    temp1.addColumn(this.getColumnTitle(categoricalColumnIndex), Table.STRING);
    temp1.addColumn(this.getColumnTitle(1), Table.INT);
    MethodInnerClass[] summaryDataRecord;
    if (checkHuePresent()) {
      MethodInnerClass tempObjToCallFunc = new MethodInnerClass();
      // temp1.addColumn(this.getColumnTitle(2), this.getColumnType(2));
      temp1.addColumn(this.getColumnTitle(2), Table.STRING);
      String[] cat = this.getUnique(categoricalColumnIndex);
      String[] hue = this.getUnique(2);
      // this.sort(categoricalColumnIndex);
      summaryDataRecord = new MethodInnerClass[cat.length * hue.length];
      int objCounter = 0;
      for (String distinctDat : cat) {
        for (String distinctHue : hue) {
          summaryDataRecord[objCounter++] = new MethodInnerClass(distinctDat, distinctHue);
        }
      }
      int curCatIndex = 0;
      for (TableRow row : this.rows()) {
        curCatIndex = tempObjToCallFunc.incrementValueGivenHueCat(row.getInt(1), row.getString(2),
            row.getString(categoricalColumnIndex), curCatIndex, summaryDataRecord);
      }
    } else {
      this.sort(categoricalColumnIndex);
      String[] cat = this.getUnique(categoricalColumnIndex);
      // this.sort(categoricalColumnIndex);
      summaryDataRecord = new MethodInnerClass[cat.length];
      int objCounter = 0;
      for (String distinctDat : cat) {
        summaryDataRecord[objCounter++] = new MethodInnerClass(distinctDat);
      }
      int currentCatIndex = 0;
      // Code to write summary data
      for (TableRow row : this.rows()) {
        if (summaryDataRecord[currentCatIndex].getCategory().equals(row.getString(categoricalColumnIndex)))
          summaryDataRecord[currentCatIndex].incrementValue(row.getInt(1));
        else {
          currentCatIndex = summaryDataRecord[currentCatIndex].getNextCatIndex(currentCatIndex, false,
              summaryDataRecord);
          summaryDataRecord[currentCatIndex].incrementValue(row.getInt(1));
        }
      }
    }
    for (int i = 0; i < summaryDataRecord.length; i++) {
      TableRow row = temp1.addRow();
      row.setString(0, summaryDataRecord[i].getCategory());

      row.setInt(1, summaryDataRecord[i].getValue());
      if (checkHuePresent())
        row.setString(2, summaryDataRecord[i].getHue());
    }
    this.summaryData = temp1;
    
    // Code to write the summary data into a CSV file
    try {
      PApplet obj = new PApplet();
      System.out.println(obj.sketchPath());
      PrintWriter file = obj.createWriter(sketchDataPath + "/file " + new java.util.Date().hashCode() + ".csv");
      this.summaryData.write(file);
      System.out.println("sdjkfasdkj");
    } catch (Exception exp) {
      System.out.println(exp);
      exp.printStackTrace();
    }
  }
}
