public class Controller{
	
	//field
	private Pizza p;
	
	//cstrs
	public Controller(){
	}
	
	public Controller(Pizza p){
		this.p = p;
		System.out.println(p.getPrice());
	}
	
	public static void main(String[]args){
		Controller c = new Controller(new Pizza());
	}
}