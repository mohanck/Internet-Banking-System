<%@ page language="java" contentType="text/html; charset=UTF-8"
    import="java.sql.*"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri = "http://java.sun.com/jsp/jstl/fmt"%>
 <%
	  ses=request.getSession();
	  if(ses.getAttribute("uname")==null)
				response.sendRedirect("/I-Bank/login.jsp?s=invalid");
	  else{
	  System.out.println("ses is "+ses.getAttribute("uname"));
	  rs=st.executeQuery("select * from SYSTEM.THEME where uname='"+ses.getAttribute("uname")+"'");
	  if(rs.next()){
	 s=rs.getString("themeval");
	 ses.setAttribute("lang",rs.getString("lang"));
	 System.out.println("s in theme is "+s);
	 
	  if(s.equals("1")){
	 %><link rel="stylesheet" href="css/styles_blue.css" />
	 <%System.out.println("styles_2.css is preferred in theme.jsp");}if(s.equals("2")){	  
	 %><link rel="stylesheet" href="css/styles_green.css" /><%
	 System.out.println("styles_2_1.css is preferred in theme.jsp");}if(s.equals("3")){
			  %><link rel="stylesheet" href="css/styles_brown.css" />
			  <%//System.out.println("styles_blue.css is preferred in Transaction");
			  }
	  }
    System.out.println(ses.getAttribute("lang"));
    if(ses.getAttribute("lang").equals("hi")){
    System.out.println("in if"+ses.getAttribute("lang"));%>
        <fmt:setLocale value="hi" scope="session"/>
        <%} else{
         System.out.println("in else"+ses.getAttribute("lang"));%>
        <fmt:setLocale value="en" scope="session"/>
         <%} }%>
<fmt:setBundle basename="resource"/>
<%@page import="java.util.StringTokenizer"%>
<html>
<head>
	  <link rel="SHORTCUT ICON" href="image/icon.ico">
<title>:: Accounts ::</title>
<style type="text/css">

</STYLE>
<script type="text/javascript">
var hid=1;
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
<%!
ResultSet rs,rs1,rs2;
Statement st,st1,st2;
Connection con;
ServletContext ctx;
HttpSession ses;
String s;
int k;
public void jspInit(){
	 try{
ctx=getServletContext();
{
con=(Connection)ctx.getAttribute("Connection");
st = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
        ResultSet.CONCUR_UPDATABLE);
st1=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
        ResultSet.CONCUR_UPDATABLE);
st2=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
        ResultSet.CONCUR_UPDATABLE);
 } }
	 catch(Exception e){
		 e.printStackTrace();
	 }
}
%>

<script type="text/javascript">
function accsel(str)
{
	// alert("in func");
xmlhttp=GetXmlHttpObject();
if (xmlhttp==null)
  {
  alert ("Your browser does not support XMLHTTP!");
  return;
  } 
document.getElementById("show").innerHTML="";
var url="http://localhost:8080/I-Bank/ajx";
url=url+"?q="+str;
xmlhttp.onreadystatechange=stateChanged;
xmlhttp.open("GET",url,false);
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
  // hid=0;
   document.getElementById("show").innerHTML=xmlhttp.responseText;
  }
  
}

</script>

<BODY>
<%
//out.println("<script type='text/javascript'>var s=prompt('Enter your Transaction Password');</script>");
//<jsp:forward page="login.jsp"></jsp:forward>
rs=st.executeQuery("select * from SYSTEM.USACC where uname='"+ses.getAttribute("uname")+"'"); %>
<div><img src="images1/ibank.jpg" height="100" width="250"></div>	
<label id="lab" style="font-weight:bold;display:none;"><%=ses.getAttribute("dname")%></label>
<%@include file="test.jsp"%>
 <br>
 
 
 <%
 String month[]={"January","Febraury","March","April","May","June","July","August","September","October","November","December"};
 rs1=st1.executeQuery("select * from SYSTEM.USLIST where uname='"+ses.getAttribute("uname")+"'");
 if(rs1.next()){
 if(rs1.getString("suc")!=null)
 {
	 StringTokenizer st=new StringTokenizer(rs1.getString("suc"),"-");
	 String s[]=new String[3];
	 int y=0;
	 while(st.hasMoreTokens())
	 {
		  s[y]=st.nextToken();
		  y++;
	 }
	 int a=Integer.parseInt(s[1]);
	 String h=month[a-1];
     out.println("<div align=right>Last Successful Login : <b>"+s[2]+" "+h+" "+s[0]+"</b></div>");
 }
 if(rs1.getString("unsuc")!=null)
 {
	 StringTokenizer st=new StringTokenizer(rs1.getString("unsuc"),"-");
	 String s[]=new String[3];
	 int y=0;
	 while(st.hasMoreTokens())
	 {
		  s[y]=st.nextToken();
		  y++;
	 }
	 int a=Integer.parseInt(s[1]);
	 String h=month[a-1];
	 out.println("<div align=right>Last Unsuccessful Login : <b>"+s[2]+" "+h+" "+s[0]+"</b></div>");
 }
 }
 java.util.Date today = new java.util.Date();
java.sql.Date sqlToday = new java.sql.Date(today.getTime());
st2.execute("update SYSTEM.USLIST set suc='"+sqlToday+"' where uname ='"+ses.getAttribute("uname")+"'");%>  
 <br>
<%if(rs!=null){int i=0;%>
<table align='center' border='1px' id='customers' style='margin-bottom:10px;border:1px;border-collapse=collapse'>
<tr><th width="1%"></th><th width="19%"><fmt:message key="A/CNO"/></th><th width="19%"><fmt:message key="A/CTYPE"/></th><th width="19%"><fmt:message key="Branch"/></th><th width="19%"><fmt:message key="availbal"/></th></tr>
<%while(rs.next()){
if(i%2==0){%>
<tr><td align="center"><input type="radio" name="rad" value=<%=rs.getString(3)%> onchange="accsel(this.value)"></td><td align="center"><%=rs.getString(3) %></td><td align="center"><%=rs.getString(4) %></td><td align="center"><%=rs.getString(6) %></td><td align="center"><%=rs.getString(5) %></td></tr>
<%i++;}else{ %><tr class="alt"><td align="center"><input type="radio" name="rad" value=<%=rs.getString(3)%> onchange="accsel(this.value)"></td><td align="center"><%=rs.getString(3) %></td><td align="center"><%=rs.getString(4) %></td><td align="center"><%=rs.getString(6) %></td><td align="center"><%=rs.getString(5) %></td></tr>
<%i++;} }}%></table><br><br>

<div id="show" width="40%" align="center">
<hr align="left" style="position:absolute;left:16%;top:96%;"/>
<span style="position:absolute; left:36%;  top:96%;">View I-Bank in</span>
<span style="position:absolute;left:46.5%; top:96%;"><a href="http://localhost:8080/I-Bank/ajx?lang=en">English</a></span>
<span style="position:absolute;left:52.5%; top:96%;"><a href="http://localhost:8080/I-Bank/ajx?lang=hi">Hindi</a></span> 
</div>
<!--<div width="40%" id="acc" align="center"></div><br>
--></BODY>
</HTML>