<%@ page language="java" contentType="text/html; charset=UTF-8"
    import="java.sql.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri = "http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	  <link rel="SHORTCUT ICON" href="image/icon.ico">
<title>:: Login ::</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	
	<!-- Stylesheets -->
	<link rel="stylesheet" href="css/reset.css" />
	<link rel="stylesheet" href="css/styles.css" />
	
	<!-- Scripts -->
	<script type="text/javascript" src="js/jquery.min.js"></script>
	<script type="text/javascript" src="js/jquery.roundabout-1.0.min.js"></script> 
	<script type="text/javascript" src="js/jquery.easing.1.3.js"></script>
		<script type="text/javascript" src="js/select.js"></script>
	<script type="text/javascript">		
		$(document).ready(function() { 
			$('#featured ul').roundabout({
				easing: 'easeOutInCirc',
				duration: 600
			});
		});
		$(document).ready(function() {		
	
	//Execute the slideShow
	slideShow();

});

function slideShow() {

	//Set the opacity of all images to 0
	$('#gallery a').css({opacity: 0.0});
	
	//Get the first image and display it (set it to full opacity)
	$('#gallery a:first').css({opacity: 1.0});
	
	//Set the caption background to semi-transparent
	$('#gallery .caption').css({opacity: 0.7});

	//Resize the width of the caption according to the image width
	$('#gallery .caption').css({width: $('#gallery a').find('img').css('width')});
	
	//Get the caption of the first image from REL attribute and display it
	$('#gallery .content').html($('#gallery a:first').find('img').attr('rel'))
	.animate({opacity: 0.7}, 400);
	
	//Call the gallery function to run the slideshow, 6000 = change to next image after 6 seconds
	setInterval('gallery()',3000);
	
}

function gallery() {
	
	//if no IMGs have the show class, grab the first image
	var current = ($('#gallery a.show')?  $('#gallery a.show') : $('#gallery a:first'));

	//Get next image, if it reached the end of the slideshow, rotate it back to the first image
	var next = ((current.next().length) ? ((current.next().hasClass('caption'))? $('#gallery a:first') :current.next()) : $('#gallery a:first'));	
	
	//Get next image caption
	var caption = next.find('img').attr('rel');	
	
	//Set the fade in effect for the next image, show class has higher z-index
	next.css({opacity: 0.0})
	.addClass('show')
	.animate({opacity: 1.0}, 1000);

	//Hide the current image
	current.animate({opacity: 0.0}, 1000)
	.removeClass('show');
	
	//Set the opacity to 0 and height to 1px
	$('#gallery .caption').animate({opacity: 0.0}, { queue:false, duration:0 }).animate({height: '1px'}, { queue:true, duration:300 });	
	
	//Animate the caption, opacity to 0.7 and heigth to 100px, a slide up effect
	$('#gallery .caption').animate({opacity: 0.7},100 ).animate({height: '70px'},500 );
	
	//Display the content
	$('#gallery .content').html(caption);
	
	
}

</script>  

<script type="text/javascript">


/*
function val(){
document.getElementById("op").style.visibility="inline";
document.getElementById("op").innerHTML="<br><span style='font-family:Georgia'>Entered Username/Password is wrong.</span>";
return false;
}
*/
//document.getElementById("nam").focus();



function loginselect1(){
window.location.href="http://localhost:8080/I-Bank/index1.jsp";
}
function loginselect(){
window.location.href="http://localhost:8080/I-Bank/index.jsp";
}

function loginselect2(){
window.location.href="http://localhost:8080/I-Bank/1.jsp";
}

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
}

.clear {
	clear:both;
}

#gallery {
	position:relative;
	height:320px
}
	#gallery a {
		float:left;
		position:absolute;
	}
	
	#gallery a img {
		border:none;
	}
	
	#gallery a.show {
		z-index:500
	}

	#gallery .caption {
		z-index:600; 
		background-color:#000; 
		color:#ffffff; 
		height:25%; 
		width:100%; 
		position:absolute;
		bottom:0;
		margin-bottom:20px;
	}

	#gallery .caption .content {
		margin:5px
	}
	
	#gallery .caption .content h3 {
		margin:0;
		padding:0;
		color:#1DCCEF;
	}
	
.login
{
text-align:center;
height:25px;
position:relative;
margin-top:15px;
}

.blue
{
font-family:Georgia;
color:#6600FF;
text-align:center;
margin-left:20px;
}

</style>
</head>
<body>
<%!
ResultSet rs,rs1,rs2;
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

	<div id="wrapper" class="container_12 clearfix">

		<!-- Text Logo -->
		<h1 id="logo" class="grid_4"><img src="images1/ibank.jpg" height="130" width="250"></h1>
		
		<!-- Navigation Menu -->
  <ul id="navigation" class="grid_8">			
			<li><a href="securitytips.html"><span class="meta">Get Started</span><br />Security Tips</a></li>
			<li><a href="downloadapps.html"><span class="meta">Download</span><br />Application Forms</a></li>
			</ul>
		
<noscript><BR><BR><BR><BR><BR><BR><BR><BR><BR><BR>
<h1>It seems that Javascript is disabled in the browser you are currently using.<BR>
Please enable Javascript and try again.</h1>
</noscript>

		<div class="hr grid_12">&nbsp;</div>
		<div class="clear"></div>
		<div id="gallery">

	<a  class="show">
		<img src="images1/inmo-kiosk-011111.jpg" alt="" width="600" height="300" title="" alt="" rel="<h3>I-Bank</h3>Opening new Account at any of the I-Bank branches is fast and takes only 10 mins because First things first...  nothing can be easier than that."/>
	</a>
	
	<a  >
		<img src="images1/images_4.jpg" alt="" width="600" height="300" title="" alt="" rel="<h3>I-Bank</h3>I-Bank offers Student Loans for the Gen-Next of the country. Get Student Loans from people who believe in you."/>
	</a>

	<a  >
		<img src="images1/debit-card-word-cloud-600bc7.jpg" alt="" width="600" height="300" title="" alt="" rel="<h3>I-Bank</h3> I-Bank offers Debit Cards for its Beloved and Valuable Customers because there are some things money can't buy."/>
	</a>
	
	<a  >
		<img src="images1/images_3.jpg" alt="" width="600" height="300" title="" alt="" rel="<h3>I-Bank</h3>I-Bank offers Education loans for the Emerging youth of the Country because If you think education is expensive, try ignorance. "/>
	</a>
	
	<a  >
		<img src="images1/images1.jpg" alt="" width="600" height="300" title="" alt="" rel="<h3>I-Bank</h3>I-Bank offers Personal Loan Credit Cards and Low Interesr Credit Cards for its Beloved and Valuable customers."/>
	</a>
		
    <div class="caption"><div class="content"></div></div>
	<div style="position:absolute;right:390px;"><img src="images/link_border.png" height="390px" width="1px"></img></div>
<div style="position:absolute;right:70px;">
<div align="left" id="ses" style="display:'none';">
<font color="red">Your Session has timed out!!!<br>Please Login again.</font>
<br>
</div>
<div class="login" ><br>
<br>
<img src="images1/welcomebox_left.gif" height="60px" width="60px" style="position:absolute;top:20px;right:150px;"/>
<div style="font-family:font-family:Georgia;position:absolute;top:45px;right:100px;font-weight:bold;">LOGIN</div><br><br><br>
<div id="sel" style="display:true;position:relative;top:40px;right:70px;"><br>
<button style="background-color:#E0E5E9; font-weight:bold;font-family:'Lucida Grande', 'Lucida Sans Unicode', Tahoma, Arial, san-serif;font-size:14 px;"  onClick="javascript:loginselect()">&nbsp; Personal Banking &nbsp;</button><br><br><br>
<button style="background-color:#E0E5E9;font-weight:bold;font-family:'Lucida Grande', 'Lucida Sans Unicode', Tahoma, Arial, san-serif; font-size:14 px;" onClick=" javascript:loginselect1()">Corporate Banking</button><br><br><br>
<button style="background-color:#E0E5E9;font-weight:bold;font-family:'Lucida Grande', 'Lucida Sans Unicode', Tahoma, Arial, san-serif; font-size:14 px;" onClick=" javascript:loginselect2()">&nbsp;&nbsp;&nbsp; Administrator &nbsp;&nbsp;&nbsp;</button><br><br><br>
</div> 
</div> 

</div>
</div>

<div class="hr grid_12 clearfix">&nbsp;</div>
		<!-- Caption Line -->
		
	<h2 class="grid_12 caption clearfix"><marquee behavior="scroll" scrollamount="8" scrolldelay="150">Welcome to<span> iBank Online Banking Portal</span> enabling customers enjoy uninterrupted services. </marquee> </h2>
		<div class="hr grid_12 clearfix quicknavhr">&nbsp;</div>
		<div id="quicknav" class="grid_12">
		  <a class="quicknavgrid_3 quicknav alpha" href="emicalc.jsp">
		  <h4 class="title" align="center"><img src="image/14868068_New_icons_blue.gif"/> EMI Calculator</h4>
					<p>Calculate your EMI using our EMI Calculator. </p>
					<p>&nbsp;</p>
		  <p style="text-align:center;"><img alt="EMI Calculator" src="image/img_emi_calculator_2.jpg" height="150 px" width="200 px" /></p>
				
		  </a>
			<a class="quicknavgrid_3 quicknav" href="locatoratm.jsp">
	<h4 class="title" align="center"><img src="image/14868068_New_icons_blue.gif"/> ATM Locator</h4>
					<p>Locate your latest I-Bank ATM with the help of our latest ATM Locator. </p>
					<p>&nbsp;</p>
					<p style="text-align:center;"><img alt="ATM Locator" src="image/ATM.jpg" height="150 px" width="200 px" /></p>
				
		  </a>
			<a class="quicknavgrid_3 quicknav" href="locator.jsp">
			<h4 class="title" align="center">Branch Locator</h4>
					<p>Locate your latest I-Bank Branch with the help of our latest Branch Locator. </p>
					<p>&nbsp;</p>
					<p style="text-align:center;"><img alt="Branch Locator" src="image/branch_locator_new1.gif" height="150 px" width="195 px"/></p>
				
			</a>
			<a class="quicknavgrid_3 quicknav" href="http://www.bseindia.com/sensex/index.htm" target="_blank">
			<h4 class="title" align="center"><img src="image/14868068_New_icons_blue.gif"/>  Market Watch</h4>
					<p>Follow today's I-Bank stock and the market trend here</p>
					<p>&nbsp;</p>
					<p style="text-align:center;"><img alt="Market Watch" src="images1/rp_market.jpg" height="135 px" width="195 px"/></p>
			</a>
	  </div>
<div class="hr grid_12 clearfix">&nbsp;</div>
		<!-- Footer -->
		 <p class="grid_12 footer clearfix">
			<span class="float"><b>&copy; Copyright</b> <a href=""> iBank</a>.  For further queries contact us at <b><a href="mailto:ibanker814@gmail.com">ibanker814@gmail.com</a></b></span>
			<a class="float right" href="#">top</a>
		</p> 
		
	</div>
	<!--end wrapper-->
<%
//System.out.println("s is "+request.getParameter("s"));
if(request.getParameter("s")!=null && request.getParameter("s").equals("invalid")){
	System.out.println("s inside is "+request.getParameter("s"));
out.println("<script type='text/javascript'>document.getElementById('ses').style.display='inline';</script>");
out.flush();
}
if(request.getParameter("s")==null){
	System.out.println("s inside is "+request.getParameter("s"));
out.println("<script type='text/javascript'>document.getElementById('ses').style.display='none';</script>");
out.flush();
}%>
</body>
</html>