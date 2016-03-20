<%@ page language="java" contentType="text/html; charset=UTF-8"
    import="java.sql.*,java.io.*,java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri = "http://java.sun.com/jsp/jstl/fmt"%>
<fmt:setBundle basename="resource"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
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
	 
	  if(rs.next()){
	 s=rs.getString("themeval");
	 System.out.println("s in theme is "+s);
	 }
	  if(s.equals("1")){
	 %><link rel="stylesheet" href="css/styles_blue.css" />
	 <%System.out.println("styles_2.css is preferred in theme.jsp");}if(s.equals("2")){	  
	 %><link rel="stylesheet" href="css/styles_green.css" /><%
	 System.out.println("styles_2_1.css is preferred in theme.jsp");}if(s.equals("3")){
			  %><link rel="stylesheet" href="css/styles_brown.css" />
			  <%//System.out.println("styles_blue.css is preferred in Transaction");
			  }}%><title>:: Help ::</title>
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
</head>
<body BGCOLOR="#EEEEEE">
<div><img src="images1/ibank.jpg" height="100" width="250"></div>	
	<label id="lab" style="font-weight:bold;display:none;"><%=ses.getAttribute("dname")%></label>
	<%@include file="test.jsp" %>
<%!String s;
ResultSet rs;
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

 <center>
  Dear User,Welcome to the Help Section of iBank Net Banking Portal.Please select the relevant help by clicking on it<br><br>
  <table width="75%">
  <tr>
	<td width="50%"><a href="http://localhost:8080/I-Bank/help.jsp?q=1">Login Help</a></td>
	<td width="50%"><a href="http://localhost:8080/I-Bank/help.jsp?q=2">Account Details Help</td>
  </tr>
  <tr>
	<td width="50%"><a href="http://localhost:8080/I-Bank/help.jsp?q=3">Funds Transfer help</td>
	<td width="50%"><a href="http://localhost:8080/I-Bank/help.jsp?q=4">Third Party Funds Transfer Help</td>
  </tr>
  <tr>
	<td width="50%"><a href="http://localhost:8080/I-Bank/help.jsp?q=5">View Transactions Help</td>
	<td width="50%"><a href="http://localhost:8080/I-Bank/help.jsp?q=6">Cheque Book Request Help</td>
  </tr>
  <tr>
	<td width="50%"><a href="http://localhost:8080/I-Bank/help.jsp?q=7">Profile Help</td>
	<td width="50%"><a href="http://localhost:8080/I-Bank/help.jsp?q=8">Statements Help</td>
  </tr>
  <tr>
	<td width="50%"><a href="http://localhost:8080/I-Bank/help.jsp?q=9">Stop Cheques Help</td>
	<td width="50%"><a href="http://localhost:8080/I-Bank/help.jsp?q=10">Other Services Help</td>
  </tr>
  </table>
 </center>
 </body>
</html>
