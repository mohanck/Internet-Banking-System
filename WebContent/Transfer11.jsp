<%@ page language="java" contentType="text/html; charset=UTF-8"
    import="java.sql.*,java.io.*,java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri = "http://java.sun.com/jsp/jstl/fmt"%>
<fmt:setBundle basename="resource"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	  <link rel="SHORTCUT ICON" href="image/icon.ico">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>::Test Transfer11 ::</title>
<script type="text/javascript">

 var isNS = (navigator.appName == "Netscape") ? 1 : 0;
  if(navigator.appName == "Netscape") document.captureEvents(Event.MOUSEDOWN||Event.MOUSEUP);
  function mischandler(){return false;}
  function mousehandler(e){
 	var myevent = (isNS) ? e : event;
 	var eventbutton = (isNS) ? myevent.which : myevent.button;
    if((eventbutton==2)||(eventbutton==3)) return false;
 }
 document.oncontextmenu = mischandler;
 document.onmousedown = mousehandler;
 document.onmouseup = mousehandler;

</script>



</head>
<body BGCOLOR="#EEEEEE">
<%!String s;
String str,str1;
static int k=0;
double senbefore,recbefore,senafter,recafter;
ResultSet rs,rs1,rs2,rs3;
Statement st,st1,st2,st3;
Connection con;
ServletContext ctx;
HttpSession ses;
public void jspInit(){
	 try{
ctx=getServletContext();
con=(Connection)ctx.getAttribute("Connection");
st = con.createStatement();
st1 = con.createStatement();
st2 = con.createStatement();
st3 = con.createStatement();
 } 
catch(Exception e){
		 e.printStackTrace();
}}
%>


<%	  ses=request.getSession();
	  if(ses.getAttribute("uname")==null)
			response.sendRedirect("/I-Bank/login.jsp");
System.out.println("Transaction password is " +request.getParameter("tpass"));	
System.out.println("Amount is " +request.getParameter("amount"));	
rs1=st1.executeQuery("select tpass from SYSTEM.USACC where uname='"+ses.getAttribute("uname")+"'");
if(rs1.next()){
if(request.getParameter("tpass").equals(rs1.getString("tpass"))){
rs=st.executeQuery("select * from SYSTEM.USACC where uname='"+ses.getAttribute("uname")+"' and tpass='"+request.getParameter("tpass")+"' and acno='"+ctx.getAttribute("sen")+"'");
if(rs.next()){	
	System.out.println(rs.getFloat(5));
	if(rs.getString("actype").equals("Personal"))
	{
	System.out.println("Amount while transferring is "+request.getParameter("amount"));
		if(Float.valueOf(request.getParameter("amount"))>5000)
		{
		System.out.println("In today");%>
         <script type="text/javascript">
	     alert("Personal Bankers can transfer Rs.5000 at one go!!\r\nPlease try to transfer amount less then Rs 5000.");
	  // parent.history.go(-1);
	     </script>
			  <jsp:forward page="/FundsTransfer.jsp?q=err" />
			  
		<%System.out.println("After jsp:forward");}
	}
	if((rs.getFloat(5)-Float.valueOf(request.getParameter("amount"))> 10000 && rs.getString("actype").equals("Corporate"))||(rs.getFloat(5)-Float.valueOf(request.getParameter("amount"))> 1000 && rs.getString("actype").equals("Personal")))
	{	
		System.out.println(rs.getFloat(5)-Float.valueOf(request.getParameter("amount")));
		Double balance=Double.valueOf(request.getParameter("amount"));
		Float bal1=rs.getFloat(5)-Float.valueOf(request.getParameter("amount"));
		// lines 15-17 to obtain senbefore
		rs2=st2.executeQuery("SELECT BALANCE from SYSTEM.USACC where acno='"+ctx.getAttribute("sen")+"'");
        if(rs2.next())     	 
        	senbefore=rs2.getFloat("BALANCE");//  System.out.println("balance is "+rs.getFloat(5));	    	
       		// lines 19-21 to obtain recbefore
        rs2=st2.executeQuery("SELECT BALANCE from SYSTEM.USACC where acno='"+ctx.getAttribute("rec")+"'");
        if(rs2.next())     	
        	recbefore=rs2.getDouble("BALANCE");//  System.out.println("balance is "+rs.getFloat(5));
//        	balance+=recbefore;
        	System.out.println("BALANCE is "+balance);
	st.execute("UPDATE SYSTEM.USACC set BALANCE = balance+"+balance+" where acno='"+ctx.getAttribute("rec")+"'");//adding money to receiver
	st.execute("UPDATE SYSTEM.USACC set BALANCE="+bal1+" where acno='"+ctx.getAttribute("sen")+"'");//substracting money from sender
			// lines 26-28 to obtain senafter
	rs2=st2.executeQuery("SELECT BALANCE from SYSTEM.USACC where acno='"+ctx.getAttribute("sen")+"'");
    if(rs2.next())     	//    System.out.println("balance is "+rs2.getDouble("BALANCE"));	   
    senafter=rs2.getFloat("BALANCE");
     		// lines 30-32 to obtain senbefore   
    rs2=st2.executeQuery("SELECT BALANCE from SYSTEM.USACC where acno='"+ctx.getAttribute("rec")+"'");
    if(rs2.next())    	
    	recafter=rs2.getFloat("BALANCE");

    System.out.println("ctx.getAttribute('rec') is "+ctx.getAttribute("rec")+" and ctx.getAttribute('sen') is"+ctx.getAttribute("sen"));
	
	java.util.Date today = new java.util.Date();
  java.sql.Date sqlToday = new java.sql.Date(today.getTime());

    try{
		System.out.println("in try 1");
    	st.executeUpdate("INSERT into SYSTEM.TRANS values('"+sqlToday+"','"+ctx.getAttribute("sen")+"','"+ctx.getAttribute("rec")+"',"+senbefore+","+recbefore+","+Double.valueOf(request.getParameter("amount"))+","+senafter+","+recafter+",0,'Amount Transferred to "+ctx.getAttribute("rec")+"')");
	    st.executeUpdate("INSERT into SYSTEM.TRANS values('"+sqlToday+"','"+ctx.getAttribute("sen")+"','"+ctx.getAttribute("rec")+"',"+recbefore+","+senbefore+","+Double.valueOf(request.getParameter("amount"))+","+recafter+","+senafter+",1,'Amount Received from "+ctx.getAttribute("sen")+"')");
		System.out.println("in try 2");
	rs3=st.executeQuery("select * from SYSTEM.USLIST where uname='"+ses.getAttribute("uname")+"'");
	if(rs3.next()){
				System.out.println("entered if");
		str=rs3.getString("email");
		str1=rs3.getString("DNAME");
		System.out.println("in if 1");
		ses.setAttribute("smmail",str);
		ses.setAttribute("smdname",str1);
		ses.setAttribute("smamt",request.getParameter("amount"));
				System.out.println("in if 2");
		System.out.println("Mail ID is "+(String)ses.getAttribute("smmail"));
		System.out.println("Amount is "+(String)ses.getAttribute("smamt"));
		System.out.println("Name is "+(String)ses.getAttribute("smdname"));
				System.out.println("leaving if");
	}
		System.out.println("left if");%>
		<script type="text/javascript">
		//	alert("entered js1");
	  alert("Congratulations!! \r\n Amount successfully transferred and an email was sent to "+(String)ses.getAttribute("smmail"));	  </script>
	  
		<c:redirect url="/MailServlet"></c:redirect>
		 <%--<jsp:forward page="http://localhost:8080/I-Bank/MailServlet"></jsp:forward>--%>
	  
	   

	<%System.out.println("new one");
	}
    catch(Exception e){e.printStackTrace();}}
	else{
		%>
		 <script type="text/javascript">
	  alert("Amount is not transferred due to low balance\r\nMinimum Balance for Corporate Accounts is INR 10000 and Minimum Balance for Personal Accounts is INR 1000");
	  parent.history.go(-1);
	</script>
<%}
} //to check if acc exists line 8
else{%>	<script type="text/javascript">alert("No such Account Holder"); </script><%} 
}//to check if tpass is correct line 6
	else{%><script type='text/javascript'>alert('Incorrect Transaction Password.');parent.history.go(-1);</script><%}
}//for line 5
else{System.out.println("if 1");}
%>
	

</body>
</html>