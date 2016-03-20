<%@ page language="java" contentType="text/html; charset=UTF-8"
    import="java.sql.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri = "http://java.sun.com/jsp/jstl/fmt"%>
<fmt:setBundle basename="resource"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	  <link rel="SHORTCUT ICON" href="image/icon.ico">
<title>:: Unlock Accounts ::</title>
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


function Check()
{
  if(document.getElementById("chkbx").checked == true){
  var a=1;
  for (a=1;a<=document.getElementsByName("rad").length;a++)
  {
    document.getElementById(a).checked=true;
  }}
  else{
var a=1;
  for (a=1;a<=document.getElementsByName("rad").length;a++)
  {
    document.getElementById(a).checked=false;
  }
  }
  
}


function chk()
{
var count=0;
var a=1;
for(a=1;a<=document.getElementsByName("rad").length;a++){
if(document.getElementById(a).checked == true)
{
count=1;
break;
}
}

if(count!=1)
{
alert("Please select an Account");
return false;
}
else{
return true;
}
}
</script>

<style type="text/css">
#customers    
{
font-family:"Trebuchet MS", Arial, Helvetica, sans-serif;
width:76%;
border-collapse:collapse;
}
#customers tr
{
background-color:#FFFFFF;
color:#000000;
text-align:center;
}
#customers td, #customers th 
{
font-size:0.9em;
border:1px solid #949599;
padding:3px 7px 2px 7px;
}
#customers th 
{
font-size:0.9em;
text-align:center;
padding-top:5px;
padding-bottom:4px;
background-color:#6083AD;
color:#ffffff;
}
#customers tr.alt td 
{
color:#000000;
background-color:#EEEEEE;
}

a:link, a:visited, a:active	{ color: #3366CC; text-decoration: none; }

a:hover				{ color: #009900; text-decoration: none; }

body{
	font-family:arial;
	font-size:10 px;
}

</STYLE>


</head>
<body BGCOLOR="#EEEEEE">
<%!String s;
ResultSet rs,rs1,rs2;
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
st1 = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
        ResultSet.CONCUR_UPDATABLE);
st2 = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
        ResultSet.CONCUR_UPDATABLE);
System.out.println("in jsp init");
 } 
	 catch(Exception e){
		 e.printStackTrace();
	 }
}
%>
<form action="#" method="post" onsubmit="return chk();">
<div><img src="images1/ibank.jpg" height="100" width="250"></div>	
 <br><br><br>
<%rs=st.executeQuery("select * from SYSTEM.USLIST where STATUS ='3'");%>
  <br><br><br>
  
  <span style="position:absolute;left:100px"><a href="2.jsp" style="font-size: 15 px;">Home</a></span>
  
  <span style="position:absolute;left:280px"><a href="createacc.jsp" style="font-size: 15 px;">Create New Account</a></span>
  
   <span style="position:absolute;left:450px"><a  href="DeleteAcc.jsp" style="font-size: 15 px;">Delete Existing Account</a></span>
 
   <span style="position:absolute;left:750px"><a  href="Checkbook.jsp" style="font-size: 15 px;">Approve Cheque Book Requests</a></span>
   
    <span style="position:absolute;left:1050px"><a href="login.jsp" style="font-size: 15 px;">Logout</a></span>
  <br><br><br><br><center>
<%if(rs!=null){
	
int i=0;%>   
<table align='center' border='1px' id='customers' style='margin-bottom:10px;border:1px;border-collapse=collapse'>
<tr><th width="1%"><input type="checkbox"  id="chkbx" onclick="Check()"></th><th width="19%">CATEGORY</th><th width="19%">USER NAME</th><th width="19%">DISPLAY NAME</th><th width="19%">EMAIL</th></tr>
<%while(rs.next()){
if(i%2==0){%>
<tr><td align="center"><input type="checkbox" name="rad" id=<%=i+1%> value=<%=rs.getString(2)%> ></td><td align="center"><%=rs.getString(1) %></td><td align="center"><%=rs.getString(2) %></td><td align="center"><%=rs.getString(7) %></td><td align="center"><%=rs.getString(9) %></td></tr>
<%i++;}else{ %><tr class="alt"><tr><td align="center"><input type="checkbox" name="rad" id=<%=i+1%> value=<%=rs.getString(2)%> ></td><td align="center"><%=rs.getString(1) %></td><td align="center"><%=rs.getString(2) %></td><td align="center"><%=rs.getString(7) %></td><td align="center"><%=rs.getString(9) %></td></tr>
<%i++;} }}%></table><br><br>
<input type="submit" name="sub" value="Unlock">
</center>
</form>
</body>
</html>
<% if(request.getParameter("sub")!=null && request.getParameterValues("rad")!=null)
{
	String str[]=request.getParameterValues("rad");
	for(int i=0;i<str.length;i++)
st2.execute("update SYSTEM.USLIST set STATUS='0' where uname='"+str[i]+"'");	
out.println("<script type='text/javascript'>alert('Accounts Unlocked Successfully');window.location.href='http://localhost:8080/I-Bank/unlockacc.jsp';</script>");
}%>