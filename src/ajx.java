import java.io.*;
import java.sql.*;
import java.util.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

    
/**
 * Servlet implementation class for Servlet: ajx
 *
 */ 
 public class ajx extends javax.servlet.http.HttpServlet implements javax.servlet.Servlet {
   static final long serialVersionUID = 1L;
   
    /* (non-Java-doc)
	 * @see javax.servlet.http.HttpServlet#HttpServlet()
	 */
	Connection con;
	Statement st,st1,st2,st3,st4,st5,st6;
	ResultSet rs,rs1,rs2,rs3,rs4,rs5,rs6,rs7,rs8;
	HttpSession ses;
	ServletContext ctx;
	static int b=0;
    int k=0;  
	String dt,from,to,curbal;
	public ajx() {
		super();
	} 
	
	/* (non-Javadoc)
	 * @see javax.servlet.Servlet#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
		super.destroy();
		System.out.println("In destroy");

	}   	
	
	/* (non-Java-doc)
	 * @see javax.servlet.http.HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ses=request.getSession();
		//1
		PrintWriter out = new PrintWriter(new OutputStreamWriter(response.getOutputStream(), "UTF8"), true);
		 Locale locale = new Locale(ses.getAttribute("lang").toString());
		 ResourceBundle bundle = ResourceBundle.getBundle("resource",locale);
		System.out.println("In doGet ajx");
		
		if(request.getParameter("q")!=null){
			System.out.println(request.getParameter("q"));	
		try {
			rs=st.executeQuery("select * from SYSTEM.USACC where uname='"+ses.getAttribute("uname")+"' and acno='"+request.getParameter("q")+"'");
			if(rs.next()){
			out.println("<div style='background-color:#FFFFFF ;width:100%;align:center;'><fieldset><legend><font style='font-family:Jokerman;'>Account Details</font></legend>");
			out.println("<table style='align:center' width='50%'cellspacing='20'><tr><td align='left' colspan='2.5'><b>"+bundle.getString("A/CNO")+"</b></td align='left'><td colspan='2' align='left'>"+rs.getString(3)+"</td></tr><tr><td align='left' colspan='2.5'><b>"+bundle.getString("A/CTYPE")+"</b></td><td colspan='2' align='left'>"+rs.getString(4)+"</td></tr><tr><td align='left' colspan='2.5'><b>"+bundle.getString("Description")+"</b></td><td colspan='2' align='left'>"+rs.getString(8)+"</td></tr><tr><td align='left' colspan='2.5'><b>"+bundle.getString("name")+"</b></td><td colspan='2'align='left'>"+rs.getString(7)+"</td></tr><tr><td align='left' colspan='2.5'><b>"+bundle.getString("Branch")+"</b></td><td colspan='2' align='left'>"+rs.getString(6)+"</td></tr><tr><td align='left' colspan='2.5'><b>"+bundle.getString("availbal")+"</b></td><td colspan='2'align='left'>"+rs.getString(5)+"</td></tr><tr><td align='left' colspan='2.5'><b>"+bundle.getString("unbal")+"</b></td><td colspan='2'align='left'>"+rs.getString(9)+"</td></tr><tr><td align='left' colspan='2.5'><b>"+bundle.getString("cur")+"</b></td><td colspan='2'align='left'>"+bundle.getString("INR")+"</td></tr></table>");
			out.println("</fieldset></div>");
			out.println("<hr align='left' style='position:absolute;left:16%;bottom:20px;'/>");
			out.println("<span style='position:absolute; left:36%;'>View I-Bank in </span>");
			out.println("<span style='position:absolute;left:46.5%;'><a href='http://localhost:8080/I-Bank/ajx?lang=en'>English</a></span>");
			out.println("<span style='position:absolute;left:52.5%;'><a href='http://localhost:8080/I-Bank/ajx?lang=hi'>Hindi</a></span>"); 

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		}
		if (request.getParameter("lang")!=null) {
			/*RequestDispatcher rd=request.getRequestDispatcher("Page1.jsp");
			rd.forward(request, response);*/
			ses.removeAttribute("lang");
			ses.setAttribute("lang",request.getParameter("lang"));
			System.out.println(ses.getAttribute("lang"));
			try {
				st.executeUpdate("update system.theme set lang='"+request.getParameter("lang")+"' where uname='"+ses.getAttribute("uname")+"'");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			out.println("<script type='text/javascript'>window.location.href='http://localhost:8080/I-Bank/Page1.jsp';</script>");
			
		}
		if(request.getParameter("tpass")!=null && request.getParameter("accno")!=null && request.getParameter("branch")!=null && request.getParameter("selected")!=null){
			System.out.println(request.getParameter("tpass")+" "+request.getParameter("accno")+" "+request.getParameter("branch")+" "+request.getParameter("selected"));
			try{
			rs=st.executeQuery("select * from SYSTEM.USACC where uname='"+ses.getAttribute("uname")+"'"); 	
			System.out.println("Transaction password is " +request.getParameter("tpass"));	
			System.out.println("Account number is " +request.getParameter("accno"));	
			System.out.println("Account branch is " +request.getParameter("branch"));	
			System.out.println("Selected Account number is " +request.getParameter("selected"));	
			
				if(request.getParameter("tpass")!=null){
				rs1=st.executeQuery("select * from SYSTEM.USACC where uname='"+ses.getAttribute("uname")+"' and tpass='"+request.getParameter("tpass")+"'");
				if(rs1.next()){
				rs2=st.executeQuery("select * from SYSTEM.USACC where acno='"+request.getParameter("accno")+"' and branch='"+request.getParameter("branch")+"'");
				if(rs2.next())
				{
				    ses.setAttribute("sender",request.getParameter("accno"));	
				    ses.setAttribute("selacc",request.getParameter("selected"));
				    out.println("valid");
				 }
				else{
					out.println("invalid accno");}
				}
				else
					{out.println("invalid tpass");}
				}
			}
			catch(Exception e){
				e.printStackTrace();
			}
		}
		if(request.getParameter("from")!=null && request.getParameter("to")!=null){
			System.out.println("str1 is "+request.getParameter("from"));
			System.out.println("str2 is "+request.getParameter("to"));
			System.out.println("string is "+request.getParameter("accnum"));
		/*String str1,str2;
		str1=;
		str2=request.getParameter("to");*/
			
//			response.setContentType ("text/html;charset=utf-8");
//			response.setCharacterEncoding ("UTF-8"); 
//			response.setLocale(locale);
//			response.setHeader("Content-Language",locale.getLanguage());
			System.out.println(response.getLocale());
			System.out.println(response.getContentType()+"  "+response.getCharacterEncoding());
			//response.setHeader("Cache-Control", "no-cache");
		 java.sql.Date str1=java.sql.Date.valueOf(request.getParameter("from"));
		 java.sql.Date str2=java.sql.Date.valueOf(request.getParameter("to"));		 
		try {
			rs8=st5.executeQuery("select name from SYSTEM.USACC where acno='"+request.getParameter("accnum")+"'");
			if(rs8.next()){
				ses.setAttribute("name",rs8.getString("Name"));
			//	ses.setAttribute("bal",rs8.getDouble(5));
				//ses.setAttribute("actype",rs8.getString("DESCRIPTION"));
				//ses.setAttribute("br",rs8.getString("BRANCH"));
			}
		}
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			rs7=st5.executeQuery("select * from SYSTEM.trans where (curdate between '"+str1+"' and '"+str2+"' and from='"+request.getParameter("accnum")+"') OR (curdate between '"+str1+"' and '"+str2+"' and to='"+request.getParameter("accnum")+"')");
			if(rs7.next()){
				int i=0;
			    out.println("<div style='width:100%;align:center;'><font size='4'>"+bundle.getString("Stmts")+" "+bundle.getString("FROM")+" "+request.getParameter("from")+" "+bundle.getString("TO")+" "+request.getParameter("to")+" "+bundle.getString("are")+"</font><br>");
			    out.println("<br>"+bundle.getString("A/C")+" "+bundle.getString("Holder")+" :" +ses.getAttribute("name")+"<br>");
			    out.println("<br>"+bundle.getString("A/CNO")+" :" +request.getParameter("accnum")+"<br>");
			   // out.println("<br>A/C Type :" +/.getAttribute("actype")+"<br>");
			   // out.println("<br>Branch :" +.getAttribute("br")+"<br>");
				out.println("<br><br><table align='center' border='1px' id='customers' style='margin-bottom:10px;border:1px;border-collapse=collapse'>");
				out.println("<tr><th width='10%'>"+bundle.getString("Date")+"</th><th width='13%'>"+bundle.getString("FROM")+"</th><th width='13%'>"+bundle.getString("TO")+"</th><th width='25%'>"+bundle.getString("NARRATION")+"</th><th width='10%'>"+bundle.getString("DEBIT")+"("+bundle.getString("INR")+")</th><th width='10%'>"+bundle.getString("CREDIT")+"("+bundle.getString("INR")+")</th><th width='15%'>"+bundle.getString("BAL")+"("+bundle.getString("INR")+")</th></tr>");
				
			do{
				if(rs7.getInt("FLAG")==0 && rs7.getString("FROM").equals(request.getParameter("accnum"))){
					if(i%2==0){
					out.println("<tr><td align='center'>"+rs7.getString(1)+"</td><td align='center'>"+rs7.getString(2)+"</td><td align='center'>"+rs7.getString(3)+"</td><td align='center'>"+rs7.getString(10)+"</td><td align='center'>"+rs7.getString(6)+"</td><td align='center'></td><td align='center'>"+rs7.getDouble(7)+"</td></tr>");
					i++;
					//if(rs7.next()){rs7.next();}
					}
				}else{
					if(rs7.getInt("FLAG")==1 && rs7.getString("TO").equals(request.getParameter("accnum")))
					out.println("<tr class='alt'><td align='center'>"+rs7.getString(1)+"</td><td align='center'>"+rs7.getString(2)+"</td><td align='center'>"+rs7.getString(3)+"</td><td align='center'>"+rs7.getString(10)+"</td><td align='center'></td><td align='center'>"+rs7.getString(6)+"</td><td align='center'>"+rs7.getDouble(7)+"</td></tr>");
				 i++;}
			      //if(rs7.getInt("FLAG")==1)
			}while(rs7.next());
			out.println("</table><br><br><a href='JavaScript:window.print();'> <img src='images1/printer_icon.gif' style='border:0 px;'> "+bundle.getString("Printstmts")+"</a>");}
			else
				out.println("<br><span style='align:center;font-weight:normal;font-family:Lucida Grande,Lucida Sans Unicode,Comic Sans MS; font-size:15px; color:red !important; line-height:16px; text-transform:none; text-shadow:none;'>"+bundle.getString("nostmtsavail")+"</span><br><br>");
			
			}			
		 catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		}
	
	}  	
	
	/* (non-Java-doc)
	 * @see javax.servlet.http.HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

         ses=request.getSession();
         PrintWriter out = new PrintWriter(new OutputStreamWriter(response.getOutputStream(), "UTF8"), true);
         Locale locale = new Locale(ses.getAttribute("lang").toString());
		 ResourceBundle bundle = ResourceBundle.getBundle("resource",locale);
		if(request.getParameter("q")!=null){
			System.out.println(request.getParameter("q"));	
		try {
			rs=st.executeQuery("select * from SYSTEM.USACC where uname='"+ses.getAttribute("uname")+"' and acno='"+request.getParameter("q")+"'");
			if(rs.next()){
			out.println("<div style='background-color:#FFFFFF ;width:100%;align:center;'><fieldset><legend><font style='font-family:Jokerman;'>Account Details</font></legend>");
			out.println("<table style='align:center' width='50%'cellspacing='20'><tr><td align='left' colspan='2.5'><b>"+bundle.getString("A/CNO")+"</b></td align='left'><td colspan='2' align='left'>"+rs.getString(3)+"</td></tr><tr><td align='left' colspan='2.5'><b>"+bundle.getString("A/CTYPE")+"</b></td><td colspan='2' align='left'>"+rs.getString(4)+"</td></tr><tr><td align='left' colspan='2.5'><b>"+bundle.getString("Description")+"</b></td><td colspan='2' align='left'>"+rs.getString(8)+"</td></tr><tr><td align='left' colspan='2.5'><b>"+bundle.getString("name")+"</b></td><td colspan='2'align='left'>"+rs.getString(7)+"</td></tr><tr><td align='left' colspan='2.5'><b>"+bundle.getString("Branch")+"</b></td><td colspan='2' align='left'>"+rs.getString(6)+"</td></tr><tr><td align='left' colspan='2.5'><b>"+bundle.getString("availbal")+"</b></td><td colspan='2'align='left'>"+rs.getString(5)+"</td></tr><tr><td align='left' colspan='2.5'><b>"+bundle.getString("unbal")+"</b></td><td colspan='2'align='left'>"+rs.getString(9)+"</td></tr><tr><td align='left' colspan='2.5'><b>"+bundle.getString("cur")+"Currency</b></td><td colspan='2'align='left'>"+bundle.getString("INR")+"</td></tr></table>");
			out.println("</fieldset></div>"); 
			out.println("<hr align='left' style='position:absolute;left:16%;bottom:20px;'/>");
			out.println("<span style='position:absolute; left:36%;'>View I-Bank in </span>");
			out.println("<span style='position:absolute;left:46.5%;'><a href='http://localhost:8080/I-Bank/ajx?lang=en'>English</a></span>");
			out.println("<span style='position:absolute;left:52.5%;'><a href='http://localhost:8080/I-Bank/ajx?lang=hi'>Hindi</a></span>"); 
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		}
		if(request.getParameter("tpass")!=null){
		System.out.println("Transaction password is " +request.getParameter("tpass"));	
		System.out.println("Account number is " +request.getParameter("accno"));	
		System.out.println("Account branch is " +request.getParameter("branch"));	
		System.out.println("Selected Account number is " +request.getParameter("selected"));				
		}
		
		if(request.getParameter("query")!=null){
			System.out.println("Query is "+request.getParameter("query"));
			System.out.println("Attrib is "+ses.getAttribute("uname"));
			try {
				rs3=st1.executeQuery("select * from SYSTEM.USACC where uname='"+ses.getAttribute("uname")+"'");
				if(rs3!=null){					
					int i=0;
				out.println("<span style='position:absolute; left:150px;font-weight:normal;font-family:Lucida Grande,Lucida Sans Unicode,Comic Sans MS; font-size:15px; color:#000000 !important; line-height:16px; text-transform:none; text-shadow:none;'>"+bundle.getString("Acctotf")+"</span><br><br>");
				out.println("<table align='center' border='1px' id='customers' style='margin-bottom:10px;border:1px;border-collapse=collapse'>");
				out.println("<tr><th width='1%'></th><th width='19%'>"+bundle.getString("A/CNO")+"</th><th width='19%'>"+bundle.getString("A/CTYPE")+"</th><th width='19%'>"+bundle.getString("Branch")+"</th><th width='19%'>"+bundle.getString("availbal")+"</th></tr>");
				while(rs3.next()){
					if(!(rs3.getString(3).equals(request.getParameter("query")))){
				if(i%2==0){
					
				out.println("<tr><td align='center'><input type='radio' name='sel' id="+(i+1)+" value="+rs3.getString(3)+" ></td><td align='center'>"+rs3.getString(3)+"</td><td align='center'>"+rs3.getString(4)+"</td><td align='center'>"+rs3.getString(6)+"</td><td align='center'>"+rs3.getString(5)+"</td></tr>");
				i++;}
				else{ 
				out.println("<tr class='alt'><td align='center'><input type='radio' name='sel' id="+(i+1)+" value=" +rs3.getString(3)+ "></td><td align='center'>"+rs3.getString(3)+"</td><td align='center'>"+rs3.getString(4)+"</td><td align='center'>"+rs3.getString(6)+"</td><td align='center'>"+rs3.getString(5)+"</td></tr>");
				i++;}
				}
				}}
				out.println("</table>");
				out.println("<br><br><input type='Submit' value='Next'>");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		if(request.getParameter("select")!=null){
			System.out.println("Selected Account is "+request.getParameter("select"));
			String arr="";
			try
			{
				rs4=st2.executeQuery("select * from SYSTEM.ACCLIST");
				if(rs4!=null)
				{					
					while(rs4.next())
					{
						if(rs4.getString(1).equals(ses.getAttribute("uname")))
						{
						arr=rs4.getString(2);
					    }
					}
					System.out.println("arr is"+arr);
				}
				
			}
			 catch (SQLException e)
			 {
				// TODO Auto-generated catch block
				e.printStackTrace();
			 } 
			
			 String div[]=arr.split("\\,");
			 System.out.println("Div is");
			 for(int i=0;i<div.length;i++)
				 System.out.println(div[i]);
			 
				out.println("<br><span style=' position:absolute; left:150px;font-weight:normal;font-family:Lucida Grande,Lucida Sans Unicode,Tahoma,Arial,san-serif; font-size:15px; color:#000000 !important; line-height:16px; text-transform:none; text-shadow:none;'>Accounts List</span>");
				out.println("<table align='center' border='1px' id='customers' style='margin-bottom:10px;border:1px;border-collapse=collapse'><br><br><tr><th width='1%'></th><th width='19%'>"+bundle.getString("A/CNO")+"</th><th width='19%'>"+bundle.getString("A/C")+" "+bundle.getString("Holder")+"</th><th width='19%'>"+bundle.getString("Branch")+"</th></tr>");
			 
			 for(int i=0;i<div.length;i++)
			 {
				 
				 try
				 {
					rs5=st3.executeQuery("select * from SYSTEM.USACC where acno='"+div[i]+"'");
				if(rs5!=null)
					{
					if(rs5.next())
					    {
						if(k%2==0)
						   {
							out.println("<tr><td align='center'><input type='radio' name='tprecv' id="+(i+1)+" value="+rs5.getString(3)+"></td><td align='center'>"+rs5.getString(3)+"</td><td align='center'>"+ rs5.getString(7)+"</td><td align='center'>"+rs5.getString(6)+"</td></tr>");
						    k++;
						    System.out.println("in even:"+div[i]);
						   }
						else
						   {
							out.println("<tr><td align='center'><input type='radio' name='tprecv' id="+(i+1)+" value="+rs5.getString(3)+"></td><td align='center'>"+rs5.getString(3)+"</td><td align='center'>"+ rs5.getString(7)+"</td><td align='center'>"+rs5.getString(6)+"</td></tr>");
						    k++;
						    System.out.println("in odd:"+div[i]);
						   }
					    }
					}
					else
						System.out.println(" dfff in else");
					   
										
				 }			 
				 catch (SQLException e) 
				 {
					// TODO Auto-generated catch block
					e.printStackTrace();
				 }
			 }
			 				 
			//	 System.out.println(div[i]);
			 out.println("</table><br><br>");
			 out.println("<input type='Submit' name='sub' value='Next'>");
			out.println("<br><br><a href='TPFT.jsp'>Add new Account</a>");
					
		}
		
		
		if(request.getParameter("str1")!=null && request.getParameter("str2")!=null){
			System.out.println("Account number is "+request.getParameter("str1"));
			System.out.println("Number of transactions are "+request.getParameter("str2"));
			String str=request.getParameter("str2");
		   int s=Integer.parseInt(str);
			try {
		switch(s){
		case 5:// OR to='"+request.getParameter("str1")+"' //OR(to='"+request.getParameter("str1")+"' AND flag='1') //AND flag='0'
			rs6=st4.executeQuery("select * from SYSTEM.TRANS where ((from='"+request.getParameter("str1")+"' AND flag=0) OR (to='"+request.getParameter("str1")+"' AND flag=1)) order by curdate desc fetch first 5 rows only");
				break;
		case 10:// OR to='"+request.getParameter("str1")+"'  
			rs6=st4.executeQuery("select * from SYSTEM.TRANS where (from='"+request.getParameter("str1")+"' AND flag=0) OR (to='"+request.getParameter("str1")+"' AND flag=1) order by curdate desc fetch first 10 rows only");			
			    break;
		case 15:// OR to='"+request.getParameter("str1")+"' 
			rs6=st4.executeQuery("select * from SYSTEM.TRANS where (from='"+request.getParameter("str1")+"' AND flag=0) OR (to='"+request.getParameter("str1")+"' AND flag=1) order by curdate desc fetch first 15 rows only");			
		    break;
		case 20:// OR to='"+request.getParameter("str1")+"' 
			rs6=st4.executeQuery("select * from SYSTEM.TRANS where (from='"+request.getParameter("str1")+"' AND flag=0) OR (to='"+request.getParameter("str1")+"' AND flag=1) order by curdate desc fetch first 20 rows only");			
		    break;    
		}
		while(rs6.next()){	
			;
		}
			if(rs6.previous()){
				int i=0;
			    out.println("<font size='4'>Transactions are:</font><br>");
				out.println("<br><br><table align='center' border='1px' id='customers' style='margin-bottom:10px;border:1px;border-collapse=collapse'>");
				out.println("<tr><th width='10%'>"+bundle.getString("Date")+"</th><th width='13%'>"+bundle.getString("FROM")+"</th><th width='13%'>TO</th><th width='25%'>"+bundle.getString("NARRATION")+"</th><th width='15%'>"+bundle.getString("DEBIT")+"("+bundle.getString("INR")+")</th><th width='15%'>"+bundle.getString("CREDIT")+"("+bundle.getString("INR")+")</th></tr>");
			/*	if(i%2==0){
					out.println("<tr><td align='center'>"+rs6.getString(1)+"</td><td align='center'>----</td><td align='center'>----</td><td align='center'>To Opening Balance</td><td align='center'>"+rs6.getString(4)+"</td></tr>");
					i++;}*/
			do{
					if(i%2==0){
					if(rs6.getInt("FLAG")==0)
					    out.println("<tr><td align='center'>"+rs6.getString(1)+"</td><td align='center'>"+rs6.getString(2)+"</td><td align='center'>"+rs6.getString(3)+"</td><td align='center'>"+rs6.getString(10)+"</td><td align='center'>"+rs6.getString(6)+"</td><td align='center'></td></tr>");
					    
					    if(rs6.getInt("FLAG")==1)
						out.println("<tr><td align='center'>"+rs6.getString(1)+"</td><td align='center'>"+rs6.getString(2)+"</td><td align='center'>"+rs6.getString(3)+"</td><td align='center'>"+rs6.getString(10)+"</td><td align='center'></td><td align='center'>"+rs6.getString(6)+"</td></tr>");
					    i++;
					from=rs6.getString(2);
					to=rs6.getString(3);
					dt=rs6.getString(1);
					curbal=rs6.getString(6);}
					else{ 
						if(rs6.getInt("FLAG")==0)
							out.println("<tr class='alt'><td align='center'>"+rs6.getString(1)+"</td><td align='center'>"+rs6.getString(2)+"</td><td align='center'>"+rs6.getString(3)+"</td><td align='center'>"+rs6.getString(10)+"</td><td align='center'>"+rs6.getString(6)+"</td><td align='center'></td></tr>");
						    
						if(rs6.getInt("FLAG")==1)
							out.println("<tr class='alt'><td align='center'>"+rs6.getString(1)+"</td><td align='center'>"+rs6.getString(2)+"</td><td align='center'>"+rs6.getString(3)+"</td><td align='center'>"+rs6.getString(10)+"</td><td align='center'></td><td align='center'>"+rs6.getString(6)+"</td></tr>");
					        i++;
					from=rs6.getString(2);
					to=rs6.getString(3);
					dt=rs6.getString(1);
					curbal=rs6.getString(6);}
			
			}while(rs6.previous());}
			/*if(i%2==0){
				out.println("<tr><td align='center'>"+dt+"</td><td align='center'>----</td><td align='center'>----</td><td align='center'>By Closing Balance</td><td align='center'>"+curbal+"</td></tr>");
				i++;}
				else{ 
				out.println("<tr class='alt'><td align='center'>"+dt+"</td><td align='center'>----</td><td align='center'>----</td><td align='center'>By Closing Balance</td><td align='center'>"+curbal+"</td></tr>");
				i++;}
			}*/
			else
				out.println("<br><span style='align:center;font-weight:normal;font-family:Lucida Grande,Lucida Sans Unicode,Comic Sans MS; font-size:15px; color:red !important; line-height:16px; text-transform:none; text-shadow:none;'>Sorry!! No transactions available</span><br><br>");
			}
			 catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
			
			}
		
		
		if(request.getParameter("from")!=null && request.getParameter("to")!=null){
			System.out.println("str1 is "+request.getParameter("from"));
			System.out.println("str2 is "+request.getParameter("to"));
			System.out.println("string is "+request.getParameter("accnum"));
		/*String str1,str2;
		str1=;
		str2=request.getParameter("to");*/
			response.setContentType ("text/html; charset=UTF-8");
			java.sql.Date str1=java.sql.Date.valueOf(request.getParameter("from"));
		 java.sql.Date str2=java.sql.Date.valueOf(request.getParameter("to"));		 
		try {
			rs8=st5.executeQuery("select name from SYSTEM.USACC where acno='"+request.getParameter("accnum")+"'");
			if(rs8.next()){
				ses.setAttribute("name",rs8.getString("Name"));
			//	ses.setAttribute("bal",rs8.getDouble(5));
				//ses.setAttribute("actype",rs8.getString("DESCRIPTION"));
				//ses.setAttribute("br",rs8.getString("BRANCH"));
			}
		}
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			rs7=st5.executeQuery("select * from SYSTEM.trans where (curdate between '"+str1+"' and '"+str2+"' and from='"+request.getParameter("accnum")+"') OR (curdate between '"+str1+"' and '"+str2+"' and to='"+request.getParameter("accnum")+"')");
			if(rs7.next()){
				int i=0;
			    out.println("<div style='width:100%;align:center;'><font size='4'>"+bundle.getString("Stmts")+" "+bundle.getString("FROM")+" "+request.getParameter("from")+" "+bundle.getString("TO")+" "+request.getParameter("to")+" "+bundle.getString("are")+"</font><br>");
			    out.println("<br>"+bundle.getString("A/C")+" "+bundle.getString("Holder")+" :" +ses.getAttribute("name")+"<br>");
			    out.println("<br>"+bundle.getString("A/CNO")+" :" +request.getParameter("accnum")+"<br>");
			   // out.println("<br>A/C Type :" +/.getAttribute("actype")+"<br>");
			   // out.println("<br>Branch :" +.getAttribute("br")+"<br>");
				out.println("<br><br><table align='center' border='1px' id='customers' style='margin-bottom:10px;border:1px;border-collapse=collapse'>");
				out.println("<tr><th width='10%'>"+bundle.getString("Date")+"</th><th width='13%'>"+bundle.getString("FROM")+"</th><th width='13%'>"+bundle.getString("TO")+"</th><th width='25%'>"+bundle.getString("NARRATION")+"</th><th width='10%'>"+bundle.getString("DEBIT")+"("+bundle.getString("INR")+")</th><th width='10%'>"+bundle.getString("CREDIT")+"("+bundle.getString("INR")+")</th><th width='15%'>"+bundle.getString("BAL")+"("+bundle.getString("INR")+")</th></tr>");
				
			do{
				if(rs7.getInt("FLAG")==0 && rs7.getString("FROM").equals(request.getParameter("accnum"))){
					if(i%2==0){
					out.println("<tr><td align='center'>"+rs7.getString(1)+"</td><td align='center'>"+rs7.getString(2)+"</td><td align='center'>"+rs7.getString(3)+"</td><td align='center'>"+rs7.getString(10)+"</td><td align='center'>"+rs7.getString(6)+"</td><td align='center'></td><td align='center'>"+rs7.getDouble(7)+"</td></tr>");
					i++;
					//if(rs7.next()){rs7.next();}
					}
				}else{
					if(rs7.getInt("FLAG")==1 && rs7.getString("TO").equals(request.getParameter("accnum")))
					out.println("<tr class='alt'><td align='center'>"+rs7.getString(1)+"</td><td align='center'>"+rs7.getString(2)+"</td><td align='center'>"+rs7.getString(3)+"</td><td align='center'>"+rs7.getString(10)+"</td><td align='center'></td><td align='center'>"+rs7.getString(6)+"</td><td align='center'>"+rs7.getDouble(7)+"</td></tr>");
				 i++;}
			      //if(rs7.getInt("FLAG")==1)
			}while(rs7.next());
			out.println("</table><br><br><a href='JavaScript:window.print();'> <img src='images1/printer_icon.gif' style='border:0 px;'> "+bundle.getString("Printstmts")+"</a>");}
			else
				out.println("<br><span style='align:center;font-weight:normal;font-family:Lucida Grande,Lucida Sans Unicode,Comic Sans MS; font-size:15px; color:red !important; line-height:16px; text-transform:none; text-shadow:none;'>"+bundle.getString("nostmtavail")+"</span><br><br>");
			
			}			
		 catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		}
		
		if(request.getParameter("theme")!=null){
			if(request.getParameter("theme").equals("0"))
			{
				out.println("<script type='text/javascript'>alert('Please Select a valid theme');</script>");
				return;
			}
			
			System.out.println("in ajax page for themes");
			ses.setAttribute("theme",request.getParameter("theme"));
			System.out.println("requested theme is "+request.getParameter("theme"));
			System.out.println("session's req theme is "+ses.getAttribute("theme"));
			try {
				st6.execute("update SYSTEM.THEME set themeval='"+ses.getAttribute("theme")+"' where uname='"+ses.getAttribute("uname")+"'");
				out.println("<script type='text/javascript'>alert('Theme Changed Successfully');</script>");  
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	
		
		}

	  	  	  
	
	/* (non-Javadoc)
	 * @see javax.servlet.GenericServlet#init()
	 */
	public void init() throws ServletException {
		// TODO Auto-generated method stub
		super.init();
		System.out.println("In init of ajax");
		ServletContext ctx=getServletContext();
	
		 con = (Connection)ctx.getAttribute("Connection");
		try{
		st = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
		        ResultSet.CONCUR_UPDATABLE);
		st1=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
		        ResultSet.CONCUR_UPDATABLE);
		st2=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
		        ResultSet.CONCUR_UPDATABLE);
		st3=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
		        ResultSet.CONCUR_UPDATABLE);
		st4=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
		        ResultSet.CONCUR_UPDATABLE);
		st5=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
		        ResultSet.CONCUR_UPDATABLE);
		st6=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
		        ResultSet.CONCUR_UPDATABLE);
		}
	catch(Exception e){
		e.printStackTrace();
	}

	} 
	}   
