XML xml;

void setup() {
  xml = loadXML("books.xml");
  XML[] children = xml.getChildren("book");

  for (int i = 0; i < children.length; i++) {
    String id = children[i].getString("id");
    String author = children[i].getChild("author").getContent();
    String title = children[i].getChild("title").getContent();
    String genre = children[i].getChild("genre").getContent();
    float price = float(children[i].getChild("price").getContent());
    String publish_date = children[i].getChild("publish_date").getContent();
    String description = children[i].getChild("description").getContent();
    println("Book ID: " + id);
    println("Author: " + author);
    println("Title: " + title);
    println("Genre: " + genre);
    println("Price: " + price);
    println("Publish Date: " + publish_date);
    println("Description: " + description + "\n");
  }
}