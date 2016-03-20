<%@ page language="java" contentType="text/html; charset=UTF-8"
    import="java.sql.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri = "http://java.sun.com/jsp/jstl/fmt"%>
<fmt:setBundle basename="resource"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	  <link rel="SHORTCUT ICON" href="image/icon.ico">
<title>:: Cheque Book Request ::</title>
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
font-family:"Trebuchet MS", Arial, Helvetica, sans-serif;
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
  for (a=1;a<=document.getElementsByName("list").length;a++)
  {
    document.getElementById(a).checked=true;
  }}
  else{
var a=1;
  for (a=1;a<=document.getElementsByName("list").length;a++)
  {
    document.getElementById(a).checked=false;
  }
  }
  
}


function func(){
var rad1=0;var i;
for (i=1; i<=document.getElementsByName("list").length; i++) { 
if(document.getElementById(i).checked==true) 
      { 
//rad=document.getElementById(i).value;
         rad1=1;
         break;
      } 
} 
if(rad1!=1){
alert("Please Select an Account");
return false;
}
else
return true;
}
</script>



</head>
<body BGCOLOR="#EEEEEE">
<%!String s;
ResultSet rs;
Statement st,stmt;
Connection con;
ServletContext ctx;
HttpSession ses;
public void jspInit(){
	 try{
ctx=getServletContext();
con=(Connection)ctx.getAttribute("Connection");
st = con.createStatement();
stmt = con.createStatement();
 } 
	 catch(Exception e){
		 e.printStackTrace();
	 }
}


%><div><img src="images1/ibank.jpg" height="100" width="250"></div>	
  <br><br><br>
  
  <span style="position:absolute;left:100px"><a href="2.jsp" style="font-size: 15 px;">Home</a></span>
  
  <span style="position:absolute;left:280px"><a href="unlockacc.jsp" style="font-size: 15 px;">Unlock Accounts</a></span>
   
  <span style="position:absolute;left:450px"><a href="createacc.jsp" style="font-size: 15 px;">Create New Accounts</a></span>
  
  <span style="position:absolute;left:750px"><a href="DeleteAcc.jsp" style="font-size: 15 px;">Delete Existing Account</a></span>
  
   <span style="position:absolute;left:1050px"><a href="login.jsp" style="font-size: 15 px;">Logout</a></span>  
   
  <br><br>

<%
//out.println("<script type='text/javascript'>var s=prompt('Enter your Transaction Password');</script>");

ses=request.getSession();
rs=st.executeQuery("select * from SYSTEM.USACC where uname='"+ses.getAttribute("uname")+"'"); %>
 <br><br>
 <center>
 <form action="#" method="post" onsubmit="return func();">
 <%
int i;
rs=st.executeQuery("select * from SYSTEM.USACC where reqcheck='"+1+"'"); 
i=0;
%>
<table align='center' border='1px' id='customers' style='margin-bottom:10px;border:1px;border-collapse=collapse'>
<tr><th width="1%"><input type="checkbox"  id="chkbx" onclick="Check()"></th><th width="6%">A/C Holder</th><th width="6%">A/C NO</th></tr>

<%
while(rs.next())
{
 if(i%2==0)
      out.println("<tr><td><input type='checkbox' name='list' id="+(i+1)+" value="+rs.getString("acno")+"></td><td>"+rs.getString("name")+"</td><td>"+rs.getString("acno")+"</td></tr>");
 else
	  out.println("<tr class='alt'><td><input type='checkbox' name='list' id="+(i+1)+" value="+rs.getString("acno")+"></td><td>"+rs.getString("name")+"</td><td>"+rs.getString("acno")+"</td></tr>");
 i++;
}
//else{
	//out.println("<br><span style='position:absolute;left:500px;font-weight:normal;font-family:Lucida Grande,Lucida Sans Unicode,Comic Sans MS; font-size:15px; color:red !important; line-height:16px; text-transform:none; text-shadow:none;'>Sorry!! No further requests can be made</span><br><br>");
//}
%>
</table>
<input type="submit" name="submit" value="Approve">
</form>
</center>
<%
if(request.getParameter("submit")!=null&&request.getParameterValues("list")!=null)
{
String list[]=request.getParameterValues("list");

for(i=0;i<list.length;i++){
	System.out.println(list[i]);
	stmt.execute("update SYSTEM.USACC set reqcheck='"+0+"' where acno='"+list[i]+"'");
	%>
	<script type="text/javascript">
	alert("Requests Approved successfully");
	window.location.href="http://localhost:8080/I-Bank/Checkbook.jsp";
	</script>
	<% 
}
%>
<% 
}	
%>
</BODY>
</HTML>