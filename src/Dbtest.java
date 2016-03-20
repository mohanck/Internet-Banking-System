

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class for Servlet: Dbtest
 *
 */
 public class Dbtest extends javax.servlet.http.HttpServlet implements javax.servlet.Servlet {
   static final long serialVersionUID = 1L;
   
    /* (non-Java-doc)
	 * @see javax.servlet.http.HttpServlet#HttpServlet()
	 */
   Connection con;
   Statement st,st1,st2;
   
	public Dbtest() {
		super();
	} 
	
	/* (non-Javadoc)
	 * @see javax.servlet.Servlet#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
		super.destroy();
	}   	
	
	/* (non-Java-doc)
	 * @see javax.servlet.http.HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		// TODO Auto-generated method stub
		System.out.println("In doGet of dbtest");
		out.println("In doGet of dbtest");
		try {
			Runtime rt = Runtime.getRuntime();
            rt.exec("C://Program Files/IBM/SQLLIB/BIN/db2ce.bat");
		//	 BufferedWriter bw = new BufferedWriter(new FileWriter("C:/Program Files/IBM/SQLLIB/BIN/db2ce.bat"));
		//	 bw.write("db2 backup database IBANK to D:/backup");
			//st1.execute("db2 backup database IBANK to D:/backup");//, /dev3/backup, /dev3/backup 
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	//	Runtime rt = Runtime.getRuntime();
	   // rt.exec("/C:/Program Files/MySQL/MySQL Server 5.0/bin/mysqldump -u [username] -p[password]  [ databaseName] -r  /D:/databasebackup/backup.sql");

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
		super.init();
		System.out.println("In init of dbtest");
		ServletContext ctx=getServletContext();
	
		 con = (Connection)ctx.getAttribute("Connection");
		try{
		st = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
		        ResultSet.CONCUR_UPDATABLE);
		st1=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
		        ResultSet.CONCUR_UPDATABLE);
		st2=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
		        ResultSet.CONCUR_UPDATABLE);
		}
	catch(Exception e){
		e.printStackTrace();
	}


	}   
}