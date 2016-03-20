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
			  <title>:: Page 3 ::</title>

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

function setFocus()
{
document.getElementById("amt1").focus();//amt already present in index.jsp
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
<%
	 
	PrintWriter pw=response.getWriter();
String str=request.getParameter("tprecv");
String str1=request.getParameter("tpsen");
	System.out.println("tprecv is "+request.getParameter("tprecv"));
	System.out.println("tpsen is "+request.getParameter("tpsen"));
	ctx.setAttribute("rec",str);
	ctx.setAttribute("sen",str1);

	%>
	<div><img src="images1/ibank.jpg" height="100" width="250"></div>	
	<label id="lab" style="font-weight:bold;display:none;"><%=ses.getAttribute("dname")%></label>
	 <%@include file="test.jsp"%>
	 <br><br><fmt:message key="FROM"/>:
	<%	rs=st.executeQuery("select * from SYSTEM.USACC where acno='"+ctx.getAttribute("sen")+"'"); 
	if(rs!=null){%>
	<table align='center' border='1px' id='customers' style='margin-bottom:10px;border:1px;border-collapse=collapse'>
<tr><th width='19%'><fmt:message key='A/CNO'/></th><th width='19%'><fmt:message key='A/C'/> <fmt:message key='Holder'/></th><th width='19%'><fmt:message key='Branch'/></th><th width='19%'><fmt:message key='availbal'/></th></tr>
	<%while(rs.next()){
		if(rs.getString(3).equals(request.getParameter("tpsen"))){%>
	<tr><td align="center"><%=rs.getString(3) %></td><td align="center"><%=rs.getString(7) %></td><td align="center"><%=rs.getString(6) %></td><td align="center"><%=rs.getString(5) %></td></tr>
	<%}}}%></table><br><br>
	<fmt:message key="TO"/>:
	<%	rs1=st1.executeQuery("select * from SYSTEM.USACC where acno='"+ctx.getAttribute("rec")+"'"); 
	if(rs1!=null){%>
	<table align='center' border='1px' id='customers' style='margin-bottom:10px;border:1px;border-collapse=collapse'>
    <tr><th width='19%'><fmt:message key='A/CNO'/></th><th width='19%'><fmt:message key='A/C'/> <fmt:message key='Holder'/></th><th width='19%'><fmt:message key='Branch'/></th></tr>
	<%while(rs1.next()){
		if(rs1.getString(3).equals(request.getParameter("tprecv"))){%>
	<tr><td align="center"><%=rs1.getString(3) %></td><td align="center"><%=rs1.getString(7) %></td><td align="center"><%=rs1.getString(6) %></td></tr>
	<%}}}%></table>
	
	<form action="Transfer11.jsp" method="post">
	<br><br><center>
	<table align="center"><tr><td width="55%"><label><fmt:message key="Amt"/> </label> </td><td width="50%"><input type="text" id="amt1" name="amount" style="font-family:Comic Sans MS;" size="21"></td></tr><tr></tr><tr></tr>
	<tr><td width="50%"><label><fmt:message key="Tran"/> <fmt:message key="pwd"/> </label></td> <td width="50%"><input type="password" name="tpass" size="21"style="font-family:Jokerman;"></td></tr></table><br>	
	<input type="Submit" value="<fmt:message key='Transfer'/>">
	</center>
	</form>
	
	</body>
	
	</html>