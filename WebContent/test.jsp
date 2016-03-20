<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri = "http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title></title>
</head>
<body>
<fmt:setBundle basename="resource"/>
<fmt:message key="Accs" var="accs"/>
<fmt:message key="Tran" var="tran"/>
<fmt:message key="FT" var="ft"/>
<fmt:message key="Viewtrans" var="Viewtrans"/>
<fmt:message key="Profile" var="profile"/>
<fmt:message key="Stmts" var="stmts"/>
<fmt:message key="Welcome" var="wel"/>
<fmt:message key="Logout" var="log"/>
<fmt:message key="cpwd" var="cp"/>
<fmt:message key="Thirdpt" var="Thirdpt"/>
<fmt:message key="cbookreq" var="cbookreq"/>
<fmt:message key="Ctheme" var="theme"/>
<fmt:message key="stopcheques" var="stopchqs"/>
<script type="text/javascript">
IEMhover = function() {
	var IEMh = document.getElementById("menunav").getElementsByTagName("LI");
	for (var i=0; i<IEMh.length; i++) {
		IEMh[i].onmouseover=function() {
			this.className+=" IEMhover";
		}
		IEMh[i].onmouseout=function() {
			this.className=this.className.replace(new RegExp(" IEMhover\\b"), "");
		}
	}
}
if (window.attachEvent) window.attachEvent("onload", IEMhover);

var color		= "666666"	// HEADER BACKGROUND COLOR (EDIT IN THE css FILE)
var flashheight		= "50"		// HEIGHT OF THE FLASH (IN PIXELS)
var flashwidth		= "750"		// WIDTH OF THE FLASH (IN PIXELS)

var showdate		= "yes"		// SHOW THE DATE ON THE PAGE
var stripes	 	= "yes"		// SHOW STRIPE UNDER THE FLASH

// START DATE SCRIPT
   if (showdate == "yes") {
document.write('<div id="date-location" class="printhide">');
var d=new Date();
document.write("<span class=\"date-font\"><nobr>"+"<a href='logout.jsp'>${log}</a>"+"&nbsp;&nbsp;&nbsp;&nbsp;");
document.write("&nbsp;&nbsp;"+"<a href='password.jsp'>${cp}</a>"+"&nbsp;&nbsp;&nbsp;&nbsp;");
document.write("&nbsp;&nbsp;"+"<a href='theme.jsp'>${theme}</a>"+"&nbsp;&nbsp;&nbsp;&nbsp;");
var weekday=new Array("Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday");
var monthname=new Array("January","February","March","April","May","June","July","August","September","October","November","December");
document.write("<span class=\"date-font\"><nobr>" + weekday[d.getDay()] + " ");
document.write(monthname[d.getMonth()] + " ");
document.write(d.getDate() + ", ");
document.write(d.getFullYear()+"");/**/
document.write("</nobr><br></span><br>");
document.write("${wel} <font style='font-weight:bold;font-family:'Lucida Grande', 'Lucida Sans Unicode', Tahoma, Arial, san-serif'>"+document.getElementById("lab").innerHTML+"</font>");
document.write('</div>');
} 


//  End -->
<!-- Begin CSS Horizontal Menu - menu ver 3.15 2009

// NOTE: If you use a ' add a slash before it like this \'


var menuside		= "left"	// MENU SIDE | left | right | center
var fixwrap		= "no"		// MAKE yes ONLY IF MENUS ARE WRAPPING
var menuwidth		= "900"		// TOTAL MENU WIDTH TO FIX WRAP


document.write('<table cellpadding="0" cellspacing="0" border="0" class="menutable"><tr><td class="printhide" align="'+menuside+'">');
document.write('<table cellpadding="0" cellspacing="0" border="0"><tr><td>');
document.write('<ul id="menunav">');




// START MENU LINKS - EDIT BELOW THIS AREA

document.write('<li style="width: 140px;"><a href="Page1.jsp">${accs}</a>'); 
document.write('</li>');

document.write('<li style="width: 140px;"><a href="FundsTransfer.jsp">${ft}</a>'); 
document.write('<ul>');
document.write('<li><a href="FundsTransfer.jsp"><img src="image/funds.jpg" width="15" height="15" border="0"/> ${ft}</a></li>');
document.write('<li><a href="ThirdPartyTransfer.jsp"><img src="image/3fund.jpg" width="15" height="15" border="0"/> ${Thirdpt}</a></li>');
document.write('</ul>');
document.write('</li>');

document.write('<li style="width: 140px;"><a href="Transaction.jsp">${tran}</a>');
document.write('<ul>');
document.write('<li><a href="Transaction.jsp"><img src="images1/A1transaction.jpg" width="15" height="15" border="0"/> ${Viewtrans}</a></li>');
document.write('<li><a href="Userchkbook.jsp"><img src="images1/check_48.png" width="15" height="15" border="0"/>${cbookreq}</a></li>');
//document.write('<li><a href="Generate Notice(Man).jsp"><img src="not.gif" width="15" height="15" border="0"/> Generate Notice</a></li>');
document.write('</ul>');
document.write(' </li>');
  
document.write('  <li style="width: 140px;"><a href="profile.jsp">${profile}</a>');
document.write('  </li>');

document.write('  <li style="width: 140px;"><a href="cal.jsp">${stmts}</a>');
document.write('  </li>');

document.write('  <li style="width: 140px;"><a href="stopcheque.jsp">${stopchqs}</a>');
document.write('  </li>');

document.write('<li style="width:140px;"><a href="index.jsp">${mserv}</a>'); 
document.write('</li>');

// END LINKS //

document.write('</td></tr></table>');
document.write('</td></tr></table>');

</script>
</body>
</html>