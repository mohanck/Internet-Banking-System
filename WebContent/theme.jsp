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
	 <%System.out.println("styles_2.css is preferred in theme.jsp");}if(s.equals("2")){	  
	 %><link rel="stylesheet" href="css/styles_green.css" /><%
	 System.out.println("styles_2_1.css is preferred in theme.jsp");}if(s.equals("3")){
			  %><link rel="stylesheet" href="css/styles_brown.css" />
			  <%//System.out.println("styles_blue.css is preferred in Transaction");
			  }}%>

<title>:: Change Theme ::</title>

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
function varytheme(str)
{
//     alert("in theme");
	// alert("str is "+str);
xmlhttp=GetXmlHttpObject();
if (xmlhttp==null)
  {
  alert ("Your browser does not support XMLHTTP!");
  return;
  } 
var url="http://localhost:8080/I-Bank/ajx";
url=url+"?theme="+str;
xmlhttp.onreadystatechange=stateChanged;
xmlhttp.open("POST",url,false);
xmlhttp.send(null);
}

function GetXmlHttpObject()
{
if (window.XMLHttpRequest)
  {
  return new XMLHttpRequest();
  }
if (window.ActiveXObject)
  {
  return new ActiveXObject("Microsoft.XMLHTTP");
  }
return null;
}

function stateChanged()
{
// alert("In Statechanged");
if ((xmlhttp.readyState==4)||(xmlhttp.status==200))
  {
  // alert("IN ready state");
  document.getElementById("acc").innerHTML=xmlhttp.responseText;
   
  window.location.href="http://localhost:8080/I-Bank/theme.jsp";
  }
}
</script>
</head>
<%!
ResultSet rs;
Statement st;
Connection con;
ServletContext ctx;
HttpSession ses;
String s;	  
int k;

public void jspInit(){
	System.out.println("In init of change theme");
	 try{
ctx=getServletContext();
{
con=(Connection)ctx.getAttribute("Connection");
st = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
        ResultSet.CONCUR_UPDATABLE);
 }}
	 catch(Exception e){
		 e.printStackTrace();
	 }
}
%>

<body bgcolor="#EEEEEE">
<form action="#" method="post">
<div><img src="images1/ibank.jpg" height="100" width="250"></div>	
<label id="lab" style="font-weight:bold;display:none;"><%=ses.getAttribute("dname")%></label>
 <%@include file="test.jsp"%>
 <br><br><br>
<center>Please select any one of the below available themes
<br><br>
<span style="color:#000000;">Theme  </span>
<select name="theme" onBlur="varytheme(this.value)">
<option value="0" selected="selected" >Select Theme</option>
<option value="1" >Classic Blue</option> 
<option value="2">Classic Red</option> 
<option value="3">Classic Brown</option>
</select>
</center>
<div id="acc" align="center"></div>	
</form>
</BODY>
</HTML>