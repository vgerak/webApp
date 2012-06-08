package BVShop;
//if present 'package' MUST be the first statement (possibly) followed by 'import'
// The following class follows the structure of a 'Java Bean' 

public class MotorBean {
	/**The properties of the MotorBean*/
	String MCc;
	String MNo_cylinders;
	String MPs;

	/** The following non-argument constructor MUST be always present*/
	/** for this class to be a Java Bean*/
	public MotorBean(){}

	/** Another constructor CAN also be always present*/
	/**  the following initializes all properties whenever a new object is instantiated (with 'new') - */
	public MotorBean(String mcc,String cyli, String mps){
		this.MCc= mcc; this.MNo_cylinders = cyli; this.MPs= mps;
	}

	/** get & set methods for all properties MUST be present*/
	public String getMCc(){return MCc;}
	public void setMCc(String mcc){this.MCc= mcc;}   
	public String getMNo_cylinders(){return MNo_cylinders;}
	public void setMNo_cylinders(String cyli){this.MNo_cylinders= cyli;}            
	public String getMPs(){return MPs;}
	public void setMPs(String mps){this.MPs= mps;}           

	//toString is an in-built method for every Java object. Outputs an informative string
	public String toString(){
		return  MCc + " cc has " + MNo_cylinders + " and offers " + MPs + " horsepower";
	}
}