import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class listener implements ServletContextListener {

	Connection con;
	Statement st;
	public void contextDestroyed(ServletContextEvent sce) {
		// TODO Auto-generated method stub
	
		try{
			con.close();
			System.out.println("Connection Closed");
		} catch (Exception e) {   
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 
       
	} 

	public void contextInitialized(ServletContextEvent sce) {
		// TODO Auto-generated method stub 
		ServletContext ctx=sce.getServletContext();
		try{ 
			Class.forName("com.ibm.db2.jcc.DB2Driver");   
			System.out.println("Driver loaded in listener in new listener"); 
		    con = DriverManager.getConnection("jdbc:db2://localhost:50000/IBANK",ctx.getInitParameter("Username"),ctx.getInitParameter("Password"));
			 st = con.createStatement();  	    
		    ctx.setAttribute("Connection",con);              
		
		}  
		catch(Exception e){
			e.printStackTrace();  
		}
		
	} 
}
