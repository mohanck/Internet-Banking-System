<%@ page language="java" import="java.sql.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri = "http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
 <link rel="SHORTCUT ICON" href="image/icon.ico">
 <script language="JavaScript" src="calendar/calendar.js"></script>
	<link rel="stylesheet" href="calendar/calendar.css">
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
<title>:: Statements ::</title>
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
var str1,str2;

var string;
function dd(str)
{
document.getElementById("trans").style.display="inline";

//var str1=document.getElementById("selno").value;//str is acc no   and str1 is no of transactions*/

//alert("No of transactions are "+str1);
//alert("Account number is "+str);
string=str;
}
function calc(){

str1= document.getElementById("cal1").value;
str2= document.getElementById("cal2").value;

//alert(str1+"  "+str2);

 if(str1==""||str2==""||str1>=str2){
if(str1>=str2&&str1!=""&&str2!=""){
	alert("Start date cannot be greater than or equal to End date");
	}
	else
	alert("Please select dates");
	}
else
	{
	//alert("Start date cannot be less than End date");
xmlhttp=GetXmlHttpObject();
if (xmlhttp==null)
 {
  alert ("Your browser does not support XMLHTTP!");
  return;
  } 
var url="http://localhost:8080/I-Bank/ajx";
url=url+"?from="+str1+"&to="+str2+"&accnum="+string;
xmlhttp.onreadystatechange=stateChanged;
//  
xmlhttp.open("POST",url,false);
// xmlhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded; Charset=utf-8");
xmlhttp.send(null);
	}
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
  document.getElementById("trans").style.display="none";
  document.getElementById("acc").innerHTML=xmlhttp.responseText;
  }
  
}
</script>
</head>
<BODY BGCOLOR="#EEEEEE">
<form name="testform">
<fmt:setBundle basename="resource"/>
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
<%
rs=st.executeQuery("select * from SYSTEM.USACC where uname='"+ses.getAttribute("uname")+"'"); %>
<div><img src="images1/ibank.jpg" height="100" width="250"></div>	
<label id="lab" style="font-weight:bold;display:none;"><%=ses.getAttribute("dname")%></label>
<%@include file="test.jsp"%>
 <br><br><br>
<span style=" position:absolute; left:150px;font-weight:normal;font-family:'Lucida Grande', 'Lucida Sans Unicode', Tahoma, Arial, san-serif; font-size:15px; color:#000000 !important; line-height:16px; text-transform:none; text-shadow:none;"><fmt:message key='accstmtstoview'/></span>
 <br><br>

<%if(rs!=null){int i=0;%>
<table align='center' border='1px' id='customers' style='margin-bottom:10px;border:1px;border-collapse=collapse'>
<tr><th width="1%"></th><th width="19%"><fmt:message key='A/CNO'/></th><th width="19%"><fmt:message key='A/CTYPE'/></th><th width="19%"><fmt:message key='Branch'/></th><th width="19%"><fmt:message key='availbal'/></th></tr>
<%while(rs.next()){
if(i%2==0){%>
<tr><td align="center"><input type="radio" id="accno" name="rad" value=<%=rs.getString(3)%> onchange="dd(this.value)"></td><td align="center"><%=rs.getString(3) %></td><td align="center"><%=rs.getString(4) %></td><td align="center"><%=rs.getString(6) %></td><td align="center"><%=rs.getString(5) %></td></tr>
<%i++;}else{ %><tr class="alt"><td align="center"><input type="radio" name="rad" id="accno" value=<%=rs.getString(3)%> onchange="dd(this.value)"></td><td align="center"><%=rs.getString(3) %></td><td align="center"><%=rs.getString(4) %></td><td align="center"><%=rs.getString(6) %></td><td align="center"><%=rs.getString(5) %></td></tr>
<%i++;} }}%></table><br><br>
<center>
 <div id="trans" align="center" style="display:none;">
<table align="center"><tr><td width="25%"><label><fmt:message key='FROM'/> </label></td><td width="45%"><input type="text" name="from" id="cal1" size=15 readonly="readonly"></td><td width="10%"><script language="JavaScript">
	new tcal ({
		// form name
		'formname': 'testform',
		// input name
		'controlname': 'from'
	});

	</script></td>
	<br><br><tr>
	<td width="25%"><label><fmt:message key='TO'/> </label></td><td width="45%"><input type="text" name="to" id="cal2" size=15 readonly="readonly"></td><td width="10%"><script language="JavaScript">
	new tcal ({
		// form name
		'formname': 'testform',
		// input name
		'controlname': 'to'
	});

	</script></td></tr></table>
<br>
<input type="button" value="<fmt:message key='Gen'/>" onclick="calc()">
</div><br><br>
<div id="acc" align="center" ></div>
</center>
</BODY>
</html>
   