<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.sql.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri = "http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<link rel="SHORTCUT ICON" href="image/icon.ico">
<link rel="stylesheet" href="css/styles_blue.css" />
<title>:: EMI Calculator ::</title>
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

<script type="text/javascript">
function gh(){
var amount=0,tenor=0,intrest=0;
var num=/^[0-9.]+$/;
if (num.test(document.getElementById("amt").value)){
document.getElementById("l1").style.display="none";
amount=1;
}
else{
amount=0;
document.getElementById("l1").style.display="block";
document.getElementById("l1").innerHTML="<img src='images/mess_failure.gif' height='15 px'/> Invalid Amount";
// alert("Invalid Email ID");
}

if(num.test(document.getElementById("ten").value)){
tenor=1;
document.getElementById("l2").style.display="none";
}
else{
tenor=0;
document.getElementById("l2").style.display="block";
document.getElementById("l2").innerHTML="<img src='images/mess_failure.gif' height='15 px'/> Invalid Tenor";
// alert("Invalid Mobile Number");
}

if(num.test(document.getElementById("intrest").value)){
intrest=1;
document.getElementById("l3").style.display="none";
}
else{
intrest=0;
document.getElementById("l3").style.display="block";
document.getElementById("l3").innerHTML="<img src='images/mess_failure.gif' height='15 px'/> Invalid Interest Rate";
// alert("Invalid Display Name");
}

if(amount==1 && tenor==1 && intrest==1)
{
// alert("if");
return true;
}
else
	{
// 	alert("else");
    return false;
	}
}

</script>


<style type="text/css">
body {
	font-family: arial;
	font-size: 15 px;
}
</style>
<body BGCOLOR="#EEEEEE">
<%!
ResultSet rs,rs1,rs2;
Statement st;
Connection con;
ServletContext ctx;
HttpSession ses;
double amt,ten,interest,emi,d0,d1,d2;
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
<br>
<br>
<span style="position:absolute;right:100px"><a href="http://localhost:8080/I-Bank">Home</a></span>
<br>
<hr color="#6083AD" size="2 px">
<br>
<center>
<form action="#" method="post" onSubmit="return gh();">
<br><br>
<b>Please calculate your EMI by entering Loan amount,Tenor and Interest rate and pressing Calculate.</b>
<br><br>
<TABLE>
	<TR>
		<TD width="65%">Please Enter the Loan Amount</TD>
		<TD width="35%"><INPUT TYPE="text" id="amt"
			style="font-family: Comic Sans MS;" name="amount"><label style="display:none;color:#FF3366" id="l1"></TD>
	</TR>
	<TR>
		<TD width="65%">Please Enter the Tenor (in months)</TD>
		<TD width="35%"><INPUT TYPE="text" id="ten"
			style="font-family: Comic Sans MS;" name="tenor"><label style="display:none;color:#FF3366" id="l2"></TD>
	</TR>
	<TR>
		<TD width="65%">Please Enter the Interest Rate</TD>
		<TD width="35%"><INPUT TYPE="text" id="intrest"
			style="font-family: Comic Sans MS;" name="interest"><label style="display:none;color:#FF3366" id="l3"></TD>
	</TR>
</TABLE>
<br>
<br>
<input type="submit" value="Calculate" ></form>

<%
if(request.getParameter("amount")!=null  && request.getParameter("tenor")!=null && request.getParameter("interest")!=null){

	String s=request.getParameter("amount");
	String s1=request.getParameter("tenor");
	String s2=request.getParameter("interest");
	amt=Double.valueOf(request.getParameter("amount"));
	
	ten=Double.valueOf(request.getParameter("tenor"));
		
	interest=Double.valueOf(request.getParameter("interest"));
		
	interest=interest/1200.0;
	
	d0=interest+1.0;

	d1=Math.pow(d0,ten);
	
	d2=d1-1.0;
	
	emi=((amt*interest*d1)/(d2));   
	
	out.println("<script type='text/javascript'>alert('Loan Amount : Rs."+s+"\\n Tenor : "+s1+" \\n Interest : "+s2+"\\n Equated monthly Installment : Rs. "+emi+"\\n');</script>");
	String ls=System.getProperty("line.separator");
	out.println("Loan Amount : Rs."+s);
	out.println("Tenor : "+s1+" months");
	out.println("Interest : "+s2+" %");
	out.println("Equated monthly Installment is Rs. "+emi);
	
}%>
</center>
</body>
</html>