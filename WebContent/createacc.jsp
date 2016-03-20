<%@ page language="java" contentType="text/html; charset=UTF-8"  autoFlush="true" buffer="4096kb"
    import="java.sql.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri = "http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
	  <link rel="SHORTCUT ICON" href="image/icon.ico">
<title>:: Create Account ::</title>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
	
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
	font-size:13 px;
}

</style>


<style type="text/css">

a:link, a:visited, a:active	{ color: #3366CC; text-decoration: none; }

a:hover				{ color: #009900; text-decoration: none; }


</style>

<script type="text/javascript">
var a1=0,a2=0,a3=0,a4=0,a5=0,a6=0,a7=0,a8=0,a9=0,a10=0,a11=0,a12=0,a13=0,a14=0;

var str,str1,str2,str3;

function val(str3)
{
var cid=/^[0-9]{2}$/;
if(!cid.test(str3))
{
document.getElementById("l3").style.display="inline";
document.getElementById("l3").innerHTML="&nbsp;&nbsp; <img src='images/mess_failure.gif' height='15 px'/> Invalid Corporate ID";
a3=-1;
}
else{
document.getElementById("l3").style.display="none";
a3=1;}
}

function chg(str2){
//alert(str2);
if(str2=="Corporate")
document.getElementById("corpid").disabled=false;
else{
document.getElementById("corpid").value="";
document.getElementById("corpid").disabled=true;
a3=0;
}
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
case "Enter Balance":
document.getElementById("acbal").value="";
document.getElementById("acbal").style.color="#000000";
break;
case "Enter Uncleared Balance":
document.getElementById("acubal").value="";
document.getElementById("acubal").style.color="#000000";
break;
case "Enter Account Holder Name":
document.getElementById("hname").value="";
document.getElementById("hname").style.color="#000000";
break;
case "Enter User Name":
document.getElementById("uname").value="";
document.getElementById("uname").style.color="#000000";
break;
case "Enter Branch Name":
document.getElementById("acbr").value="";
document.getElementById("acbr").style.color="#000000";
break;
case "Enter Account Description":
document.getElementById("acdes").value="";
document.getElementById("acdes").style.color="#000000";
break;
case "Enter Account Holder Mobile Number":
document.getElementById("phno").value="";
document.getElementById("phno").style.color="#000000";
break;
case "Enter Account Holder Email":
document.getElementById("em").value="";
document.getElementById("em").style.color="#000000";
break;
case "Enter Account Holder Address":
document.getElementById("addr").value="";
document.getElementById("addr").style.color="#000000";
break;
default:
//alert("in default");
}
}
function cal2(str,str1)     //str1 number is same as label id number
{
var acno=/^[0-9]{14}$/;
var bal=/^[0-9.]+$/;
var achname=/^[a-z|A-Z.]+$/;
var acuname=/^[\w|\d]+$/;
var branch=/^[a-zA-Z0-9]+$/;
var des=/^[\w|\d]+/;
var tpass=/^\S+/;
var actype=/^[a-zA-Z]+$/;
var pno=/^[0-9]{10}$/;
var addr=/^([a-z|A-Z]&[0-9,-])|\d{1}/;
var Email=/^([a-zA-Z0-9_.-])+@(([a-zA-Z0-9-])+)+\.+([a-zA-Z0-9.]{2,4})+$/;
//alert("cal2 "+str);
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

else if(str1==7){
if(!branch.test(str))
{
document.getElementById("acbr").style.color="#A7A7A7";
document.getElementById("acbr").value="Enter Branch Name";
document.getElementById("l7").style.display="inline";
document.getElementById("l7").innerHTML="&nbsp;&nbsp; <img src='images/mess_failure.gif' height='15px'/> Invalid Branch Name";
a7=0;
}
if(branch.test(str)){
document.getElementById("l7").style.display="none";
a7=1;
}
}

else if(str1==8){
if(!bal.test(str))
{
document.getElementById("acbal").style.color="#A7A7A7";
document.getElementById("acbal").value="Enter Balance";
document.getElementById("l8").style.display="inline";
document.getElementById("l8").innerHTML="&nbsp;&nbsp; <img src='images/mess_failure.gif' height='15px'/> Invalid Balance";
a8=0;
}
if(bal.test(str)){
document.getElementById("l8").style.display="none";
a8=1;
 }
}

else if(str1==9){
if(!bal.test(str))
{
document.getElementById("acubal").style.color="#A7A7A7";
document.getElementById("acubal").value="Enter Uncleared Balance";
document.getElementById("l9").style.display="inline";
document.getElementById("l9").innerHTML="&nbsp;&nbsp; <img src='images/mess_failure.gif' height='15 px'/> Invalid Uncleared Balance";
a9=0;
}
if(bal.test(str)){
document.getElementById("l9").style.display="none";
a9=1;
 }
}

else if(str1==4){
if(!achname.test(str))
{
document.getElementById("hname").style.color="#A7A7A7";
document.getElementById("hname").value="Enter Account Holder Name";
document.getElementById("l4").style.display="inline";
document.getElementById("l4").innerHTML="&nbsp;&nbsp; <img src='images/mess_failure.gif' height='15 px'/> Invalid Account Holder Name";
a4=0;
}
if(achname.test(str)){
document.getElementById("l4").style.display="none";
a4=1;
 }
}

else if(str1==5){
if(!acuname.test(str))
{
document.getElementById("uname").style.color="#A7A7A7";
document.getElementById("uname").value="Enter User Name";
document.getElementById("l5").style.display="inline";
document.getElementById("l5").innerHTML="&nbsp;&nbsp; <img src='images/mess_failure.gif' height='15 px'/> Invalid User Name";
a5=0;
}
if(acuname.test(str)){
document.getElementById("l5").style.display="none";
a5=1;
 }
}

else if(str1==10){
if(!des.test(str))
{
document.getElementById("acdes").style.color="#A7A7A7";
document.getElementById("acdes").value="Enter Account Description";
document.getElementById("l10").style.display="inline";
document.getElementById("l10").innerHTML="&nbsp;&nbsp; <img src='images/mess_failure.gif' height='15px'/> Invalid Account Description";
a10=0;
}
if(des.test(str)){
document.getElementById("l10").style.display="none";
a10=1;
 }       
}

else if(str1==13){
if(!Email.test(str))
{
document.getElementById("em").style.color="#A7A7A7";
document.getElementById("em").value="Enter Account Holder Email";
document.getElementById("l13").style.display="inline";
document.getElementById("l13").innerHTML="&nbsp;&nbsp; <img src='images/mess_failure.gif' height='15px'/> Invalid Email";
a12=0;
}
if(Email.test(str)){
document.getElementById("l13").style.display="none";
a12=1;
}
}

else if(str1==12){
if(!pno.test(str))
{
document.getElementById("phno").style.color="#A7A7A7";
document.getElementById("phno").value="Enter Account Holder Mobile Number";
document.getElementById("l12").style.display="inline";
document.getElementById("l12").innerHTML="&nbsp;&nbsp; <img src='images/mess_failure.gif' height='15px'/> Invalid Mobile Number";
a13=0;
}
if(pno.test(str)){
document.getElementById("l12").style.display="none";
a13=1;
}
}

else if(str1==14){
if(!addr.test(str))
{
document.getElementById("addr").style.color="#A7A7A7";
document.getElementById("addr").value="Enter Account Holder Address";
document.getElementById("l14").style.display="inline";
document.getElementById("l14").innerHTML="&nbsp;&nbsp; <img src='images/mess_failure.gif' height='15px'/> Invalid Address";
a14=0;
}
if(addr.test(str)){
document.getElementById("l14").style.display="none";
a14=1;
}
}

//alert("a1 is "+a1+" a2 is "+a2+" a4 is "+a4+" a5 is "+a5+" a7 is "+a7+" a8 is "+a8+" a9 is "+a9+" a10 is "+a10);
}//&& a6==1 && a11==1

function gh()
{
if(a1==1 && a4==1 && a5==1 && a7==1 && a8==1 && a9==1 && a10==1 && a12==1 && a13==1 && a14==1)
{
// alert("a1 is "+a1+"  a3 is "+a3+" a4 is "+a4+" a5 is "+a5+" a7 is "+a7+" a8 is "+a8+" a9 is "+a9+" a10 is "+a10);
   if(document.getElementById("transpwd").value==""){
	alert("Please fill the transaction password");
	return false;
	}
	
	if(document.getElementById("upwd").value==""){
	alert("Please fill the user password");
	return false;
	}
	
	if(document.getElementById("ppwd").value==""){
	alert("Please fill the Profile password");
	return false;
	}
	
	if((a3==0) || (a3==1))
	{
    return true;
	}
	
	else if(a3==-1 || document.getElementById("corpid").disabled==true)
	{
	alert("Please fill the Corporate ID");
	return false;
	}
	
	
	
//	alert("Congratulations,your Account has been Created Succesfully and your PASSWORD has been sent to.");
}
else
	{
	alert("Please fill the details completely");
    return false;
	}
}

</script>

</head>
<body BGCOLOR="#EEEEEE">
<%!String s;
ResultSet rs,rs1,rs2;
Statement st,st1;
Connection con;
ServletContext ctx;
HttpSession ses;
public void jspInit(){
	 try{
ctx=getServletContext();
con=(Connection)ctx.getAttribute("Connection");
st = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
        ResultSet.CONCUR_UPDATABLE);
st1= con.createStatement();
System.out.println("in jsp init 3255646");
 } 
	 catch(Exception e){
		 e.printStackTrace();
	 }
}
%>
<div><img src="images1/ibank.jpg" height="100" width="250"></div>	
 <br><br><br>
  <span style="position:absolute;left:280px"><a href="2.jsp" style="font-size: 15 px;">Home</a></span>
  
   <span style="position:absolute;left:450px"><a  href="DeleteAcc.jsp" style="font-size: 15 px;">Delete Existing Account</a></span>
 
   <span style="position:absolute;left:750px"><a  href="Checkbook.jsp" style="font-size: 15 px;">Approve Cheque Book Requests</a></span>
   
    <span style="position:absolute;left:1050px"><a href="login.jsp" style="font-size: 15 px;">Logout</a></span>
  <br><br>
 <form method="post" onSubmit="return gh();">
  <center>
	 <table id="customers" cellspacing="10" cellpadding="10" align='center' border='1px' id='customers' style='margin-bottom:10px;border:1px;border-collapse=collapse'>
	 <tr><td bgcolor="#6083AD" align="center" width="25%"><font color="#FFFFFF" style="font-family:font-family:Trebuchet MS, Arial, Helvetica, sans-serif;">Account Number </font></td><td align="center" bgcolor="#FFFFFF" width="100%"><input type="text" name="acno" id="acnum" STYLE="color: #A7A7A7; font-family:Comic Sans MS " value="Enter Account Number" onfocus="cal1(this.value)" onblur="cal2(this.value,1)" size="100%"/><label style="display:none;color:#FF3366" id="l1"></label></td></tr>
	 <tr><td bgcolor="#6083AD" align="center" width="25%"><font color="#FFFFFF" style="font-family:font-family:Trebuchet MS, Arial, Helvetica, sans-serif;">Category </font></td><td align="center" bgcolor="#FFFFFF" width="100%"><select name="category" id="cat" style="font-family:Comic Sans MS" onBlur="chg(this.value)"><option value="Personal" Selected="Selected">Personal Banking Account</option><option value="Corporate">Corporate Banking Account</option></select></td></tr>	 
	 <tr><td bgcolor="#6083AD" align="center" width="25%"><font color="#FFFFFF" style="font-family:font-family:Trebuchet MS, Arial, Helvetica, sans-serif;">Profile Password </font></td><td align="center" bgcolor="#FFFFFF" width="100%"><input type="password" id="ppwd" name="ppass" size="100%" STYLE="font-family:Jokerman "/><label style="display:none;color:#FF3366" id="l2"></label></td></tr>
	 <tr><td bgcolor="#6083AD" align="center" width="25%"><font color="#FFFFFF" style="font-family:font-family:Trebuchet MS, Arial, Helvetica, sans-serif;">Corporate ID </font></td><td align="center" bgcolor="#FFFFFF" width="100%"><input type="text" name="cid" id="corpid" size="100%" style="color: #000000; font-family:Comic Sans MS " disabled="disabled" onBlur="val(this.value)"/><label style="display:none;color:#FF3366" id="l3"></label></td></tr>	 
	 <tr><td bgcolor="#6083AD" align="center" width="25%"><font color="#FFFFFF" style="font-family:font-family:Trebuchet MS, Arial, Helvetica, sans-serif;">Account Holder Name </font></td><td align="center" bgcolor="#FFFFFF" width="100%"><input type="text" id="hname" name="achname" size="100%"  STYLE="color: #A7A7A7; font-family:Comic Sans MS " value="Enter Account Holder Name" onfocus="cal1(this.value)" onblur="cal2(this.value,4)" /><label style="display:none;color:#FF3366" id="l4"></label></td></tr>
	 <tr><td bgcolor="#6083AD" align="center" width="25%"><font color="#FFFFFF" style="font-family:font-family:Trebuchet MS, Arial, Helvetica, sans-serif;">User Name </font></td><td align="center" bgcolor="#FFFFFF" width="100%"><input type="text" id="uname" name="acuname" size="100%" STYLE="color: #A7A7A7; font-family:Comic Sans MS " value="Enter User Name" onfocus="cal1(this.value)" onblur="cal2(this.value,5)"/><label style="display:none;color:#FF3366" id="l5"></label></td></tr>
	 <tr><td bgcolor="#6083AD" align="center" width="25%"><font color="#FFFFFF" style="font-family:font-family:Trebuchet MS, Arial, Helvetica, sans-serif;">Transaction Password </font></td><td align="center" bgcolor="#FFFFFF" width="100%"><input type="password" id="transpwd" name="utpass" size="100%" STYLE="color: #000000; font-family:Jokerman"/><label style="display:none;color:#FF3366" id="l6"></label></td></tr>
	 <tr><td bgcolor="#6083AD" align="center" width="25%"><font color="#FFFFFF" style="font-family:font-family:Trebuchet MS, Arial, Helvetica, sans-serif;">User Password </font></td><td align="center" bgcolor="#FFFFFF" width="100%"><input type="password" id="upwd" name="upass" size="100%" STYLE="color: #000000; font-family:Jokerman "/><label style="display:none;color:#FF3366" id="l11"></label></td></tr>	 
	 <tr><td bgcolor="#6083AD" align="center" width="25%"><font color="#FFFFFF" style="font-family:font-family:Trebuchet MS, Arial, Helvetica, sans-serif;">Branch </font></td><td align="center" bgcolor="#FFFFFF" width="100%"><input type="text" id="acbr" name="branch" size="100%" STYLE="color: #A7A7A7; font-family:Comic Sans MS " value="Enter Branch Name" onfocus="cal1(this.value)" onblur="cal2(this.value,7)"/><label style="display:none;color:#FF3366" id="l7"></label></td></tr>
	 <tr><td bgcolor="#6083AD" align="center" width="25%"><font color="#FFFFFF" style="font-family:font-family:Trebuchet MS, Arial, Helvetica, sans-serif;">Balance(INR) </font></td><td align="center" bgcolor="#FFFFFF" width="100%"><input type="text" id="acbal" name="balance" size="100%" STYLE="color: #A7A7A7; font-family:Comic Sans MS " value="Enter Balance" onfocus="cal1(this.value)" onblur="cal2(this.value,8)"/><label style="display:none;color:#FF3366" id="l8"></label></td></tr>	 
	 <tr><td bgcolor="#6083AD" align="center" width="25%"><font color="#FFFFFF" style="font-family:font-family:Trebuchet MS, Arial, Helvetica, sans-serif;">Uncleared Balance(INR) </font></td><td align="center" bgcolor="#FFFFFF" width="100%"><input type="text" id="acubal" name="ubalance" size="100%" STYLE="color: #A7A7A7; font-family:Comic Sans MS " value="Enter Uncleared Balance" onfocus="cal1(this.value)" onblur="cal2(this.value,9)"/><label style="display:none;color:#FF3366" id="l9"></label></td></tr>
	 <tr><td bgcolor="#6083AD" align="center" width="25%"><font color="#FFFFFF" style="font-family:font-family:Trebuchet MS, Arial, Helvetica, sans-serif;">Description </font></td><td align="center" bgcolor="#FFFFFF" width="100%"><input type="text" id="acdes" name="descrip" size="100%" STYLE="color: #A7A7A7; font-family:Comic Sans MS " value="Enter Account Description" onfocus="cal1(this.value)" onblur="cal2(this.value,10)"/><label style="display:none;color:#FF3366" id="l10"></label></td></tr>
     <tr><td bgcolor="#6083AD" align="center" width="25%"><font color="#FFFFFF" style="font-family:font-family:Trebuchet MS, Arial, Helvetica, sans-serif;">Mobile Number </font></td><td align="center" bgcolor="#FFFFFF" width="100%"><input type="text" id="phno" name="pno" size="100%" STYLE="color: #A7A7A7; font-family:Comic Sans MS " value="Enter Account Holder Mobile Number" onfocus="cal1(this.value)" onblur="cal2(this.value,12)"/><label style="display:none;color:#FF3366" id="l12"></label></td></tr>
     <tr><td bgcolor="#6083AD" align="center" width="25%"><font color="#FFFFFF" style="font-family:font-family:Trebuchet MS, Arial, Helvetica, sans-serif;">Email  </font></td><td align="center" bgcolor="#FFFFFF" width="100%"><input type="text" id="em" name="email" size="100%" STYLE="color: #A7A7A7; font-family:Comic Sans MS " value="Enter Account Holder Email" onfocus="cal1(this.value)" onblur="cal2(this.value,13)"/><label style="display:none;color:#FF3366" id="l13"></label></td></tr>
     <tr><td bgcolor="#6083AD" align="center" width="25%"><font color="#FFFFFF" style="font-family:font-family:Trebuchet MS, Arial, Helvetica, sans-serif;">Address </font></td><td align="center" bgcolor="#FFFFFF" width="100%"><input type="text" id="addr" name="add" size="100%" STYLE="color: #A7A7A7; font-family:Comic Sans MS " value="Enter Account Holder Address" onfocus="cal1(this.value)" onblur="cal2(this.value,14)"/><label style="display:none;color:#FF3366" id="l14"></label></td></tr>
	 </table>
	 <br><br>
<input type="submit" value="Create">
</center>
</form>
</body>
</html>
<%
if(request.getParameter("acno")!=null && request.getParameter("category")!=null && request.getParameter("achname")!=null && request.getParameter("acuname")!=null && request.getParameter("utpass")!=null && request.getParameter("branch")!=null && request.getParameter("balance")!=null && request.getParameter("ubalance")!=null && request.getParameter("descrip")!=null && request.getParameter("upass")!=null && request.getParameter("ppass")!=null && request.getParameter("pno")!=null && request.getParameter("email")!=null && request.getParameter("add")!=null)
{
	ses=request.getSession();
	System.out.println("fgffhg");
	rs=st.executeQuery("select * from SYSTEM.USACC where acno='"+request.getParameter("acno")+"'");
	if(rs.next()){%>
	<script type="text/javascript">
alert("Account already exists");
</script>
<%	}
	else{
	if(request.getParameter("descrip").contains("CHQ")){
System.out.println("in if");
st.executeUpdate("insert into SYSTEM.USACC values('"+request.getParameter("acuname")+"','"+request.getParameter("utpass")+"','"+request.getParameter("acno")+"','"+request.getParameter("category")+"',"+Float.valueOf(request.getParameter("balance"))+",'"+request.getParameter("branch")+"','"+request.getParameter("achname")+"','"+request.getParameter("descrip")+"','"+request.getParameter("ubalance")+"','"+request.getParameter("cid")+"','0','"+request.getParameter("upass")+"','"+request.getParameter("ppass")+"')");
rs2=st.executeQuery("select * from SYSTEM.USLIST where uname='"+request.getParameter("acuname")+"'");
if(!rs2.next()){
st1.executeUpdate("insert into SYSTEM.THEME values('"+request.getParameter("acuname")+"','1','en')");
st.executeUpdate("insert into SYSTEM.USLIST values('"+request.getParameter("category")+"','"+request.getParameter("acuname")+"','"+request.getParameter("upass")+"','"+request.getParameter("achname")+"',0,'"+request.getParameter("add")+"','','"+request.getParameter("pno")+"','"+request.getParameter("email")+"',null,null)");
System.out.println("in xml thing 1");
		     String sql = "INSERT INTO SYSTEM.ACC VALUES(?,?)";
             PreparedStatement stmt = con.prepareStatement(sql);
String str="<?xml version=\"1.0\" encoding=\"UTF-16\"?><account>"+"<achname>"+request.getParameter("achname")+" "+"</achname>"+"<acuname>"+request.getParameter("acuname")+" "+"</acuname>"+"<utpass>"+request.getParameter("utpass")+" "+"</utpass>"+"<address>"+request.getParameter("add")+" "+"</address>"+"<pno>"+request.getParameter("pno")+" "+"</pno>"+"<email>"+request.getParameter("email")+" "+"</email>"+"<ppass>"+request.getParameter("ppass")+" "+"</ppass>"+"<dname>"+request.getParameter("achname")+" "+"</dname>"+"</account>";

 stmt.setString(1,request.getParameter("acuname"));
 //stmt.setString(2,request.getParameter("acno"));
 stmt.setString(2,str);
 stmt.execute();
System.out.println("in xml thing 2");
}

	}
	else{
		System.out.println("in else");
st.executeUpdate("insert into SYSTEM.USACC values('"+request.getParameter("acuname")+"','"+request.getParameter("utpass")+"','"+request.getParameter("acno")+"','"+request.getParameter("category")+"',"+Float.valueOf(request.getParameter("balance"))+",'"+request.getParameter("branch")+"','"+request.getParameter("achname")+"','"+request.getParameter("descrip")+"','"+request.getParameter("ubalance")+"','"+request.getParameter("cid")+"','-1','"+request.getParameter("upass")+"','"+request.getParameter("ppass")+"')");
rs2=st.executeQuery("select * from SYSTEM.USLIST where uname='"+request.getParameter("acuname")+"'");
if(!rs2.next()){
st1.executeUpdate("insert into SYSTEM.THEME values('"+request.getParameter("acuname")+"','1','en')");
st.executeUpdate("insert into SYSTEM.USLIST values('"+request.getParameter("category")+"','"+request.getParameter("acuname")+"','"+request.getParameter("upass")+"','"+request.getParameter("achname")+"',0,'"+request.getParameter("add")+"','','"+request.getParameter("pno")+"','"+request.getParameter("email")+"',null,null)");
	System.out.println("in xml thing 1");
		     String sql = "INSERT INTO SYSTEM.ACC VALUES(?,?)";
             PreparedStatement stmt = con.prepareStatement(sql);
String str="<?xml version=\"1.0\" encoding=\"UTF-16\"?><account>"+"<achname>"+request.getParameter("achname")+" "+"</achname>"+"<acuname>"+request.getParameter("acuname")+" "+"</acuname>"+"<utpass>"+request.getParameter("utpass")+" "+"</utpass>"+"<address>"+request.getParameter("add")+" "+"</address>"+"<pno>"+request.getParameter("pno")+" "+"</pno>"+"<email>"+request.getParameter("email")+" "+"</email>"+"<ppass>"+request.getParameter("ppass")+" "+"</ppass>"+"<dname>"+request.getParameter("achname")+" "+"</dname>"+"</account>";
 stmt.setString(1,request.getParameter("acuname"));
 //stmt.setString(2,request.getParameter("acno"));
 stmt.setString(2,str);
 stmt.execute();
System.out.println("in xml thing 2");
}}
System.out.println("in first");
ses.setAttribute("acuname",request.getParameter("acuname"));
ses.setAttribute("acemail",request.getParameter("email"));
ses.setAttribute("achname",request.getParameter("achname"));
System.out.println("in second");
ses.setAttribute("accat",request.getParameter("category"));
ses.setAttribute("acupass",request.getParameter("upass"));
ses.setAttribute("actpass",request.getParameter("utpass"));
ses.setAttribute("acppass",request.getParameter("ppass"));
System.out.println("in thirs");
System.out.println("Rq is "+ses.getAttribute("acppass"));
%>
<script type="text/javascript">
alert("Congratulations!!\r\nAccount Created Successfully");
</script>
<c:redirect url="/MailServlet"></c:redirect>
	<%
	System.out.println("Account Created");
%>

<%}}%>
