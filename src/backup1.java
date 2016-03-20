

import java.io.*;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;
import java.sql.*;
/**
 * Servlet implementation class for Servlet: backup1
 *
 */
 public class backup1 extends javax.servlet.http.HttpServlet implements javax.servlet.Servlet {
   static final long serialVersionUID = 1L;
   
    /* (non-Java-doc)
	 * @see javax.servlet.http.HttpServlet#HttpServlet()
	 */
	public backup1() {
		super();
	}   	
	Connection con = null;
	/* (non-Java-doc)
	 * @see javax.servlet.http.HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	     CallableStatement callStmt1 = null;
	     CallableStatement callStmt2 = null;
	     ResultSet rs1 = null;
	     ResultSet rs2 = null;
	     PreparedStatement stmt1 = null;
	     Statement stmt2 = null;
	   
	     int rows_read;
	     int rows_skipped;
	     int rows_loaded;
	     int rows_rejected;
	     int rows_deleted;
	     int rows_committed;

	     String msg_retrieval = null;
	     String msg_removal = null;
	     String sqlcode = null;
	     String msg = null;
	     
	     try
	       {
	         // Initialize DB2Driver and establish database connection.
	         System.out.println("HOW TO DO IMPORT USING ADMIN_CMD.\n");
	         // prepare the CALL statement for OUT_LANGUAGE
	         String sql = "CALL SYSPROC.ADMIN_CMD(?)";
	         callStmt1 = con.prepareCall(sql);

	         // argv[0] is the path for the file to be imported
	         String param = "IMPORT FROM D://org_ex1.ixf OF IXF MESSAGES ";
	         param = param + "ON SERVER CREATE INTO system.loc" ;

	         // setting the imput parameter
	         callStmt1.setString(1, param);
	         System.out.println("CALL ADMIN_CMD('" + param + "')");
	        
	         // executing import by calling ADMIN_CMD
	         callStmt1.execute();
	         rs1 = callStmt1.getResultSet();
	       
	         // retrieving the resultset  
	         if( rs1.next())
	         { 
	           // retrieve the no of rows read
	           rows_read = rs1.getInt(1);
	           // retrieve the no of rows skipped
	           rows_skipped = rs1.getInt(2);
	           // retrieve the no of rows loaded
	           rows_loaded = rs1.getInt(3);
	           // retrieve the no of rows rejected
	           rows_rejected = rs1.getInt(4);
	           // retrieve the no of rows deleted
	           rows_deleted = rs1.getInt(5);
	           // retrieve the no of rows committed
	           rows_committed = rs1.getInt(6);

	           // retrieve the select stmt for message retrival 
	           // containing SYSPROC.ADMIN_GET_MSGS
	           msg_retrieval = rs1.getString(7);
	   
	           // retrive the stmt for message cleanup
	           // containing CALL of SYSPROC.ADMIN_REMOVE_MSGS
	           msg_removal = rs1.getString(8);
	       
	           // Displaying the resultset
	           System.out.print("\nTotal number of rows read      : ");
	           System.out.println(rows_read);
	           System.out.print("Total number of rows skipped   : ");
	           System.out.println( rows_skipped);
	           System.out.print("Total number of rows loaded    : ");
	           System.out.println(rows_loaded);
	           System.out.print("Total number of rows rejected  : "); 
	           System.out.println(rows_rejected);
	           System.out.print("Total number of rows deleted   : "); 
	           System.out.println(rows_deleted);
	           System.out.print("Total number of rows committed : "); 
	           System.out.println(rows_read);
	           System.out.print("SQL for retrieving the messages: "); 
	           System.out.println(msg_retrieval); 
	           System.out.print("SQL for removing the messages  : "); 
	           System.out.println(msg_removal);
	         } 
	        
	         stmt1 = con.prepareStatement(msg_retrieval);
	         System.out.println("\n" + "Executing " + msg_retrieval);  

	         // message retrivel 
	         rs2 = stmt1.executeQuery();
	 	
	         // retrieving the resultset
	         while(rs2.next())
	         {
	           // retrieving the sqlcode
	 	    sqlcode = rs2.getString(1);
	       
	           //retrieving the error message
	           msg = rs2.getString(2);

	           System.out.println("Sqlcode : " +sqlcode);
	           System.out.println("Msg     : " +msg);
	         }

	         System.out.println("\n Executing " + msg_removal);
	         callStmt2 = con.prepareCall(msg_removal);

	         // executing the message retrivel
	         callStmt2.execute();      
	  
	         System.out.println("\n Executing DROP TABLE ORG_IMPORT");   
	         stmt2 = con.createStatement();
	        // stmt2.executeUpdate("DROP TABLE ORG_IMPORT");
	       }
	       catch(Exception e)
	       {
	         System.out.println("jdbc exception");
	       }
	       finally
	       {
	         try
	         {
	           //closing the statements and resultset    
	           callStmt1.close();
	           callStmt2.close();
	           stmt1.close();
	           stmt2.close();
	           rs1.close();
	           rs2.close();
	      
	           // roll back any changes to the database made by this sample
	           con.rollback();

	           // closing the connection                                   
	           con.close();
	           System.gc();
	         }
	         catch (Exception x)
	         { 
	           x.printStackTrace();
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
			    con = DriverManager.getConnection("jdbc:db2://localhost:50000/IBANK",ctx.getInitParameter("Username"),ctx.getInitParameter("Password"));
        
		 } catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}   
}
