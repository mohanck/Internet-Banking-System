<%@ page language="java" contentType="text/html; charset=UTF-8"
    import="java.sql.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri = "http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
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
	 //System.out.println("s in theme is "+s);
	 }}
	  if(s.equals("1")){
	 %><link rel="stylesheet" href="css/styles_blue.css" />
	 <%//System.out.println("styles_2.css is preferred in theme.jsp");
	 }if(s.equals("2")){	  
	 %><link rel="stylesheet" href="css/styles_green.css" /><%
	 //System.out.println("styles_2_1.css is preferred in theme.jsp");
	 }if(s.equals("3")){
			  %><link rel="stylesheet" href="css/styles_brown.css" />
			  <%//System.out.println("styles_blue.css is preferred in Transaction");
			  }}%>
<title>:: Cheque Book Request ::</title>

<script type="text/javascript">
function func(){
var rad1=0;var i;
for (i=1; i<=document.getElementsByName("list").length; i++) { 
if(document.getElementById(i).checked==true) 
      { 
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


%>

<%
//out.println("<script type='text/javascript'>var s=prompt('Enter your Transaction Password');</script>");
rs=st.executeQuery("select * from SYSTEM.USACC where uname='"+ses.getAttribute("uname")+"'"); %>
<div><img src="images1/ibank.jpg" height="100" width="250"></div>	
<label id="lab" style="font-weight:bold;display:none;"><%=ses.getAttribute("dname")%></label>
<%@include file="test.jsp"%> 
<br><br><br>
<span style=" position:absolute; left:150px;font-weight:normal;font-family:'Lucida Grande', 'Lucida Sans Unicode', Tahoma, Arial, san-serif; font-size:15px; color:#000000 !important; line-height:16px; text-transform:none; text-shadow:none;"><fmt:message key='chequebookrequest'/></span>
<br><br>
 <center>
 <form action="#" method="post" onSubmit="return func();">
<%
int i;
ses=request.getSession();
rs=st.executeQuery("select * from SYSTEM.USACC where uname='"+ses.getAttribute("uname")+"' and description LIKE 'IBK-CHQ-%' and reqcheck='0'"); 
i=0;
%>
<table align='center' border='1px' id='customers' style='margin-bottom:10px;border:1px;border-collapse=collapse'>
<tr><th width="1%"></th><th width="6%"><fmt:message key='A/CNO'/></th><th width="6%"><fmt:message key='Branch'/></th></tr>
<% 
while(rs.next())
{
	 if(i%2==0)
        out.println("<tr><td><input type='checkbox' name='list' id='"+(i+1)+"' value="+rs.getString("acno")+"></td><td>"+rs.getString("acno")+"</td><td>"+rs.getString("branch")+"</td></tr>");
	 else
		out.println("<tr class='alt'><td><input type='checkbox' name='list' id="+(i+1)+" value="+rs.getString("acno")+"></td><td>"+rs.getString("acno")+"</td><td>"+rs.getString("branch")+"</td></tr>");
i++;}
%>
</table>
<input type="submit" name="submit" value="<fmt:message key='Req'/>">
</form>
</center>
<%
if(request.getParameter("submit")!=null&&request.getParameterValues("list")!=null)
{
String list[]=request.getParameterValues("list");
for(i=0;i<list.length;i++){
	System.out.println(list[i]);
	stmt.execute("update SYSTEM.USACC set reqcheck='"+1+"' where acno='"+list[i]+"' and uname='"+ses.getAttribute("uname")+"'");
	}%>
	<script type="text/javascript">
	alert("Request sent successfully");
	window.location.href="http://localhost:8080/I-Bank/Userchkbook.jsp";
	</script>
	<% 

%>
<% 
}	
%>
</BODY>
</HTML>