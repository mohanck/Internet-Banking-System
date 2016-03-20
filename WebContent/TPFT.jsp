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
<title>:: Third Party Funds Transfer ::</title>
<!--
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
</style>
-->
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
var a1=0;

function func(){
if(a1==0)
return false;
else
return true;
}

function cal1(str)
{
//document.getElementById("op").style.display="none";
//alert("cal1 "+str);
switch(str){
case "Enter Account Number":
document.getElementById("acnum").value="";
document.getElementById("acnum").style.color="#000000";
break;
default:
}
}
function cal2(str,str1)     //str1 number is same as label id number
{
var acno=/^[0-9]{14}$/;
if(str1==1){
if(!acno.test(str))
{
document.getElementById("acnum").style.color="#A7A7A7";
document.getElementById("acnum").value="Enter Account Number";
document.getElementById("l1").style.display="inline";
document.getElementById("l1").innerHTML="&nbsp;&nbsp; <img src='images/mess_failure.gif' height='15 px'/> Invalid Account Number";
a1=0;
}
if(acno.test(str)){
document.getElementById("l1").style.display="none";
a1=1;
}}
}

</script>

</head>

<body BGCOLOR="#EEEEEE">
<%!String s; 
String str,arr;
ResultSet rs,rs1,rs2,rs3;
Statement st,st1,st2;
Connection con;
ServletContext ctx;
HttpSession ses;
public void jspInit(){
	 try{
ctx=getServletContext();
{
con=(Connection)ctx.getAttribute("Connection");
st = con.createStatement( ResultSet.TYPE_SCROLL_INSENSITIVE,
        ResultSet.CONCUR_UPDATABLE);
st1 = con.createStatement( ResultSet.TYPE_SCROLL_INSENSITIVE,
        ResultSet.CONCUR_UPDATABLE);
st2 = con.createStatement( ResultSet.TYPE_SCROLL_INSENSITIVE,
        ResultSet.CONCUR_UPDATABLE);
 } }
	 catch(Exception e){
		 e.printStackTrace();
	 }
}
%>
<%	
	PrintWriter pw=response.getWriter();
    String str=request.getParameter("aclist");
	System.out.println(request.getParameter("aclist"));
	ctx.setAttribute("newac",str);
	%>
	<div><img src="images1/ibank.jpg" height="100" width="250"></div>	
	<label id="lab" style="font-weight:bold;display:none;"><%=ses.getAttribute("dname")%></label>
	 <%@include file="test.jsp"%>
	 <br><br><br>
	 <form action="#" onsubmit="return func();">
	 <center>
	<fmt:message key="A/CNO"/>  <input type="text" name="aclist" id="acnum" STYLE="color: #A7A7A7; font-family:Comic Sans MS " value="Enter Account Number" onfocus="cal1(this.value)" onblur="cal2(this.value,1)" size="24%"/><label style="display:none;color:#FF3366" id="l1"></label><br><br>
	<input type="Submit" value="Add">
	</center>
	</form>
	</body>	
	</html>
	<%
	if(request.getParameter("aclist")!=null){
	rs=st.executeQuery("select * from SYSTEM.USACC where uname='"+ses.getAttribute("uname")+"' and acno='"+ctx.getAttribute("newac")+"'"); 
	if(rs.next()){
	System.out.println("in if");%>
	<script type="text/javascript">
	alert("Please select third party");  
	</script>
	<%}
	else{		
		System.out.println("in else");
		try{
		rs2=st2.executeQuery("select * from SYSTEM.ACCLIST where uname='"+ses.getAttribute("uname")+"'");
		System.out.println("rs2 is "+rs2);
		if(rs2!=null)
			{					
				while(rs2.next())
				{
					arr=rs2.getString(2);
				}
				System.out.println("arr is "+arr);
			if(arr!=null){
			
		 String div[]=arr.split(",");
		 System.out.println("Div is");
		 for(int i=0;i<div.length;i++){
			 System.out.println(div[i]);
		 if(div[i].equals(ctx.getAttribute("newac"))){
		 %>
	<script type="text/javascript">
	alert("Account already exists in List");  
	</script>
				 
	<% return;}}
		}}}
		catch(Exception e){
			e.printStackTrace();
		}
		System.out.println("CTX IS  "+ctx.getAttribute("newac"));
	rs3=st2.executeQuery("select * from SYSTEM.USACC where acno='"+ctx.getAttribute("newac")+"'");
	if(!rs3.next()){%>
	<script type="text/javascript">
	alert("Account does not exist");  
	</script>
		<%
	}else{
		rs1=st1.executeQuery("select * from SYSTEM.ACCLIST where uname='"+ses.getAttribute("uname")+"'");
		System.out.println("rs1 is "+rs1);
		if(rs1.next()){
			st1.execute("update SYSTEM.ACCLIST set ACNO = ACNO || '"+request.getParameter("aclist")+"' || ','");
		}
		else{
			System.out.println("in else");
		st1.executeUpdate("insert into SYSTEM.ACCLIST values('"+ses.getAttribute("uname")+"','"+request.getParameter("aclist")+','+"')");
		System.out.println("Inserted");}%>
	<script type="text/javascript">
	alert("Congratulations!!\r\nAccount added to List");  
	</script>
	<%}}}
	
	
	if(request.getParameter("rad")!=null && request.getParameter("tpa")!=null){
	
	System.out.println("rad and tpa");
	}
	%>
	