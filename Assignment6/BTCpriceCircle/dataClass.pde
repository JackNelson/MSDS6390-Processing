import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

class Data{
 //variables of Data object (fields from cryptocurrency price data output)
 ArrayList<Date> time_period_start = new ArrayList<Date>();
 ArrayList<Date> time_period_end = new ArrayList<Date>();
 ArrayList<Date> time_open = new ArrayList<Date>();
 ArrayList<Date> time_close = new ArrayList<Date>();
 float[] price_open;
 float[] price_high;
 float[] price_low;
 float[] price_close;
 float[] volume_traded;
 int[] trades_count; 
 
 Data(String path){
   Table df = loadTable(path,"header,csv"); //read in data
   //initialize object variables
   price_open = new float[df.getRowCount()];
   price_high = new float[df.getRowCount()];
   price_low = new float[df.getRowCount()];
   price_close = new float[df.getRowCount()];
   volume_traded = new float[df.getRowCount()];
   trades_count = new int[df.getRowCount()];  
   
   int i = 0; //dummy iterator for arrays
   for (TableRow row : df.rows()) {
     //assign each variable in each row to its appropriate variable array
     price_open[i] = row.getFloat("price_open");
     price_high[i] = row.getFloat("price_high");
     price_low[i] = row.getFloat("price_low");
     price_close[i] = row.getFloat("price_close");
     volume_traded[i] = row.getFloat("volume_traded");
     trades_count[i] = row.getInt("trades_count");    
     i++; //increment dummy iterator for variable arrays
   }
 }
}