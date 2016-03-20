<%@ page language="java" contentType="text/html; charset=UTF-8"
    import="java.sql.*" pageEncoding="UTF-8"%>
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
<title>:: Change Password ::</title>
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
<style type="text/css">
body{
	font-weight:normal;
	font-family:'Lucida Grande', 'Lucida Sans Unicode', 'Tahoma','Arial', 'san-serif';
    }
</style>

<script type="text/javascript">
var str;

function func()
{
//alert("func called");
var s;
s=document.getElementById("ppd").value;
var reg=/^\S+$/;
if(reg.test(s))
	{
// alert("true");
return true;
    }
else
	{
	// alert("false");
return false;
    }
}


</script>

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
<label id="lab" style="font-weight:bold;display:none;"><%=ses.getAttribute("dname")%></label>
 <%@include file="test.jsp"%>
 <br><br><br>
 <span style=" position:absolute; left:150px;font-weight:normal;font-family:'Lucida Grande', 'Lucida Sans Unicode', Tahoma, Arial, san-serif; font-size:15px; color:#000000 !important; line-height:16px; text-transform:none; text-shadow:none;">Enter the profile password </span>
 <br><br>
<center>
<form method="post" action="#" onSubmit="return func();">
<br><br>
<label style='font-size:17 px;'>Profile Password:</label><input type='password' name='ppass' id='ppd' size='21' style='font-family:Jokerman;'>
<br><br>
<label style="display:inline;color:#000000;font-size: 14 px;" id="op"></label><br>
<input type="submit" name="sub" value="Submit">
</form>
</center>
</body>
</html>
<%if(request.getParameter("sub")!=null && request.getParameter("ppass")!=null){
	System.out.println("in password page inside submit");
rs=st.executeQuery("select * from SYSTEM.USACC where uname='"+ses.getAttribute("uname")+"' and ppass='"+request.getParameter("ppass")+"'");
if(rs.next()){
	ses.setAttribute("profilepwd","ok");
out.println("<script type='text/javascript'>window.location.href=\"http://localhost:8080/I-Bank/changepwd.jsp\"</script>");
	}
	else
	{
	out.println("<script type='text/javascript'>alert('Profile password incorrect');</script>");
	}
}
%>