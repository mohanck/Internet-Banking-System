import java.io.IOException;
import java.io.PrintWriter;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.mail.*;
import javax.mail.internet.*;

import java.util.Properties;
 public class MailServlet extends javax.servlet.http.HttpServlet implements javax.servlet.Servlet {
   static final long serialVersionUID = 1L;
   private static final String SMTP_HOST_NAME = "smtp.gmail.com";
   private static final int SMTP_HOST_PORT = 465;
   private static final String SMTP_AUTH_USER = "ibanker814@gmail.com";
   private static final String SMTP_AUTH_PWD  = "ibanker1408";
   PrintWriter out;
   HttpSession ses;
	public MailServlet() {
		super();
	} 
	
	public void destroy() {
	
		super.destroy();
	}   	
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		out=response.getWriter();
		ses=request.getSession();
		response.setBufferSize(32*1024);
		System.out.println("UserName is "+ses.getAttribute("acuname")+" Email is  "+ ses.getAttribute("acemail")+" HolderName is  "+ ses.getAttribute("achname")+" Category is  "+ses.getAttribute("accat")+" UserPwd is  "+ ses.getAttribute("acupass")+" Transpwd is  "+ ses.getAttribute("actpass")+" Profilepwd is  "+ ses.getAttribute("acppass"));
		if(ses.getAttribute("smmail")!=null && ses.getAttribute("smamt")!=null && ses.getAttribute("smdname")!=null){
		System.out.println("Mail ID is "+(String)ses.getAttribute("smmail"));
		System.out.println("Amount is "+(String)ses.getAttribute("smamt"));
		System.out.println("Name is "+(String)ses.getAttribute("smdname"));
		String from="I-BANK TEAM";
		String to=(String)ses.getAttribute("smmail");
		String subject="I-BANK TEAM---Money Transferred";
		String body="Congratulations "+(String)ses.getAttribute("smdname")+".  Rs "+(String)ses.getAttribute("smamt")+" was successfully transferred from your Account";
		try {
			this.test(to,subject,body,from);
			out.println("<script type='text/javascript'>alert('An E-Mail regarding the transaction has been sent to '"+ses.getAttribute("smmail")+".);</script>");
			response.sendRedirect("SMSServlet");
		//	response.sendRedirect("Page1.jsp");
		//	out.println("<script type='text/javascript'>alert('Working');window.location.href=\"http://localhost:8080/I-Bank/Page1.jsp\"</script>");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			out=response.getWriter();
			out.println("<b>Error in sending the mail</b>");
		}}
	
	  /*request.setAttribute("acuname",request.getParameter("acuname"));   //  String body1=
		request.setAttribute("acemail",request.getParameter("email"));
		request.setAttribute("achname",request.getParameter("achname"));
		request.setAttribute("accat",request.getParameter("accat"));
		request.setAttribute("acupass",request.getParameter("upass"));
		request.setAttribute("actpass",request.getParameter("utpass"));
		request.setAttribute("acppass",request.getParameter("ppass"));*/
		
		else if(ses.getAttribute("acuname")!=null && ses.getAttribute("acemail")!=null && ses.getAttribute("achname")!=null &&ses.getAttribute("accat")!=null && ses.getAttribute("acupass")!=null && ses.getAttribute("actpass")!=null && ses.getAttribute("acppass")!=null){
			System.out.println("In creation");
			String from="I-BANK TEAM";
			String to=(String)ses.getAttribute("acemail");
			String subject="I-BANK TEAM---INTERNET BANKING ACCOUNT";
			String body="Congratulations "+ses.getAttribute("achname")+". Your I-Bank Internet Banking Account has been created successfully.<br>Wishing you Happy Banking!!.Here are some of the Details of your Account:"+
			"<br> User Name : "+ses.getAttribute("acuname")+
			"<br> Category : "+ses.getAttribute("accat")+
			"<br> User Password : "+ses.getAttribute("acupass")+
			"<br> Transaction Password : "+ses.getAttribute("actpass")+
			"<br> Profile Password : "+ses.getAttribute("acppass")+
			"<br> You can modify these attributes by going to the Edit Profile Page.You can Login to your Account now by clicking on the Link given below"+
			"<br> <a href='http://localhost:8080/I-Bank'> Login </a>";
			
			try {
				this.test(to,subject,body,from);
				//this.test(to,subject,body1,from);
				response.sendRedirect("2.jsp");
			//	out.println("<script type='text/javascript'>alert('Working');window.location.href=\"http://localhost:8080/I-Bank/Page1.jsp\"</script>");
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				out=response.getWriter();
				out.println("<b>Error in sending the mail</b>");
			}
			
		}

   
	}  	
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}   	  	  
	public void init() throws ServletException {
		
		super.init();
	}   
	 public void test(String to,String Subject,String body,String from) throws Exception{
	        Properties props = new Properties();

	        props.put("mail.transport.protocol", "smtps");
	        props.put("mail.smtps.host", SMTP_HOST_NAME);
	        props.put("mail.smtps.auth", "true");
	        props.put("mail.smtps.quitwait", "false");

	        Session mailSession = Session.getDefaultInstance(props);
	      //  mailSession.setDebug(true);
	        Transport transport = mailSession.getTransport();
	      
	        MimeMessage message = new MimeMessage(mailSession);
	        message.setSubject(Subject);
	        message.setContent(body, "text/html");
	   	  message.addRecipient(Message.RecipientType.TO,
	        	             new InternetAddress(to));

	        	        transport.connect
	        	          (SMTP_HOST_NAME, SMTP_HOST_PORT, SMTP_AUTH_USER, SMTP_AUTH_PWD);

	        	        transport.sendMessage(message,
	        	            message.getRecipients(Message.RecipientType.TO));
	        	        transport.close();
	        	        System.out.println("sent");	        	     
	        }
	    }
