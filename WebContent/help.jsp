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
	 
	  if(rs.next()){
	 s=rs.getString("themeval");
	 System.out.println("s in theme is "+s);
	 }
	  if(s.equals("1")){
	 %><link rel="stylesheet" href="css/styles_blue.css" />
	 <%System.out.println("styles_2.css is preferred in theme.jsp");}if(s.equals("2")){	  
	 %><link rel="stylesheet" href="css/styles_green.css" /><%
	 System.out.println("styles_2_1.css is preferred in theme.jsp");}if(s.equals("3")){
			  %><link rel="stylesheet" href="css/styles_brown.css" />
			  <%//System.out.println("styles_blue.css is preferred in Transaction");
			  }}%><title>:: Help ::</title>
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
<div><img src="images1/ibank.jpg" height="100" width="250"></div>	
	<label id="lab" style="font-weight:bold;display:none;"><%=ses.getAttribute("dname")%></label>
	<%@include file="test.jsp" %>
<%!String s;
ResultSet rs;
Statement st;
Connection con;
ServletContext ctx;
HttpSession ses;
public void jspInit(){
	 try{
ctx=getServletContext();
con=(Connection)ctx.getAttribute("Connection");
st = con.createStatement();
 } 
	 catch(Exception e){
		 e.printStackTrace();
	 }
}
%>

<div id="Login" style="visibility:hidden">
If you click Login button without entering his Username and Password , a message is displayed saying that Entered Username/Password is wrong.
<img src="photos/user_1.jpg" width="1100" height="600" border="0" alt=""/>
<br><br>
If you click on the Login button  entering correct Username and incorrect Password ,<br> a message is displayed saying that Entered Username/Password is wrong . <br>Your Account may get Locked
<img src="photos/user_2.jpg" width="1100" height="600" border="0" alt=""/>
<br><br>
If you click on the Login button  entering Correct Username and Incorrect Password 3 times in succession,<br>your Account gets Locked and  a message is displayed saying that Your Account is Locked. <br>To unlock the account, Contact nearest I-Bank branch.
<img src="photos/user_3.jpg" width="1100" height="600" border="0" alt=""/>
<br><br>
</div>
<div id="Accounts" style="visibility:hidden">
On Selecting a desired Account, you can view the Account Details such as Account Number, Name of Account Holder, Description etc.
<img src="photos/accs_1.jpg" width="1100" height="600" border="0" alt=""/>
<br><br>
</div>
<div id="FundsTransfer" style="visibility:hidden">
<br><br>
In the Funds Transfer page,select the account from which you want to transfer funds and the Account to which you want to transfer funds.
<img src="photos/ft_1.jpg" width="1100" height="600" border="0" alt=""/>
<br><br>
You enter amount and correct transaction password before u click on transfer,To transfer amount. 
<img src="photos/ft_2.jpg" width="1100" height="600" border="0" alt=""/>
<br><br>
If the transaction password is correct and minimum balance is maintained the amount is transferred and a message is displayed to you that the transfer is successful . 
<img src="photos/ft_3.jpg" width="1100" height="600" border="0" alt=""/>
<br><br>
</div>
<div id="ThirdPartyFundsTransfer" style="visibility:hidden">
In adding of a third party account if u enter an account number which is not a third party account an alert is displayed requesting to select Third Party account. 
<img src="photos/tpft_1.jpg" width="1100" height="600" border="0" alt=""/>
<br><br>
The accounts which are added to the list  are displayed under Accounts List.
<img src="photos/tpft_2.jpg" width="1100" height="600" border="0" alt=""/>
<br><br>
After selecting accounts and on clicking next you should enter amount and correct transaction password before you click on transfer.
to transfer amount. 
<img src="photos/tpft_3.jpg" width="1100" height="600" border="0" alt=""/>
<br><br>
If the transaction password is correct and minimum balance is maintained the amount is transferred and a message is displayed to you that the transfer is successful . 
<img src="photos/tpft_4.jpg" width="1100" height="600" border="0" alt=""/>
<br><br>
</div>
<div id="ViewTransactions" style="visibility:hidden">
After entering View Transactions page select an account and select number of transactions you want to view and click on View Transactions. 
<img src="photos/trans_1.jpg" width="1100" height="600" border="0" alt=""/>
<br><br>
After clicking on Show Transactions ,Transactions are displayed and you can take a report of this either in pdf format or view as html by selecting Report Format and clicking on Take a Report.
<img src="photos/trans_2.jpg" width="1100" height="600" border="0" alt=""/>
<br><br>
</div>
<div id="ChkBookReq" style="visibility:hidden">
After clicking on Request an alert is displayed to notify user that the request  sent  successfully.
<img src="photos/chkbookreq.jpg"width="1100" height="600" border="0" alt=""/>
<br><br>
</div>
<div id="Profile" style="visibility:hidden">
In Profile page you can see your profile ,to edit the profile click on edit.
<img src="photos/profile_1.jpg" width="1100" height="600" border="0" alt=""/>
<br><br>
After you click on edit you can edit the profile and click on Update to Update Profile.
<img src="photos/profile_2.jpg" width="1100" height="600" border="0" alt=""/>
<br><br>
</div>

<div id="Statements" style="visibility:hidden">
After selecting dates and clicking on Generate , if there are statements in that range the statements are displayed and a print option is given to take a print out of this.
<img src="photos/stmt_1.jpg" width="1100" height="600" border="0" alt=""/>
<br><br>
In print dialog box select the type of print option and click on print to take print out.
<img src="photos/stmt_2.jpg" width="1100" height="600" border="0" alt=""/>
<br><br>
</div>
<div id="StopCheques" style="visibility:hidden">
In Stop Cheques page select an account,enter Cheque number and click on Stop Cheque to stop payment .
<img src="photos/stopcheque_1.jpg" width="1100" height="600" border="0" alt=""/>
</div>
<div id="OServices" style="visibility:hidden">
In Stop Cheques page select an account,enter Cheque number and click on Stop Cheque to stop payment .
<img src="photos/stopcheque_1.jpg" width="1100" height="600" border="0" alt=""/>
</div>
<%if(request.getParameter("q")!=null){
	int  i= Integer.parseInt(request.getParameter("q"));
	out.println("i is "+i);
switch(i)
	{
	case 1:
		out.println("<script type='text/javascript'>document.getElementById('Login').style.visibility='visible'</script>");
	break;
		case 2:
			out.println("<script type='text/javascript'>document.getElementById('Login').style.visibility='visible'</script>");
	break;
		case 13:
			out.println("<script type='text/javascript'>document.getElementById('Login').style.visibility='visible'</script>");
	break;
		case 4:
			out.println("<script type='text/javascript'>document.getElementById('Login').style.visibility='visible'</script>");
	break;
		case 5:
			out.println("<script type='text/javascript'>document.getElementById('Login').style.visibility='visible'</script>");
	break;
		case 6:
			out.println("<script type='text/javascript'>document.getElementById('Login').style.visibility='visible'</script>");
	break;
		case 7:
			out.println("<script type='text/javascript'>document.getElementById('Login').style.visibility='visible'</script>");
	break;
		case 8:
			out.println("<script type='text/javascript'>document.getElementById('Login').style.visibility='visible'</script>");
	break;
		case 9:
			out.println("<script type='text/javascript'>document.getElementById('Login').style.visibility='visible'</script>");
	break;
		case 10:
			out.println("<script type='text/javascript'>document.getElementById('Login').style.visibility='visible'</script>");
	break;
	}
}
%>

</body></html>