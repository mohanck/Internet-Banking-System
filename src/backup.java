import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;     
import java.util.*;
import java.sql.*;

/**
 * Servlet implementation class for Servlet: backup
 *
 */
 public class backup extends javax.servlet.http.HttpServlet implements javax.servlet.Servlet {
   static final long serialVersionUID = 1L;
   
    /* (non-Java-doc)
	 * @see javax.servlet.http.HttpServlet#HttpServlet()
	 */
	public backup() {
		super();
	}   	
	Connection con = null;
	/* (non-Java-doc)
	 * @see javax.servlet.http.HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

	     
	     int rows_exported;
	     String msg_retrieval = null;
	     String msg_removal = null;
	     String sqlcode = null;
	     String msg = null;
	     
	     CallableStatement callStmt1 = null;
	     ResultSet rs1 = null;
	     PreparedStatement stmt1 = null;
	     ResultSet rs2 = null;
	     CallableStatement callStmt2 = null;
	     try
	       {
	         // initialize DB2Driver and establish database connection.
	         Class.forName("com.ibm.db2.jcc.DB2Driver").newInstance();
	         con = DriverManager.getConnection("jdbc:db2:IBANK");

	         System.out.println("HOW TO PERFORM EXPORT USING ADMIN_CMD.\n");
	         // prepare the CALL statement for OUT_LANGUAGE
	         String sql = "CALL SYSPROC.ADMIN_CMD(?)";
	         callStmt1 = con.prepareCall(sql);

	         String param = "export to D://org_ex1.ixf ";
	         param = param + "of ixf messages on server select * from system.usacc" ;

	         // set the imput parameter
	         callStmt1.setString(1, param);
	         System.out.println("CALL ADMIN_CMD('" + param + "')");
	        
	         // execute export by calling ADMIN_CMD
	         callStmt1.execute();
	         rs1 = callStmt1.getResultSet();
	         // retrieve the resultset  
	         if( rs1.next())
	         { 
	           // the numbers of rows exported
	           rows_exported = rs1.getInt(1);

	           // retrieve the select stmt for message retrival 
	           // containing SYSPROC.ADMIN_GET_MSGS
	           msg_retrieval = rs1.getString(2);
	   
	           // retrive the stmt for message cleanup
	           // containing CALL of SYSPROC.ADMIN_REMOVE_MSGS
	           msg_removal = rs1.getString(3);
	       
	           // display the output
	           System.out.println("Total number of rows exported  : " + rows_exported);
	           System.out.println("SQL for retrieving the messages: " + msg_retrieval); 
	           System.out.println("SQL for removing the messages  : " + msg_removal);
	         } 
	       
	         stmt1 = con.prepareStatement(msg_retrieval);
	         System.out.println("\n" + "Executing " + msg_retrieval);  

	         // message retrivel 
	         rs2 = stmt1.executeQuery();
	 	
	         // retrieve the resultset
	         while(rs2.next())
	         {
	           // retrieve the sqlcode
	 	    sqlcode = rs2.getString(1);
	       
	           // retrieve the error message
	           msg = rs2.getString(2);
	           System.out.println("Sqlcode : " +sqlcode);
	           System.out.println("Msg     : " +msg);
	         }

	         System.out.println("\nExecuting " + msg_removal);
	         callStmt2 = con.prepareCall(msg_removal);

	         // executing the message retrivel
	         callStmt2.execute();      
	       }
	       catch(Exception e)
	       {
	        System.out.println("jdbc exception");
	       }
	       finally
	       {
	         try
	         {
	           // close the statements 
	           callStmt1.close();
	           callStmt2.close();
	           stmt1.close();

	           // close the resultsets
	           rs1.close();
	           rs2.close();
	      
	           // roll back any changes to the database made by this sample
	           con.rollback();

	           // close the connection                                   
	           con.close();
	           System.gc();
	         }
	         catch (Exception x)
	         { 
	           System.out.print("\n Unable to Rollback/Disconnect ");
	           System.out.println("from 'sample' database"); 
	         }
	       }
	}  	
	
	/* (non-Java-doc)
	 * @see javax.servlet.http.HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}   	  	  
	
	/* (non-Javadoc)
	 * @see javax.servlet.GenericServlet#init()
	 */
	public void init() throws ServletException {
		// TODO Auto-generated method stub
		ServletContext ctx=getServletContext();
		super.init();
		 try {
				Class.forName("com.ibm.db2.jcc.DB2Driver");		
			    con = DriverManager.getConnection("jdbc:db2://localhost:50000/IBANK",ctx.getInitParameter("Username"),ctx.getInitParameter("Password"));
			 } catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
	}   
}

