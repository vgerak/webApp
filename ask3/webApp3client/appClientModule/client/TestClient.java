package client;

import javax.xml.namespace.QName;
import org.apache.axis.client.Call;
import org.apache.axis.client.Service;

public class TestClient {

public static void main(String [] args)
{
    try{
       String endpoint = "http://localhost:8080/webApp3/services/HelloHandler";

       Service service = new Service();
       Call call = (Call) service.createCall();
       call.setTargetEndpointAddress( new java.net.URL(endpoint) );
       call.setOperationName( new QName("server", "sayHello") );

       String ret = (String) call.invoke( new Object[] {"Billy"} );
       System.out.println(ret);
       }
       catch(Exception e){
           System.err.println(e.toString());
       }
}
}
