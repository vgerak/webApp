package BVShop;
import java.net.URL;
import java.util.Enumeration;
import java.util.Hashtable;
import java.util.Vector;
import org.apache.soap.Constants;
import org.apache.soap.Fault;
import org.apache.soap.SOAPException;
import org.apache.soap.encoding.SOAPMappingRegistry;
import org.apache.soap.encoding.soapenc.BeanSerializer;
import org.apache.soap.encoding.soapenc.StringDeserializer;
import org.apache.soap.rpc.Call;
import org.apache.soap.rpc.Parameter;
import org.apache.soap.rpc.Response;
import org.apache.soap.util.xml.QName;

public class BVAdderLister {

	public void addlist(URL url, String model, String manufacturer, String year, String modelDel) 
			throws SOAPException{

		// Build the object with the data given by user
		VehicleBean vObj = new VehicleBean(model, manufacturer, year);

		//VehicleBean must now be mapped ... so SOAP can use it
		SOAPMappingRegistry reg = new SOAPMappingRegistry();
		BeanSerializer serializer = new BeanSerializer();
		reg.mapTypes(Constants.NS_URI_SOAP_ENC,
				new QName("urn:VBean_xmlns","vObj"),
				VehicleBean.class, serializer, serializer);

		//Build the Call object
		Call call = new Call();
		//How to map, where to send, method to call, encoding "style"
		call.setSOAPMappingRegistry(reg);
		call.setTargetObjectURI("urn:BVehicleCatalog");
		call.setMethodName("addV");
		call.setEncodingStyleURI(Constants.NS_URI_SOAP_ENC);  


		//------------  A D D I N G ---------------------------------------------------
		System.out.println("Adding vehicle model '" + model + "' by " + manufacturer + " of year " + year);

		// Set up the parameters of the call
		Vector params = new Vector();

		//in the instructions given to the 'Serializer' - see Depl. Descr.
		params.addElement(new Parameter("vObj", VehicleBean.class, vObj, null));    
		call.setParams(params);

		// Invoke the call
		Response response;
		response = call.invoke(url, "");
		//We do not expect something back, unless there is a fault!!
		if (!response.generatedFault())
		{        System.out.println("Server reported NO FAULT while adding vehicle");}
		else {        Fault fault = response.getFault();
		System.out.println("Server reported FAULT while adding:");
		System.out.println(fault.getFaultString());} 

		
		//------------  D E L E T I N G ---------------------------------------------------
		//We use the same Call Object and change this as appropriate
		/* Another method is now called*/
		call.setMethodName("delV");   
		Vector par = new Vector();
		par.addElement(new String(modelDel));
		call.setParams(par);        
		// Invoke the call;
		response = call.invoke(url, ""); 
		if (!response.generatedFault())
		{        System.out.println("Server reported NO FAULT while removing vehicle");}
		else {        Fault fault = response.getFault();
		System.out.println("Server reported FAULT while removing:");
		System.out.println(fault.getFaultString());} 
		

		//------------  L I S T I N G ---------------------------------------------------
		//We use the same Call Object and change this as appropriate
		/* Another method is now called*/
		call.setMethodName("listV"); 
		/* NO parameters here !!*/
		/*(we cannot have a call with arguments as before)*/              
		call.setParams(null);        
		// Invoke the call; here we expect something back !!
		response = call.invoke(url, ""); 

		/*Extract the value returned in the form of a 'Parameter' Object*/
		Parameter returnValue = response.getReturnValue();
		/*Cast the 'Parameter' Object onto a Hashtabel Object*/
		Hashtable catalog = (Hashtable)returnValue.getValue();
		Enumeration e = catalog.keys();
		while (e.hasMoreElements()) {
			String VModel = (String)e.nextElement();
			VehicleBean vo = (VehicleBean)catalog.get(VModel);
			System.out.println("  '" + vo.getVModel() + "' by " + vo.getVManufacturer() +
					", year " + vo.getVYear());
		}
	}                      



	public static void main(String[] args) {
		if (args.length != 4) {
			for (int i = 0; i < args.length; ++i) {
				System.out.println("arg =" + args[i]);
			}
			System.out.println("Put model, manufacturer, year and model to delete as arguments !!"); 
			return;
		}

		try {
			// URL for SOAP server to connect to
			URL urlink = new URL("http://localhost:8080/webApp3/services/BVCatalog");
			
			// Get values for the new vehicle
			String model = args[0];   
			String manufacturer = args[1];
			String year = args[2];
			String modelDel = args[3];
			//Add the new vehicle - Delete one aswell
			BVAdderLister adderlister = new BVAdderLister();
			adderlister.addlist(urlink, model, manufacturer, year, modelDel);
		}  catch (Exception e) {e.printStackTrace();}
	}
}             