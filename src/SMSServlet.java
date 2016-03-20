import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class for Servlet: SMSServlet
 *
 */
 public class SMSServlet extends javax.servlet.http.HttpServlet implements javax.servlet.Servlet {
   static final long serialVersionUID = 1L;
   private static String sender="IDEALABS";
   private static String username="renaissance";
   private static String password="idealabs";
   
    /* (non-Java-doc)
	 * @see javax.servlet.http.HttpServlet#HttpServlet()
	 */
	public SMSServlet() {
		super();
	} 
	ResultSet rs,rs1,rs2;
	Statement st,st1,st2;
	Connection con;
	ServletContext ctx;
	HttpSession ses;
	String s;
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
		// TODO Auto-generated method stub
		ses=request.getSession();
		String s=(String)ses.getAttribute("uname");
		try {
			rs=st.executeQuery("select * from SYSTEM.USLIST where uname='"+s+"'");
			while(rs.next())
			{
				String a=rs.getString(4);
				String b=rs.getString(8);
				String c=(String)ses.getAttribute("smamt");
				send(b," Congratulations "+a+" . Rs "+c+" was transferred from your Account");
				response.sendRedirect("Page1.jsp");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	    
	}  	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}   	  	  
	
	/* (non-Javadoc)
	 * @see javax.servlet.GenericServlet#init()
	 */
	public void init() throws ServletException {
		// TODO Auto-generated method stub
		super.init();
		System.out.println("in init of SMS");
		ctx=getServletContext();
		con=(Connection)ctx.getAttribute("Connection");
		try {
			st = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
			        ResultSet.CONCUR_UPDATABLE);
		st1=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
		        ResultSet.CONCUR_UPDATABLE);
		st2=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
		        ResultSet.CONCUR_UPDATABLE);
		 }  catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
		 }}
	 
	public static String send(String mobileNumber,String message) {
        InputStreamReader isr=null;
        BufferedReader reader=null;
        String response=null;
        try {
            String urlString="http://smscgateway.com/messageapi.asp?username="+username+"&password="+password+"&sender="+sender+"&mobile="+mobileNumber+"&message=";
           
            String encodedMessage = URLEncoder.encode(message,"UTF-8");
            System.out.println(encodedMessage);
            URL url = new URL(urlString+encodedMessage);
            System.out.println(url);
            URLConnection urlConnection = url.openConnection();
           
            isr = new InputStreamReader(urlConnection
                    .getInputStream());
            reader=new BufferedReader(isr);
            response=reader.readLine();
            System.out.println(response);
           
           
        } catch (MalformedURLException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                if(reader!=null){
                    reader.close();
                }
                if(isr!=null){
                    isr.close();
                }

            } catch (IOException e) {
                e.printStackTrace();
            }
           
        }
        return response;
    }
	/* (non-Java-doc)
	 * @see javax.servlet.http.HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
  
}