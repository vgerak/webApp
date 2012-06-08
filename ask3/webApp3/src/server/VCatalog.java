package server;
import java.util.Hashtable;

public class VCatalog {
	//package VShop;
	/*if present this MUST be the first statement,*/ 
	private Hashtable catalog;

	
	public VCatalog() { 
		/** The vehicles, by carModel */ 
		catalog=new Hashtable();
		//Some content 
		catalog.put("Buick","General Motors"); 
		catalog.put("Mustang","Ford"); 
		catalog.put("4CV","Citroen"); 
		catalog.put("Jeep","General Motors"); 
		catalog.put("Beatle","Volkswagen");
	}
	
	public void addV(String carModel, String carMaker) { 
		if ((carModel==null)||(carMaker==null)){
			throw new IllegalArgumentException("carModel and carMaker cannot be null."); 
		}
		catalog.put(carModel,carMaker);
	}
	
	public String getMaker(String carModel) { 
		if (carModel==null) {
			throw new IllegalArgumentException("carModel cannot be null."); 
		}
		//Return the requested vehicle 
		return (String)catalog.get(carModel);
	} 
	
	public Hashtable listV(){
		return catalog;
	}
}
