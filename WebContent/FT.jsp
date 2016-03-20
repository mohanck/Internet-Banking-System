<%@ page language="java" contentType="text/html; charset=UTF-8"
    import="java.sql.*,java.io.*;" pageEncoding="UTF-8"%>
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
	 <%System.out.println("styles_2.css is preferred in theme.jsp");}if(s.equals("2")){	  
	 %><link rel="stylesheet" href="css/styles_green.css" /><%
	 System.out.println("styles_2_1.css is preferred in theme.jsp");}if(s.equals("3")){
			  %><link rel="stylesheet" href="css/styles_brown.css" />
			  <%//System.out.println("styles_blue.css is preferred in Transaction");
			  }}%>
<title>:: Funds Transfer ::</title>
<!--
<style type="text/css">
#customers
{
font-family:Trebuchet MS, Arial, Helvetica, sans-serif;
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
</style>
-->
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
var bal=/^[0-9.]+$/;
var str,str1,a8;
function func1(str)
{
switch(str){
case "Enter Amount":
document.getElementById("amt").value="";
document.getElementById("amt").style.color="#000000";
break;
default:
// alert("in default");
}
}
function func2(str,str1) 
{
if(str1==8){
if(!bal.test(str))
{
document.getElementById("amt").style.color="#A7A7A7";
document.getElementById("amt").value="Enter Amount";
document.getElementById("l8").style.display="block";
document.getElementById("l8").innerHTML="<img src='images/mess_failure.gif' height='15px'/> Invalid Amount";
a8=0;
}
if(bal.test(str)){
document.getElementById("l8").style.display="none";
a8=1;
 }
}
}
function val(){
if(a8==1){
// alert("true");
return true;
}
else
{
alert("Fill Details Completely");
return false;
}
}

function setFocus()
{
document.getElementById("amt").focus();
}

</script>
</head>

<body BGCOLOR="#EEEEEE" onLoad="setFocus()">
<%!String s;
ResultSet rs,rs1;
Statement st,st1;
Connection con;
ServletContext ctx;
HttpSession ses;
public void jspInit(){
	 try{
ctx=getServletContext();
{
con=(Connection)ctx.getAttribute("Connection");
st = con.createStatement();
st1 = con.createStatement();
 } }
	 catch(Exception e){
		 e.printStackTrace();
	 }
}
%>
<%	PrintWriter pw=response.getWriter();
String str=request.getParameter("sel");
String str1=request.getParameter("rad");
	System.out.println(request.getParameter("sel"));
	System.out.println(request.getParameter("rad"));
	ctx.setAttribute("rec",str);
	ctx.setAttribute("sen",str1);
	%>
	<div><img src="images1/ibank.jpg" height="100" width="250"></div>	
	<label id="lab" style="font-weight:bold;display:none;"><%=ses.getAttribute("dname")%></label>
	 <%@include file="test.jsp"%>
	<form action="Transfer11.jsp" method="post" onSubmit="return val();">
	 <br><br>FROM:
	<%
	rs=st.executeQuery("select * from SYSTEM.USACC where uname='"+ses.getAttribute("uname")+"'"); 
	if(rs!=null){int i=0;%>
	<table align='center' border='1px' id='customers' style='margin-bottom:10px;border:1px;border-collapse=collapse'>
<tr><th width='19%'><fmt:message key='A/CNO'/></th><th width='19%'><fmt:message key='A/CTYPE'/></th><th width='19%'><fmt:message key='Branch'/></th><th width='19%'><fmt:message key='availbal'/></th></tr>
	<%while(rs.next()){
		if(rs.getString(3).equals(request.getParameter("rad"))){
	if(i%2==0){%>
	<tr><td align="center"><%=rs.getString(3) %></td><td align="center"><%=rs.getString(4) %></td><td align="center"><%=rs.getString(6) %></td><td align="center"><%=rs.getString(5) %></td></tr>
	<%i++;}else{ %><tr class="alt"><td align="center"><%=rs.getString(3) %></td><td align="center"><%=rs.getString(4) %></td><td align="center"><%=rs.getString(6) %></td><td align="center"><%=rs.getString(5) %></td></tr>
	<%i++;}}}}%></table><br><br>
	TO:
	<%	rs1=st1.executeQuery("select * from SYSTEM.USACC where uname='"+ses.getAttribute("uname")+"'"); 
	if(rs1!=null){int i=0;%>
	<table align='center' border='1px' id='customers' style='margin-bottom:10px;border:1px;border-collapse=collapse'>
<tr><th width='19%'><fmt:message key='A/CNO'/></th><th width='19%'><fmt:message key='A/CTYPE'/></th><th width='19%'><fmt:message key='Branch'/></th><th width='19%'><fmt:message key='availbal'/></th></tr>
	<%while(rs1.next()){
		if(rs1.getString(3).equals(request.getParameter("sel"))){
	if(i%2!=0){%>
	<tr><td align="center"><%=rs1.getString(3) %></td><td align="center"><%=rs1.getString(4) %></td><td align="center"><%=rs1.getString(6) %></td><td align="center"><%=rs1.getString(5) %></td></tr>
	<%i++;}else{ %><tr class="alt"><td align="center"><%=rs1.getString(3) %></td><td align="center"><%=rs1.getString(4) %></td><td align="center"><%=rs1.getString(6) %></td><td align="center"><%=rs1.getString(5) %></td></tr>
	<%i++;}}}}%></table>
	
	
	<br><br><center>
	<table align="center"><tr><td width="55%"><label><fmt:message key="Amt"/></label></td><td width="50%"><input type="text" size="21" STYLE="color: #A7A7A7; font-family:Comic Sans MS " name="amount" id="amt" value="Enter Amount" onfocus="func1(this.value)" onblur="func2(this.value,8)"/><label style="display:none;color:#FF3366" id="l8"></label> </td></tr><tr></tr><tr></tr>
	<tr><td width="50%"><label><fmt:message key="Tran"/>  <fmt:message key="pwd"/></label></td><td width="50%"><input type="password" name="tpass" id="pwd" size="21"style="font-family:Jokerman;"></td></tr></table><br>
	<input type="Submit" value="<fmt:message key='Transfer'/>"/>
	</center>
	</form>
	
	</body>
	
	</html>