<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    import="java.sql.*" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	  <link rel="SHORTCUT ICON" href="image/icon.ico">
<link rel="stylesheet" href="css/styles_2.css" />
<title>:: Logout ::</title>
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
<body BGCOLOR="#EEEEEE" onload="ld()">
<%!
ResultSet rs;
Statement st;
Connection con;
ServletContext ctx;
HttpSession ses;
public void jspInit(){
	 try{
ctx=getServletContext();
{
con=(Connection)ctx.getAttribute("Connection");
st = con.createStatement();
 } }
	 catch(Exception e){
		 e.printStackTrace();
	 }
}
%>
<script type="text/javascript"><!--
function ld(){
<%
ses=request.getSession();
ses.invalidate();   //  System.out.println(ses.getAttribute("uname"));

response.setHeader("Cache-Control","no-cache");
response.setHeader("Cache-Control","no-store");
response.setDateHeader("Expires", 0);
// response.sendRedirect("home.jsp");
%>
window.location.href="http://localhost:8080/I-Bank";
}
</script>
</body>
</html>