<%@ page language="java" contentType="text/html; charset=UTF-8"
    import="java.sql.*,java.io.*,java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri = "http://java.sun.com/jsp/jstl/fmt"%>
<fmt:setBundle basename="resource"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	  <link rel="SHORTCUT ICON" href="image/icon.ico">
	  <link rel="stylesheet" href="css/styles_blue.css" />
<title>:: Branch Locator ::</title>

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
</STYLE>
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
ResultSet rs,rs1,rs2;
Statement st,st1,st2;
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
st2=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
        ResultSet.CONCUR_UPDATABLE);
 } }
	 catch(Exception e){
		 e.printStackTrace();
	 }
}
%>
<BODY>
 <form action="#" method="post" onsubmit="func();">
<div><img src="images1/ibank.jpg" height="100" width="250"></div><span style="position:absolute;right:100px"><a href="http://localhost:8080/I-Bank">Home</a></span>
 <br>
<hr color="#6083AD" size="2 px">
 <br><br>
 
<div id="nav" style="font-family: Times New Roman">Bank through a widespread network of various iBank Branches making life easy and convenient for you.
User-friendly graphic screens makes Banking with iBank a smoother experience.</div>
<%ses=request.getSession();%>
<br>
<marquee behavior="scroll" scrollamount="8" scrolldelay="150" bgcolor="#6083AD" style="border-color: #EEEEEE;"><img src="image/14868068_New_icons_blue.gif"/> <font color="#EEEEEE" style="font-family: Comic Sans MS;">  New Branches Being Opened on 11th July 2011 in Hyderabad ,Chennai and other major cities  </font> <img src="image/14868068_New_icons_blue.gif"/></marquee>
<br><br>
 <center>
 To view the Branches in particular city select the city and click Locate.<br><br> 
 City: <select name="city">
	<option value="Hyd" selected>Hyderabad</option>
	<option value="Mum">Mumbai</option>
    <option value="Del">Delhi</option>
</select><br><br><br>
<input type="submit" name="sub" value="Locate"></center>
<br><br><br>
<%if(request.getParameter("sub")!=null&&request.getParameter("city")!=null){
	rs=st.executeQuery("select * from SYSTEM.LOC where city='"+request.getParameter("city")+"' and flag='B'");
	int i=0;%>
<table align='center' border='1px' id='customers' style='margin-bottom:10px;border:1px;border-collapse=collapse'> 
<tr><th width="25%">BRANCH</th><th width="45%">PARTICULARS</th><th width="40%">DIRECTION</th></tr>
<%while(rs.next()){
if(i%2==0){%>
<tr><td align="center"><%=rs.getString(1)%></td><td align="center"><%=rs.getString(3)%></td><td align="center"><img src=<%=rs.getString(6)%> style="border: 1 ; border-color: #EEEEEE;" height= "150 px" width= "300 px"  /></td></tr>
<%i++;}else{ %><tr class="alt"><td align="center"><%=rs.getString(1)%></td><td align="center"><%=rs.getString(3)%></td><td align="center"><img src=<%=rs.getString(6)%>  border = "1"  style=" border-color: #EEEEEE" height = "150 px" width = "300 px" /></td></tr>
<%i++;} }}%></table><br><br>
<div id="note" style="visibility:hidden"><center>Note:The marker A shows the position of the branch.</center></div>
</form>
</BODY>
</html>