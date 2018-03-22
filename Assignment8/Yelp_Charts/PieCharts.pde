class PieCharts{
  CountData data;
  String path;
  float totalUsers;
  float totalEliteUsers;
  float totalComments;
  float totalEliteComments;
  
  PieCharts(){
  }
  
  PieCharts(String path){
    this.path = path;
    
    data = new CountData(path);  
    init();
  }
  
  void init(){
    totalUsers = data.users[data.users.length-1];
    totalEliteUsers = data.eliteUsers[data.eliteUsers.length-1];
    
    totalComments = 0;
    totalEliteComments = 0;
    
    for(int i = 0; i < data.comments.length; i++){
      totalComments += data.comments[i];
      totalEliteComments += data.commentsEliteUsers[i];
    }
  }
  
  void display(){
    fill(0,150,255);
    ellipse(width/4+25, height/2+50, 300, 300);
    ellipse(width*3/4-25, height/2+50, 300, 300);
    fill(0,0,255);
    arc(width/4+25, height/2+50, 300, 300, 0, radians(360*(totalEliteUsers / totalUsers)));
    arc(width*3/4-25, height/2+50, 300, 300, 0, radians(360*(totalEliteComments / totalComments)));
    fill(0,0,255);
    
    fill(120);
    textSize(36);
    text("Yelp Data Summary", width/2-150,100);
    textSize(24);
    text("Yelp Users", width/4-30, 200);
    text("Yelp Comments", width*3/4-110, 200); 
    
    displayLegend();
  }
  
  void displayLegend(){
    textSize(16);
    fill(0,150,255);
    rect(50, height-100, 20, 20);
    fill(120);
    text("All Users", 75, height-90);
    fill(0,0,255);
    rect(50, height-50, 20, 20);
    fill(120);
    text("Elite Users", 75, height-40);   
  }
}