package BVShop;
//if present 'package' MUST be the first statement (possibly) followed by 'import'
// The following class follows the structure of a 'Java Bean' 

public class VehicleBean {
	/**The properties of the VehicleBean*/
	String VModel;
	String VManufacturer;
	String VYear;

	/** The following non-argument constructor MUST be always present*/
	/** for this class to be a Java Bean*/
	public VehicleBean(){}

	/** Another constructor CAN also be always present*/
	/**  the following initializes all properties whenever a new object is instantiated (with 'new') - */
	public VehicleBean(String model,String manu,String year){
		this.VModel= model; this.VManufacturer = manu; this.VYear= year;
	}

	/** get & set methods for all properties MUST be present*/
	public String getVModel(){return VModel;}
	public void setVModel(String model){this.VModel= model;}   
	public String getVManufacturer(){return VManufacturer;}
	public void setVManufacturer(String manu){this.VManufacturer= manu;}            
	public String getVYear(){return VYear;}
	public void setVYear(String year){this.VYear= year;}           

	//toString is an in-built method for every Java object. Outputs an informative string
	public String toString(){
		return "'" + VModel + "' by " + VManufacturer + " (" + VYear + ")";
	}
}