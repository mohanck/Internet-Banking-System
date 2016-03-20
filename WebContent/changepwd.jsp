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
// alert("1 is "+(document.getElementById("pwd").value));
// alert("2 is "+(document.getElementById("cpwd").value));
var s,s1;
s=document.getElementById("pwd").value;
s1=document.getElementById("cpwd").value;
var reg=/^[a-zA-Z0-9.@#$%^&*!]+$/;
if((s==s1) && (reg.test(s))){
// alert("true");
return true;
}
else{
// alert("false");
alert("Password and Confirm Password do not match");
return false;}
}


function chg(str)
{
switch(str)
	{

case 'trans':
document.getElementById("op").innerHTML="<!--<span style='background-color:#FFFFFF ;width:100%;align:center;'>--><fieldset><legend><font style='font-family:Jokerman;'>Change Password</font></legend><table align='center'><tr><td width='50%'><label style='font-size:13 px;'>Transaction Password</label></td><td width='50%' ><input type='password' name='pass' id='pwd' size='21' style='font-family:Jokerman;'></td></tr><tr></tr><tr><td width='50%'><label style='font-size:13 px;'>Confirm Password</label></td><td width='50%'><input type='password' name='cpass' id='cpwd' size='21' style='font-family:Jokerman;'></td></tr></table><br></fieldset><br><input type='submit' name='sub' value='Change'><!--</span>--><br>";
	break;

case 'user':
document.getElementById("op").innerHTML="<!--<span style='background-color:#FFFFFF ;width:100%;align:center;'>--><fieldset><legend><font style='font-family:Jokerman;'>Change Password</font></legend><table align='center'><tr><td width='50%'><label style='font-size:13 px;'>User Password</label></td><td width='50%' ><input type='password' name='pass' id='pwd' size='21' style='font-family:Jokerman;'></td></tr><tr></tr><tr><td width='50%'><label style='font-size:13 px;'>Confirm Password</label></td><td width='50%'><input type='password' name='cpass' id='cpwd' size='21' style='font-family:Jokerman;'></td></tr></table><br></fieldset><br><input type='submit' name='sub' value='Change'><!--</span>--><br>";
	break;

default:
	//alert("in default");

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
%><%if(ses.getAttribute("profilepwd")!=null)
	{
	// ses.removeAttribute("profilepwd");
	System.out.println("profilepwd okk");
	}
else
{
out.println("<script type='text/javascript'>window.location.href=\"http://localhost:8080/I-Bank/password.jsp\"</script>");
System.out.println("profilepwd not okk");
}
%>
<div><img src="images1/ibank.jpg" height="100" width="250"></div>	
<label id="lab" style="font-weight:bold;display:none;"><%=ses.getAttribute("dname")%></label>
 <script type="text/javascript" src="js/script.js"></script>
 <br><br><br>
 <span style=" position:absolute; left:150px;font-weight:normal;font-family:'Lucida Grande', 'Lucida Sans Unicode', Tahoma, Arial, san-serif; font-size:15px; color:#000000 !important; line-height:16px; text-transform:none; text-shadow:none;">Select the Password you wish to change </span>
 <br><br>
<center>
<form method="post" action="#" onSubmit="return func();">
<TABLE>
<TR>
	<TD><input type="radio" name="rad" id="tpwd" value="trans" onClick="chg('trans')"></TD>
	<TD style="font-size:14 px;">Transaction Password</TD>
</TR>
<TR>
</TR>
<TR>
	<TD><input type="radio" name="rad" id="upwd" value="user" onClick="chg('user')"></TD>
	<TD style="font-size:14 px;">User Password</TD>
</TR>
</TABLE><br><br><br><br>
<label style="display:inline;color:#000000;font-size: 14 px;" id="op"></label><br>
<!--<input type="submit" value="Change">-->
</form>
</center></body>
</html>
<%if(request.getParameter("sub")!=null && request.getParameter("pass")!=null){
rs=st.executeQuery("select * from SYSTEM.USACC where uname='"+ses.getAttribute("uname")+"'");
if(rs.next()){
if(request.getParameter("rad").equals("trans"))
	{
	st.execute("update SYSTEM.USACC set tpass='"+request.getParameter("pass")+"' where uname='"+ses.getAttribute("uname")+"'");
//ses.setAttribute("adminname",request.getParameter("adminname"));	
if(ses.getAttribute("profilepwd")!=null)
	{
	ses.removeAttribute("profilepwd");
	System.out.println("profilepwd okk");
	}
out.println("<script type='text/javascript'>alert('Transaction Password Changed Successfully');window.location.href=\"http://localhost:8080/I-Bank/Page1.jsp\"</script>");
    }
if(request.getParameter("rad").equals("user"))
    {
	st.execute("update SYSTEM.USACC set upass='"+request.getParameter("pass")+"' where uname='"+ses.getAttribute("uname")+"'");
	if(ses.getAttribute("profilepwd")!=null)
	{
	ses.removeAttribute("profilepwd");
	System.out.println("profilepwd okk");
	}
out.println("<script type='text/javascript'>alert('User Password Changed Successfully');window.location.href=\"http://localhost:8080/I-Bank/Page1.jsp\"</script>");}
	}
}
%>