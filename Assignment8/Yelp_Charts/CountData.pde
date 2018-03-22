/* Modeling after MSDS6390 Assignment 6 Submission: dataClass.pde */
class CountData{
  //variables of the countData object 
  String[] year;
  float[] newUsers;
  float[] users;
  float[] eliteUsers;
  float[] comments;
  float[] commentsEliteUsers;
  
  String path;
  
  CountData(){
  }
  
  CountData(String path){
    this.path = path;
    
    init(path);
  }
  
  void init(String path){
    Table df = loadTable(path,"header,csv"); //read in data
    
    year = new String[df.getRowCount()];
    newUsers = new float[df.getRowCount()];
    users = new float[df.getRowCount()];
    eliteUsers = new float[df.getRowCount()];
    comments = new float[df.getRowCount()];
    commentsEliteUsers = new float[df.getRowCount()];
    
    int i = 0;
    float temp = 0;
    for(TableRow row : df.rows()){
      //assign each variable in each row to its appropriate variable array
      year[i] = row.getString("Year");
      newUsers[i] = row.getFloat("New_Users");
      temp += row.getFloat("New_Users");
      users[i] = temp;
      eliteUsers[i] = row.getFloat("Elite_Users");
      comments[i] = row.getFloat("Comments");
      commentsEliteUsers[i] = row.getFloat("Comments_By_Elite");    
      i++; //increment dummy iterator for variable arrays
    }
  }
}