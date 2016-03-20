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
		  th="#6083AD";
	 %><link rel="stylesheet" href="css/styles_blue.css" />
	 <%System.out.println("styles_2.css is preferred in theme.jsp");}if(s.equals("2")){	 
		 th="#CC0066";
	 %><link rel="stylesheet" href="css/styles_green.css" /><%
	 System.out.println("styles_2_1.css is preferred in theme.jsp");}if(s.equals("3")){
		 th="#663366";
			  %><link rel="stylesheet" href="css/styles_brown.css" />
			  <%//System.out.println("styles_blue.css is preferred in Transaction");
			  }}%>
			  <title>:: Profile ::</title>
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

#customers
{
font-family:Trebuchet MS, Arial, Helvetica, sans-serif;
width:45%;
border-collapse:collapse;
}

#customers td
{
font-size:0.9em;
border:1px solid #949599;
padding:6px 14px 4px 14px;
}
</style>
</head>

<body BGCOLOR="#EEEEEE">
<%!String s;String th;
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
st = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
        ResultSet.CONCUR_UPDATABLE);
st1=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
        ResultSet.CONCUR_UPDATABLE);
 } }
	 catch(Exception e){
		 e.printStackTrace();
	 }
}
%>
<%
	ses=request.getSession();
	%>
	<div><img src="images1/ibank.jpg" height="100" width="250"></div>	
	<label id="lab" style="font-weight:bold;display:none;"><%=ses.getAttribute("dname")%></label>
	 <%@include file="test.jsp"%>
	 <% 
	 rs=st.executeQuery("select * from SYSTEM.USACC where uname='"+ses.getAttribute("uname")+"'");
	 rs1=st1.executeQuery("select * from SYSTEM.USLIST where uname='"+ses.getAttribute("uname")+"'");
	 while(rs.next()&& rs1.next()){
		
	 %>
	 <br><br>
	 <center>
	 <span style=" position:absolute; left:150px;font-weight:normal;font-family:'Lucida Grande', 'Lucida Sans Unicode', Tahoma, Arial, san-serif; font-size:14px; color:#000000 !important; line-height:16px; text-transform:none; text-shadow:none;">Welcome <%= ses.getAttribute("dname")%>.Your Profile looks like</span></center>  <span style="position:absolute;right:150px"><a href="http://localhost:8080/I-Bank/edit_profile.jsp">Edit</a></span><br><br>
	 <center>
	 <table id="customers" cellspacing="10" cellpadding="10" align='center' border='1px' id='customers' style='margin-bottom:10px;border:1px;border-collapse=collapse'>
	 <tr><td bgcolor=<%=th %> height="20" align="center" width="35%"><font color="#FFFFFF" style="font-family:font-family:Trebuchet MS, Arial, Helvetica, sans-serif;">User Name </font></td><td align="center" bgcolor="#FFFFFF" width="65%"><%=rs1.getString("UNAME")%></td></tr>
	 <tr><td bgcolor=<%=th %> height="20"align="center" width="35%"><font color="#FFFFFF" style="font-family:font-family:Trebuchet MS, Arial, Helvetica, sans-serif;">Display Name </font></td><td align="center" bgcolor="#FFFFFF" width="65%"><%=rs1.getString("DNAME")%></td></tr>	 
	 <tr><td bgcolor=<%=th %> height="20"align="center" width="35%"><font color="#FFFFFF" style="font-family:font-family:Trebuchet MS, Arial, Helvetica, sans-serif;">First Name </font></td><td align="center" bgcolor="#FFFFFF" width="65%"> <%=rs.getString("NAME")%></td></tr>
	 <tr><td bgcolor=<%=th %> height="20"align="center" width="35%"><font color="#FFFFFF" style="font-family:font-family:Trebuchet MS, Arial, Helvetica, sans-serif;">Last Name </font></td><td align="center" bgcolor="#FFFFFF" width="65%">  <%=rs.getString("NAME")%></td></tr>
	 <tr><td bgcolor=<%=th %> height="20"align="center" width="35%"><font color="#FFFFFF" style="font-family:font-family:Trebuchet MS, Arial, Helvetica, sans-serif;">Phone Number </font></td><td align="center" bgcolor="#FFFFFF" width="65%">  <%=rs.getString("NAME")%></td></tr>	 
	 <tr><td bgcolor=<%=th %> height="20"align="center" width="35%"><font color="#FFFFFF" style="font-family:font-family:Trebuchet MS, Arial, Helvetica, sans-serif;">Password </font></td><td align="center" bgcolor="#FFFFFF" width="45%">  <%=rs1.getString("UPASS")%></td></tr>
	 <tr><td bgcolor=<%=th %> height="20"align="center" width="35%"><font color="#FFFFFF" style="font-family:font-family:Trebuchet MS, Arial, Helvetica, sans-serif;">Transaction Password </font></td><td align="center" bgcolor="#FFFFFF" width="65%">  <%=rs.getString("TPASS")%></td></tr>	 
	 <tr><td bgcolor=<%=th %> height="20"align="center" width="35%"><font color="#FFFFFF" style="font-family:font-family:Trebuchet MS, Arial, Helvetica, sans-serif;">Address </font></td><td align="center" bgcolor="#FFFFFF" width="65%">  <%=rs1.getString("ADDRESS")%></td></tr>
	 </table>
	 </center>
	 <%} %>
	</body>
	
	</html>