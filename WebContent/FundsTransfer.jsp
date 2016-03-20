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
			  }}%>
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
</head>
<body BGCOLOR="#EEEEEE">
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
<script type="text/javascript">
function func(){
var rad1=0;var i;
for (i=1; i<=document.getElementsByName("sel").length; i++) { 
if(document.getElementById(i).checked==true) 
      { 
//rad=document.getElementById(i).value;
         rad1=1;
         break;
      } 
} 
if(rad1!=1){
alert("Please select an account to which you would like to transfer your funds to");
return false;
}
else
return true;
}
</script>


<script type="text/javascript">

function accsel(str)
{
	// alert("in func");
	 //alert(str);
xmlhttp=GetXmlHttpObject();
if (xmlhttp==null)
  {
  alert ("Your browser does not support XMLHTTP!");
  return;
  } 
var url="http://localhost:8080/I-Bank/ajx";
url=url+"?query="+str;
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
  } 
}

</script>


<%System.out.println("Rq is "+request.getParameter("q"));
if(request.getParameter("q")!=null){%>
	<script type="text/javascript">
	  alert("Personal Bankers can transfer amounts only upto Rs.5000 at one go!!\r\nPlease try to transfer amount less then Rs 5000.");
	  parent.history.go(-2);
	 </script>
<%}
//out.println("<script type='text/javascript'>var s=prompt('Enter your Transaction Password');</script>");
rs=st.executeQuery("select * from SYSTEM.USACC where uname='"+ses.getAttribute("uname")+"'"); %>
<BODY>
<div><img src="images1/ibank.jpg" height="100" width="250"></div>	
<label id="lab" style="font-weight:bold;display:none;"><%=ses.getAttribute("dname")%></label>
 <%@include file="test.jsp"%> 
 <form action="FT.jsp" method="post" onSubmit="return func();">
<br><br><br>
<span style=" position:absolute; left:150px;font-weight:normal;font-family:'Lucida Grande', 'Lucida Sans Unicode', Tahoma, Arial, san-serif; font-size:15px; color:#000000 !important; line-height:16px; text-transform:none; text-shadow:none;"><fmt:message key='Accfromtf'/></span>
<br><br>
<%if(rs!=null){int i=0;%>
<table align='center' border='1px' id='customers' style='margin-bottom:10px;border:1px;border-collapse=collapse'>
<tr><th width='1%'></th><th width='19%'><fmt:message key='A/CNO'/></th><th width='19%'><fmt:message key='A/CTYPE'/></th><th width='19%'><fmt:message key='Branch'/></th><th width='19%'><fmt:message key='availbal'/></th></tr>
<%while(rs.next()){
if(i%2==0){%>
<tr><td align="center"><input type="radio" name="rad" value=<%=rs.getString(3)%> onchange="accsel(this.value)"></td><td align="center"><%=rs.getString(3) %></td><td align="center"><%=rs.getString(4) %></td><td align="center"><%=rs.getString(6) %></td><td align="center"><%=rs.getString(5) %></td></tr>
<%i++;}else{ %><tr class="alt"><td align="center"><input type="radio" name="rad" value=<%=rs.getString(3)%> onchange="accsel(this.value)"></td><td align="center"><%=rs.getString(3) %></td><td align="center"><%=rs.getString(4) %></td><td align="center"><%=rs.getString(6) %></td><td align="center"><%=rs.getString(5) %></td></tr>
<%i++;} }}%></table><br><br>
<div id="acc" align="center"></div>
</form>
</BODY>
</HTML>