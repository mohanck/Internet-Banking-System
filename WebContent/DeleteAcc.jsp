<%@ page language="java" contentType="text/html; charset=UTF-8"
    import="java.sql.*,java.io.*,java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri = "http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	  <link rel="SHORTCUT ICON" href="image/icon.ico">
<title>:: Delete Account ::</title>
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
<style type="text/css">
body{
	font-family:arial;
	font-size:10 px;
}

</style>

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

a:link, a:visited, a:active	{ color: #3366CC; text-decoration: none; }

a:hover				{ color: #009900; text-decoration: none; }


</STYLE>

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

function func(){
var rad1=0;var i;
for (i=1; i<=document.getElementsByName("rad").length; i++) { 
if(document.getElementById(i).checked==true) 
      { 
//rad=document.getElementById(i).value;
         rad1=1;
         break;
      } 
} 
if(rad1!=1){
alert("Please Select an account");
return false;
}
else
return true;
}
</script>


</head>
<body BGCOLOR="#EEEEEE">
<%!String s;
ResultSet rs,rs1,rs2;
Statement st,stmt;
Connection con;
ServletContext ctx;
HttpSession ses;

public void jspInit(){
	 try{
ctx=getServletContext();
con=(Connection)ctx.getAttribute("Connection");
st = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
        ResultSet.CONCUR_UPDATABLE);
System.out.println("in jsp init");
 } 
	 catch(Exception e){
		 e.printStackTrace();
	 }
}
%>
<div><img src="images1/ibank.jpg" height="100" width="250"></div>	
 <br><br><br>
<%
int i=0;
//out.println("<script type='text/javascript'>var s=prompt('Enter your Transaction Password');</script>");
rs=st.executeQuery("select * from SYSTEM.USACC"); %>
<span style="position:absolute;left:280px"><a  href="2.jsp" style="font-size: 12 px;">Home</a></span>
 
<span style="position:absolute;left:450px"><a href="createacc.jsp" style="font-size: 15 px;">Create New Accounts</a></span>
  
<span style="position:absolute;left:750px"><a href="Checkbook.jsp" style="font-size: 15 px;">Approve Cheque Book Requests</a></span>
  
<span style="position:absolute;left:1050px"><a href="login.jsp" style="font-size: 15 px;">Logout</a></span>  
   
  <br><br><center>
 <form method="post" onsubmit="return func();">
<%if(rs!=null){
	%>
<table align='center' border='1px' id='customers' style='margin-bottom:10px;border:1px;border-collapse=collapse'>
<tr><th width="1%"><input type="checkbox"  id="chkbx" onclick="Check()"></th><th width="19%">A/C NO</th><th width="19%">A/C TYPE</th><th width="19%">BRANCH</th><th width="19%">AVAILABLE BALANCE(INR)</th></tr>
<%while(rs.next()){
if(i%2==0){%>
<tr><td align="center"><input type="checkbox" name="rad" id=<%=i+1%> value=<%=rs.getString(3)%> ></td><td align="center"><%=rs.getString(3) %></td><td align="center"><%=rs.getString(4) %></td><td align="center"><%=rs.getString(6) %></td><td align="center"><%=rs.getString(5) %></td></tr>
<%i++;}else{ %><tr class="alt"><td align="center"><input type="checkbox" name="rad" id=<%=i+1%> value=<%=rs.getString(3)%>></td><td align="center"><%=rs.getString(3) %></td><td align="center"><%=rs.getString(4) %></td><td align="center"><%=rs.getString(6) %></td><td align="center"><%=rs.getString(5) %></td></tr>
<%i++;} }}%></table><br><br>
<input type="submit" name="del" value="Delete Accounts">
</form>
<%
if(request.getParameter("del")!=null&&request.getParameterValues("rad")!=null)
{
String list[]=request.getParameterValues("rad");

for(i=0;i<list.length;i++){
	System.out.println(list[i]);
	st.execute("delete from SYSTEM.USACC where acno='"+list[i]+"'");
	%>
	<script type="text/javascript">
	alert("Accounts Deleted successfully");
	window.location.href="http://localhost:8080/I-Bank/DeleteAcc.jsp";
	</script>
	<% 
}
%>
<% 
}	
%>
</center>
</body>
</html>