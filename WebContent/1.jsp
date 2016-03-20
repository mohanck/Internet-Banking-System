<%@ page language="java" contentType="text/html; charset=UTF-8"
    import="java.sql.*,java.io.*,java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri = "http://java.sun.com/jsp/jstl/fmt"%>
<fmt:setBundle basename="resource"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	  <link rel="SHORTCUT ICON" href="image/icon.ico">
	   <title>:: Login ::</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	
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

<script type="text/javascript">
	window.history.forward();
	function noBack(){ window.history.forward(); }
</script>

<style type="text/css">
body{
	font-family:arial;  
	font-size:10 px;
}

</style>
<body BGCOLOR="#EEEEEE" onload="noBack();" onpageshow="if (event.persisted) noBack();" onunload="">
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
st = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
        ResultSet.CONCUR_UPDATABLE);
System.out.println("in jsp init");
 } 
	 catch(Exception e){
		 e.printStackTrace();
	 }
}
%>
<div><img src="images1/ibank.jpg" height="100" width="250"></div>	
 <br><br><br> <br><br><br> <br>
<center>
<form method="post">
<TABLE>
<TR>
	<TD>Admin Name </TD>
	<TD><INPUT TYPE="text" style="font-family:Comic Sans MS;" NAME="adminname" size="22"></TD>
</TR>
<TR>
	<TD>Password </TD>
	<TD><INPUT TYPE="password" style="font-family:Jokerman;" NAME="pwd" size="21"></TD>
</TR>
</TABLE>
<label style="display:inline;color:#FF3366;font-size: 14 px;" id="op"></label> <br><br>
<input type="submit" value="Login">

</form>
</center></body>
</html>
<%
if(request.getParameter("adminname")!=null && request.getParameter("pwd")!=null){

rs=st.executeQuery("select * from SYSTEM.ADMINACC where name='"+request.getParameter("adminname")+"'");
if(rs.next()){
if(rs.getString("name").equals(request.getParameter("adminname")) && rs.getString("pwd").equals(request.getParameter("pwd"))){
//ses.setAttribute("adminname",request.getParameter("adminname"));	
out.println("<script type='text/javascript'>window.location.href=\"http://localhost:8080/I-Bank/2.jsp\"</script>");}
}else
out.println("<script type='text/javascript'>document.getElementById('op').innerHTML=\"<br><span style='font-family:Georgia'>Entered Admin Name/Password is wrong.</span>\";</script>");
}

%>