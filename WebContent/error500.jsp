<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"><%@page
	language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri = "http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<title>ERROR:500</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
body{
background-color:#EEEEEE;
color:Black;
}
a:link {text-decoration: none;}
a:visited {text-decoration: none;}
a:active {text-decoration: none;}
a:hover {text-decoration: underline; color: red;}
</style>
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
<body>
<img style="display:inline;" src="images1/ibank.jpg" height="150" width="150"/><span style="font-size:25;height:10;padding:5;padding-top:5px;color:black;width:550px;margin-top:-53;display:inline;background-color:#FFFFFF);"> <b>Error: Internal Server Error </b></span>
<hr style="width:90%;" />
<h4>Our server has encountered an unexpected condition which prevented it from fulfilling the request.
<br/>Sorry for the inconvenience. 
<br/><br/>
<%StringBuffer s=request.getRequestURL(); %>
<!--Go back and try again.&nbsp;<a href=<%= s%> style="text-decoration:none;">Go Back</a>-->
</h4>
</body>
</html>