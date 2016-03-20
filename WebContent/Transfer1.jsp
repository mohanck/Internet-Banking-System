<%@ page language="java" contentType="text/html; charset=UTF-8"
    import="java.sql.*,java.io.*,java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri = "http://java.sun.com/jsp/jstl/fmt"%>
<fmt:setBundle basename="resource"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.text.DecimalFormat"%>
<html>
<head>
	  <link rel="SHORTCUT ICON" href="image/icon.ico">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>:: Funds Transfer ::</title>
	  <script type="text/javascript">

 var isNS = (navigator.appName == "Netscape") ? 1 : 0;
  if(navigator.appName == "Netscape") document.captureEvents(Event.MOUSEDOWN||Event.MOUSEUP);
  function mischandler(){
   return false; 
 }
  function mousehandler(e){
 	var myevent = (isNS) ? e : event;
 	var eventbutton = (isNS) ? myevent.which : myevent.button;
    if((eventbutton==2)||(eventbutton==3)) return false;
 }
 document.oncontextmenu = mischandler;
 document.onmousedown = mousehandler;
 document.onmouseup = mousehandler;

</script>

  <%
	  ses=request.getSession();
	  if(ses.getAttribute("uname")==null)
			response.sendRedirect("/I-Bank/login.jsp");
	  else{
	  System.out.println("ses is "+ses.getAttribute("uname"));
	  rs=st.executeQuery("select * from SYSTEM.THEME where uname='"+ses.getAttribute("uname")+"'");
	  if(rs!=null){
	  if(rs.next()){
	 s=rs.getString("themeval");
	 System.out.println("s in theme is "+s);
	 }}
	  if(s.equals("1")){
	 %><link rel="stylesheet" href="css/styles_blue.css" />
	 <%System.out.println("styles_2.css is preferred in theme.jsp");}if(s.equals("2")){	  
	 %><link rel="stylesheet" href="css/styles_green.css" /><%
	 System.out.println("styles_2_1.css is preferred in theme.jsp");}if(s.equals("3")){
			  %><link rel="stylesheet" href="css/styles_brown.css" />
			  <%//System.out.println("styles_blue.css is preferred in Transaction");
			  }}%>

</head>
<body BGCOLOR="#EEEEEE">
<%!String s;
ResultSet rs,rs1,rs2;
Statement st;
Connection con;
ServletContext ctx;
HttpSession ses;
public void jspInit(){
	 try{
ctx=getServletContext();
con=(Connection)ctx.getAttribute("Connection");
st = con.createStatement();
 } 
	 catch(Exception e){
		 e.printStackTrace();
	 }
}
%>

<%PrintWriter out1=response.getWriter();
rs=st.executeQuery("select * from SYSTEM.USACC where uname='"+ses.getAttribute("uname")+"'"); %>
<div><img src="images1/ibank.jpg" height="100" width="250"></div>	
<label id="lab" style="font-weight:bold;display:none;"><%=ses.getAttribute("dname")%></label>
 <%@include file="test.jsp"%>
 <br><br>
<%synchronized(ses){	
System.out.println("Transaction password is " +request.getParameter("tpass"));	
System.out.println("Account number is " +request.getParameter("accountno"));	
System.out.println("Account branch is " +request.getParameter("branch"));	
System.out.println("Selected Account number is " +request.getParameter("rad"));	
try {
	if(request.getParameter("tpass")!=null){
	rs1=st.executeQuery("select * from SYSTEM.USACC where uname='"+ses.getAttribute("uname")+"' and tpass='"+request.getParameter("tpass")+"'");
	if(rs1.next()){
	rs2=st.executeQuery("select * from SYSTEM.USACC where acno='"+request.getParameter("accountno")+"' and branch='"+request.getParameter("branch")+"'");
	if(rs2.next())
	{
	    ses.setAttribute("sender",request.getParameter("accountno"));	
	    ses.setAttribute("selacc",request.getParameter("rad"));	

		out.println("<table align='center' border='1px' id='customers' style='margin-bottom:10px;border:1px;border-collapse=collapse'><tr><th width='19%'>A/C NO</th><th width='19%'>A/C HOLDER</th><th width='19%'>A/C TYPE</th><th width='19%'>BRANCH</th></tr>");
        out.println("<tr><td align='center'>"+rs2.getString(3)+"</td><td align='center'>"+rs2.getString(7)+"</td><td align='center'>"+rs2.getString(4)+"</td><td align='center'>"+rs2.getString(6)+"</td></tr></table>");
        out.println("<br><br><br><br>");%>
     <script type="text/javascript">
        function Func1()
{
//alert("Please enter the Account number to which you want to transfer your funds");
document.getElementById("BALANCE").value="";
}


function Func2()
{
if(document.getElementById("BALANCE").value=="")
document.getElementById("BALANCE").value="Transfer Amount";

 var t=/^[0-9]+$/;
 var s=/^[0]+$/;
if(t.test(document.getElementById("BALANCE").value) && !(s.test(document.getElementById("BALANCE").value)))
;
else{
alert("Please check Amount entered");
return;
}

}
 </script>
        <form action='#'>
        <center>
        <label>Amount :  </label>
        <input type='text' name='balance' id='BALANCE' style="font-family:Jokerman;color:#A7A7A7;" value="Transfer Amount" onFocus="Func1()" onBlur="Func2()">
        <br><br>
        <label style="display:none;"></label>
        <input type='Submit' name='submit' id='SUBMIT'>
        </center>
        </form>
<%} 
	else{
		
		out.println("<script type='text/javascript'>alert('Incorrect A/C No or Branch name.Please check whether CAPS LOCK is ON.\\nNOTE:All Branch Names should be entered in UPPER CASE Only!!!');</script>");%>
		<script type='text/javascript'>parent.history.go(-1);</script>
		<%	}
}
	else{
		out.println("<script type='text/javascript'>alert('Incorrect Transaction Password.');</script>");%>
		<script type='text/javascript'>parent.history.go(-1);</script>
		<%
		}
	
	}
	
	else
		
	{%>
		<script type='text/javascript'>parent.history.go(-1);</script>	
	<% }
}
catch (SQLException e) {
	e.printStackTrace();
}

if(request.getParameter("submit")!=null){
	rs=st.executeQuery("select * from SYSTEM.USACC where uname='"+ses.getAttribute("uname")+"' and acno='"+ses.getAttribute("selacc")+"'");
	if(rs.next())
	{
		
		System.out.println(rs.getFloat(5));
		if(rs.getFloat(5)>Float.valueOf(request.getParameter("balance")))
		{	
			System.out.println(rs.getFloat(5)-Float.valueOf(request.getParameter("balance")));
			Float bal=Float.valueOf(request.getParameter("balance"));
			Float bal1=rs.getFloat(5)-Float.valueOf(request.getParameter("balance"));
			st.execute("UPDATE USACC set bal=bal+'"+bal+"' where acno='"+ses.getAttribute("sender")+"'");
			st.execute("UPDATE USACC set bal='"+bal1+"' where acno='"+ses.getAttribute("selacc")+"'");
			%>
		  out1.print("<script type='text/javascript'>alert('Congatulations!! \r\n Amount successfully transferred ')");
		  window.location.href="http://localhost:8080/I-Bank/Page1.jsp";
		  </script>
		<%
		/*out.println("<br<br><br><br><br><center>Amount is transferred successfully to "+ses.getAttribute("sender")+"</center>");*/
		}
		else{
			
			%>
			 <script type="text/javascript">
		  alert("Amount is not transferred due to low balance");
		</script>
			<%
	        /*out.println("<br<br><br><br><br><center>Amount is not transferred due to low balance</center>");*/
            
		}
	}
	System.out.println(request.getParameter("balance"));
}}
%>



</body>
</html>