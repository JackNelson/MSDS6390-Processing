public class Pizza{
		
	//fields
	private String[] toppings;
	private float diameter;
	private float price;
	
	//cstrs
	public Pizza(){	
		System.out.println("What's up everybody!");
	}
	
	public Pizza(String[] toppings, float diameter, float price){
		System.out.println("in overloaded cstr");
	}
	
	//methods
	public void assemble(){
	}
	
	//getters and setters
	public void setPrice(float price){
		if (price > 0 && price < 50){
			this.price = price;
		}
	}
	
	public float getPrice(){
		return price;
	}
	
	public static void main(String[]args){
		Pizza p = new Pizza();
	}
}