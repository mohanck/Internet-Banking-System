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
			  <title>:: Stop Cheques ::</title>
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
<SCRIPT type="text/javascript">
    function func(){
    // alert("func called");
  var rad1=0,i,rad2=0;
for (i=1; i<=document.getElementsByName("rad").length; i++) { 
if(document.getElementById(i).checked==true) 
      { 
//rad=document.getElementById(i).value;
         rad1=1;
         break;
      } 
} 
var chk=/^[0-9]{14}$/;
if(chk.test(document.getElementById("chkno").value))
    rad2=1;
else
	rad2=0;
// 	alert("rad1 is "+rad1+"rad2 is "+rad2);
if(rad1!=1) {
alert("Please Select an account");
return false;
}
else if(rad2!=1)
{
alert("Please enter a valid cheque number");
document.getElementById("chkno").value="";
return false;
}
else
return true;
  }
</SCRIPT>

<script type="text/javascript">

function setFocus()
{
document.getElementById("chkno").focus();
}

</script>

<BODY onLoad="setFocus()">
<%
//out.println("<script type='text/javascript'>var s=prompt('Enter your Transaction Password');</script>");
//<jsp:forward page="login.jsp"></jsp:forward>
rs=st.executeQuery("select * from SYSTEM.USACC where uname='"+ses.getAttribute("uname")+"'"); %>
<div><img src="images1/ibank.jpg" height="100" width="250"></div>
<form action="#" onSubmit="return func();">	
<label id="lab" style="font-weight:bold;display:none;"><%=ses.getAttribute("dname")%></label>
 <%@include file="test.jsp"%>
 <br><br><br>
 <span style=" position:absolute; left:150px;font-weight:normal;font-family:'Lucida Grande', 'Lucida Sans Unicode', Tahoma, Arial, san-serif; font-size:15px; color:#000000 !important; line-height:16px; text-transform:none; text-shadow:none;"><fmt:message key='chequetostop'/></span>
 <br><br>
<%if(rs!=null){int i=0;%>
<table align='center' border='1px' id='customers' style='margin-bottom:10px;border:1px;border-collapse=collapse'>
<tr><th width="1%"></th><th width="19%"><fmt:message key="A/CNO"/></th><th width="19%"><fmt:message key="A/CTYPE"/></th><th width="19%"><fmt:message key="Branch"/></th><th width="19%"><fmt:message key="availbal"/></th></tr>
<%while(rs.next()){
if(i%2==0){%>
<tr><td align="center"><input type="radio" name="rad" id =<%=i+1%> value=<%=rs.getString(3)%> ></td><td align="center"><%=rs.getString(3) %></td><td align="center"><%=rs.getString(4) %></td><td align="center"><%=rs.getString(6) %></td><td align="center"><%=rs.getString(5) %></td></tr>
<%i++;}else{ %><tr class="alt"><td align="center"><input type="radio" name="rad" id =<%=i+1%> value=<%=rs.getString(3)%>></td><td align="center"><%=rs.getString(3) %></td><td align="center"><%=rs.getString(4) %></td><td align="center"><%=rs.getString(6) %></td><td align="center"><%=rs.getString(5) %></td></tr>
<%i++;} }}%></table><br><br>
<center>
<label><fmt:message key="chequeno"/></label>
<input type="text" name="chkno" id="chkno"><br><br>
<input type="submit" name="sub" value="<fmt:message key='stopcheque'/>">
</center>
</form>
<%
if(request.getParameter("sub")!=null && request.getParameter("chkno")!="" && request.getParameter("rad")!=null )	
{
rs=st.executeQuery("select * from SYSTEM.CHEQUEBOOK where uname='"+ses.getAttribute("uname")+"' and acno='"+request.getParameter("rad")+"' and chkno='"+request.getParameter("chkno")+"'");
if(rs.next())
	{
       if(rs.getString("status").matches("paid"))
       {
    	   %>
    		 <script type="text/javascript">alert("Payment already made");</script>
    		<%
       }
       else if(rs.getString("status").matches("stop"))
       {
    	   %>
  		 <script type="text/javascript">alert("Cheque already stopped");</script>
  		<%
       }
       else
       {
    	   st1.execute("update SYSTEM.CHEQUEBOOK set status='stop' where uname='"+ses.getAttribute("uname")+"' and acno='"+request.getParameter("rad")+"' and chkno='"+request.getParameter("chkno")+"'");
    	   %>
  		 <script type="text/javascript" >alert("Cheque payment stopped successfully");</script>
  		<%
       }
    }
else{
	%>
	 <script type="text/javascript" >alert("No such Cheque issued");</script>
	<%}
}

%>
</BODY>
</HTML>
