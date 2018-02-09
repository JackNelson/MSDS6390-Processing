Table table;

void setup() {
  
  table = loadTable("forSale.csv", "header");

  println(table.getRowCount() + " total rows in table"); 

  for (TableRow row : table.rows()) {
    
    int id = row.getInt("id");
    String product = row.getString("product");
    float price = float(row.getString("price"));
    
    println(product + " (" + price + ") has an ID of " + id);
  }
  
}