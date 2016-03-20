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
<title>:: Transactions ::</title>

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
var string;
function dd(str)
{
document.getElementById("trans").style.display="inline";
string=str;
}

function accsel1(str){

xmlhttp=GetXmlHttpObject();

if (xmlhttp==null)
 {
  alert ("Your browser does not support XMLHTTP!");
  return;
  } 
  document.getElementById("image").style.display="inline";
var url="http://localhost:8080/I-Bank/ajx";
url=url+"?str1="+string+"&str2="+document.getElementById('selno').value;
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
if ((xmlhttp.readyState==4)||(xmlhttp.status==200))
  {
  document.getElementById("image").style.display="none";
  document.getElementById("trans").style.display="none";
  document.getElementById("acc").innerHTML=xmlhttp.responseText;   
  document.getElementById("rpt").innerHTML="<center><form action='http://localhost:8080/I-Bank/Jaspertest' method='post'>Report Format: <select name='type'><option value='pdf' selected>PDF</option><option value='html'>HTML</option><!--<option value='xls'>MS-EXCEL</option>--></select>&nbsp;&nbsp;&nbsp;&nbsp;<input type='submit' value='Take a Report'></form></center>";
}
 }
</script>

</head>

<body BGCOLOR="#EEEEEE">
<%!
ResultSet rs;
Statement st;
Connection con;
ServletContext ctx;
HttpSession ses;
String s;
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
<%

rs=st.executeQuery("select * from SYSTEM.USACC where uname='"+ses.getAttribute("uname")+"'"); %>
<div><img src="images1/ibank.jpg" height="100" width="250"></div>	
<label id="lab" style="font-weight:bold;display:none;"><%=ses.getAttribute("dname")%></label>
<%@include file="test.jsp"%>
 <br><br><br>
 <span style=" position:absolute; left:150px;font-weight:normal;font-family:'Lucida Grande', 'Lucida Sans Unicode', Tahoma, Arial, san-serif; font-size:15px; color:#000000 !important; line-height:16px; text-transform:none; text-shadow:none;"><fmt:message key="accviewtrans"/></span>
 <br><br>

<%if(rs!=null){int i=0;%>
<table align='center' border='1px' id='customers' style='margin-bottom:10px;border:1px;border-collapse=collapse'>
<tr><th width="1%"></th><th width="19%"><fmt:message key="A/CNO"/></th><th width="19%"><fmt:message key="A/CTYPE"/></th><th width="19%"><fmt:message key="Branch"/></th><th width="19%"><fmt:message key="availbal"/></th></tr>
<%while(rs.next()){
if(i%2==0){%>
<tr><td align="center"><input type="radio" id="accno" name="rad" value=<%=rs.getString(3)%> onchange="dd(this.value)"></td><td align="center"><%=rs.getString(3) %></td><td align="center"><%=rs.getString(4) %></td><td align="center"><%=rs.getString(6) %></td><td align="center"><%=rs.getString(5) %></td></tr>
<%i++;}else{ %><tr class="alt"><td align="center"><input type="radio" name="rad" id="accno" value=<%=rs.getString(3)%> onchange="dd(this.value)"></td><td align="center"><%=rs.getString(3) %></td><td align="center"><%=rs.getString(4) %></td><td align="center"><%=rs.getString(6) %></td><td align="center"><%=rs.getString(5) %></td></tr>
<%i++;} }}%></table><br><br>

<div id="trans" align="center" style="display:none;">
<center>
<fmt:message key="NoTrans"/>
<select name="selnum" id="selno">
 <option value="5"><fmt:message key="Last"/> 5 <fmt:message key="Trans"/></option>
<option value="10"><fmt:message key="Last"/> 10 <fmt:message key="Trans"/></option>
<option value="15"><fmt:message key="Last"/> 15 <fmt:message key="Trans"/></option>
<option value="20"><fmt:message key="Last"/> 20 <fmt:message key="Trans"/></option>
</select><br><br>
<input type="button" value="<fmt:message key="Viewtrans"/>" onclick="accsel1(document.getElementById('selno').value)">
</center>
</div>
<center><img src="images1/ajax-loader (1).gif" id="image" style="display:none;"/></center> 
<div id="acc" align="center" ></div>
<div id="rpt" align="center"></div>
</body>
</HTML>