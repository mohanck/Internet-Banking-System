<%@ page language="java" contentType="text/html; charset=UTF-8"
    import="java.sql.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri = "http://java.sun.com/jsp/jstl/fmt"%>
<fmt:setBundle basename="resource"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	  <link rel="SHORTCUT ICON" href="image/icon.ico">
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
	 <%//System.out.println("styles_2.css is preferred in theme.jsp");
	 }if(s.equals("2")){	  
	 %><link rel="stylesheet" href="css/styles_green.css" /><%
	 //System.out.println("styles_2_1.css is preferred in theme.jsp");
	 }if(s.equals("3")){
			  %><link rel="stylesheet" href="css/styles_brown.css" />
			  <%//System.out.println("styles_blue.css is preferred in Transaction");
			  }}%>
<title>:: Edit  Profile ::</title>
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
<!--
<style type="text/css">
#customers
{
font-family:Trebuchet MS, Arial, Helvetica, sans-serif;
width:45%;
border-collapse:collapse;
}

#customers td
{
font-size:0.9em;
border:1px solid #949599;
padding:3px 7px 2px 7px;
}
</style>-->
<SCRIPT LANGUAGE="JavaScript">
function gh(){
	var email=0,phone=0,disname=0,name=0,add=0;
var pno=/^[0-9]{10}$/;
var name=/^[a-z|A-Z.]+$/;
var addr=/^([a-z|A-Z]&[0-9,-])|\d{1}/;
var Email=/^([a-zA-Z0-9_.-])+@(([a-zA-Z0-9-])+)+\.+([a-zA-Z0-9.]{2,4})+$/;

if (Email.test(document.getElementById("em").value)){
document.getElementById("l4").style.display="none";
email=1;
}
else{
email=0;
document.getElementById("l4").style.display="inline";
document.getElementById("l4").innerHTML="&nbsp;&nbsp; <img src='images/mess_failure.gif' height='15 px'/> Invalid Email Address";
// alert("Invalid Email ID");
}

if(pno.test(document.getElementById("phno").value)){
phone=1;
document.getElementById("l3").style.display="none";
}
else{
phone=0;
document.getElementById("l3").style.display="inline";
document.getElementById("l3").innerHTML="&nbsp;&nbsp; <img src='images/mess_failure.gif' height='15 px'/> Invalid Mobile Number";
// alert("Invalid Mobile Number");
}

if(name.test(document.getElementById("dname").value)){
disname=1;
document.getElementById("l1").style.display="none";
}
else{
disname=0;
document.getElementById("l1").style.display="inline";
document.getElementById("l1").innerHTML="&nbsp;&nbsp; <img src='images/mess_failure.gif' height='15 px'/> Invalid Display Name";
// alert("Invalid Display Name");
}

if(name.test(document.getElementById("pname").value)){
name=1;
document.getElementById("l2").style.display="none";
}
else{
name=0;
document.getElementById("l2").style.display="inline";
document.getElementById("l2").innerHTML="&nbsp;&nbsp; <img src='images/mess_failure.gif' height='15 px'/> Invalid Name";
// alert("Invalid Name");
}

if(addr.test(document.getElementById("addr").value)){
add=1;
document.getElementById("l5").style.display="none";
}
else{
add=0;
document.getElementById("l5").style.display="inline";
document.getElementById("l5").innerHTML="&nbsp;&nbsp; <img src='images/mess_failure.gif' height='15 px'/> Invalid Address";
}

if(email==1 && phone==1  && disname==1 && name==1 && add==1)
{
return true;
}
else
	{
	// alert("Fill Details Correctly");
    return false;
	}
}

</script>
</head>

<body BGCOLOR="#EEEEEE">
<%!String s;
ResultSet rs,rs1;
Statement st,st1,st2;
Connection con;
ServletContext ctx;
HttpSession ses;
public void jspInit(){
	 try{
ctx=getServletContext();
con=(Connection)ctx.getAttribute("Connection");
st = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
        ResultSet.CONCUR_UPDATABLE);
st1=con.createStatement();
st2=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
        ResultSet.CONCUR_UPDATABLE);
 } 
	 catch(Exception e){
		 e.printStackTrace();
	 }
}
%>
<%ses=request.getSession(); %>
	<div><img src="images1/ibank.jpg" height="100" width="250"></div>	
	<label id="lab" style="font-weight:bold;display:none;"><%=ses.getAttribute("dname")%></label>
	<%@include file="test.jsp" %>
	<form action="#" method="post" onSubmit="return gh();">
	 <%
	 String xquery = "Select xmlquery('$c/account/*/text()'" + " passing ACXML as \"c\") " + " from SYSTEM.ACC where uname ='"+ses.getAttribute("uname")+"'";
	 rs1 = st1.executeQuery(xquery);
	 System.out.println("before xml");
	 String s="";
	 String values[];
	 while(rs1.next()){
		s=rs1.getString(1);
	 System.out.println("  "+rs1.getString(1));
	 }
	 values=s.split(" ");
	 System.out.println("after xml");
	 rs1=st1.executeQuery("select * from SYSTEM.USLIST where uname='"+ses.getAttribute("uname")+"'");
	 if(rs1.next()){
	 %>
	<br><br>
	 <center>
	 <table width='75%' id="customers" align='center' border='1px' id='customers' style='margin-bottom:10px;border:1px;border-collapse=collapse'>
	 <tr><td bgcolor="#6083AD" align="center" width="35%"><font color="#FFFFFF" style="font-family:font-family:Trebuchet MS, Arial, Helvetica, sans-serif;"><fmt:message key="User"/> <fmt:message key="name"/> </font></td><td align="center" bgcolor="#FFFFFF" width="100%"><input type="text" id="uname" name="username" readonly="readonly"  size="55%" style="font-family:Comic Sans MS " value=<%=values[1]%> /></td></tr>
	 <tr><td bgcolor="#6083AD" align="center" width="35%"><font color="#FFFFFF" style="font-family:font-family:Trebuchet MS, Arial, Helvetica, sans-serif;"><fmt:message key="Dis"/> <fmt:message key="name"/> </font></td><td align="center" bgcolor="#FFFFFF" width="100%"><input type="text" name="disname" id="dname"  size="55%" style="font-family:Comic Sans MS " value=<%=values[7]%> /><label style="display:none;color:#FF3366" id="l1"></label></td></tr>	 
	 <tr><td bgcolor="#6083AD" align="center" width="35%"><font color="#FFFFFF" style="font-family:font-family:Trebuchet MS, Arial, Helvetica, sans-serif;"><fmt:message key="name"/> </font></td><td align="center" bgcolor="#FFFFFF" width="100%"><input type="text" name="name" id="pname" readonly="readonly" size="55%" style="font-family:Comic Sans MS " value=<%=values[0]%> /><label style="display:none;color:#FF3366" id="l2"></label></td></tr>
	 <tr><td bgcolor="#6083AD" align="center" width="35%"><font color="#FFFFFF" style="font-family:font-family:Trebuchet MS, Arial, Helvetica, sans-serif;"><fmt:message key="mobno"/> </font></td><td align="center" bgcolor="#FFFFFF" width="100%"><input type="text" name="pno" id="phno" size="55%" style="font-family:Comic Sans MS " value=<%=values[4]%> /><label style="display:none;color:#FF3366" id="l3"></label></td></tr>	 
	 <tr><td bgcolor="#6083AD" align="center" width="35%"><font color="#FFFFFF" style="font-family:font-family:Trebuchet MS, Arial, Helvetica, sans-serif;"><fmt:message key="Email"/> </font></td><td align="center" bgcolor="#FFFFFF" width="100%"><input type="text" name="email" id="em" size="55%" style="font-family:Comic Sans MS " value=<%=values[5]%> /><label style="display:none;color:#FF3366" id="l4"></label></td></tr>
	 	 <tr><td bgcolor="#6083AD" align="center" width="35%"><font color="#FFFFFF" style="font-family:font-family:Trebuchet MS, Arial, Helvetica, sans-serif;"><fmt:message key="addr"/> </font></td><td align="center" bgcolor="#FFFFFF" width="100%"><input type="text" name="add" id="addr" size="55%" style="font-family:Comic Sans MS " value=<%=values[3]%> /><label style="display:none;color:#FF3366" id="l5"></label></td></tr>
	 </table>
	 <input type="Submit" value="<fmt:message key="Update"/>">
	 </center>
	 <%} %>
	</body>
	
	
	<%if(request.getParameter("disname")!=null && request.getParameter("name")!=null && request.getParameter("pno")!=null && request.getParameter("email")!=null && request.getParameter("add")!=null){
//	st.execute("update SYSTEM.USLIST set dname ='"+request.getParameter("disname")+"',name ='"+request.getParameter("name")+"',pno ='"+request.getParameter("pno")+"',email='"+request.getParameter("email")+"',address ='"+request.getParameter("add")+"' where uname ='"+ses.getAttribute("uname")+"'");
st.execute("update SYSTEM.USLIST set dname ='"+request.getParameter("disname")+"',pno ='"+request.getParameter("pno")+"',email='"+request.getParameter("email")+"',address ='"+request.getParameter("add")+"' where uname ='"+ses.getAttribute("uname")+"'");	
//String values[]=(String [])ses.getAttribute("values");
	String str="<account>"+"<achname>"+values[0]+" "+"</achname>"+"<acuname>"+values[1]+" "+"</acuname>"+"<utpass>"+values[2]+" "+"</utpass>"+"<address>"+request.getParameter("add")+" "+"</address>"+"<pno>"+request.getParameter("pno")+" "+"</pno>"+"<email>"+request.getParameter("email")+" "+"</email>"+"<ppass>"+values[6]+" "+"</ppass>"+"<dname>"+request.getParameter("disname")+" "+"</dname>"+"</account>";
	st1.execute("update SYSTEM.ACC set ACXML='"+str+"' where uname='"+ses.getAttribute("uname")+"'");
	System.out.println(request.getParameter("username"));
    //prest.setString(1,);
    //prest.setString(2,);
    //prest.setString(3,);
    //prest.setString(4,);
    //prest.setString(5,);
    //prest.setString(6,(String));  
    //prest.execute();
    System.out.println("Entered into table");
	%>
	<script type="text/javascript">
	alert("Profile Updated Successfully!!");
	window.location.href="http://localhost:8080/I-Bank/profile.jsp";
	</script>
	<%} %>
	</html>