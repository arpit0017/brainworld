<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Brain World</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<script src="js/jquery-2.1.4.js"></script>
<script src="js/bootstrap.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/typed.js"></script>
<script src="js/starscroll.js"></script>
<script src="js/Welcome.js"></script>

<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/Create.css">
<link rel="stylesheet" href="css/animate.css">
<!-- <script src="js/smoothscroll.js"></script> -->

<script>
$(document).ready(function(){
	
// 	  $('.bg-Monkey').starscroll(16,3,50,5);
	  // Add smooth scrolling to all links in navbar + footer link
	  $(".navbar-brand, .ul-DarkBlue a").on('click', function(event) {

		  var href2=$(this).attr("href");
		  var href=this.href;
//	 	  console.log(href);
		  if(href2=="Leaderboard.jsp")
			  {
//	 		  	console.log(href);
			  	return;
			  }
	    // Prevent default anchor click behavior
	    event.preventDefault();

	    // Store hash
	    var hash = this.hash;
	    var extraScroll=100;
	    if(hash=="#begin" || hash=="#AboutUs")
	    	{
	    		extraScroll=0;
	    	}

	    // Using jQuery's animate() method to add smooth page scroll
	    // The optional number (900) specifies the number of milliseconds it takes to scroll to the specified area
	    $('html, body').animate({
	      scrollTop: $(hash).offset().top - extraScroll
	    }, 900, function(){
	   
	      // Add hash (#) to URL when done scrolling (default click behavior)
	      window.location.hash = hash;
	    });
	  });
	  $(window).scroll(function() {
		  $(".slideanim").each(function(){
		    var pos = $(this).offset().top;

		    var winTop = $(window).scrollTop();
		    if (pos < winTop + 600) {
		      $(this).addClass("slide");}
		    
		    
		  }); 
	  });
	//   $(window).scroll(function(){
//	 	  $(".slide").each(function(){
//	 		  var pos=$(this).offset().top;
//	 		  var winTop=$(window).scrollTop();
//	 		  if(pos<winTop + 700)
//	 			  {
//	 			  	$(this>".panel-body").html("<h1>"+10+"</h1>");
//	 			  }
//	 	  });
	//   });
});
</script>


<style>

body
{
	overflow:hidden;
}
  .carousel-inner > .item > img,
  .carousel-inner > .item > a > img {
      width: 70%;
      margin: auto;
  }
 .affix {
      top:0;
      width: 100%; 
      z-index: +1;  
  }
  .navbar {
      margin-bottom: 0px;
  }

  .affix ~ .container-fluid {
     position: relative;
    top:50px;
  }
  .panel
  {
  	border:2px solid #000;
  	box-shadow:0px 0px 3px 4px #000;
  }
  .panel-heading
  {
  	background-color:#000;
  	color:#fff;	
  }
  .panel-body
  {
  	background-color:#c0c0c0;
  	color:#000;
  }
  .panel
  {
  	margin-left:50px;
  	margin-right:50px;
  }
  
  .btn-AboutUs
  {
  	float:right;
  	margin:10px;
  }
  .btn-ContactUs
  {
  	float:left;
  	margin:10px;
  }
  @media only screen and (max-device-width:480px)
  {
  	body{overflow:visible;}
  	.btn-AboutUs
	  {
	  	float:none;
	  	margin: 0 Auto;
	  	width:70%;
	  	margin-bottom:10px;
	  }
	.btn-ContactUs
	  {
	  	float:none;
	  	margin: 0 Auto;
	  	width:70%;
	  }
  }
  
  $(".btn-ContactUs, .btn-AboutUs")
  {
		-webkit-animation-delay:1s;
		-animation-delay:1s;
		-webkit-animation-duration:3s;
  }
  </style>
</head>
<%

	HttpSession sess=request.getSession(false);
	sess.invalidate();
%>
<body data-spy="scroll" data-target=".navbar" data-offset="50" class="bg-black" style="position:relative;">

<!-- <div class="container CompleteScreen" id="PreScreen"> -->
<!-- <video controls="false" loop muted style="position:absolute;top:0;left:0;z-index:-1;height:100vh;width:100vw;"> -->
<!-- 	<source src="video/PreScreen.mp4" type="video/mp4"> -->
<!-- 	<source src="video/PreScreen.ogg" type="video/ogg"> -->
<!-- </video> -->
<!-- <div class="jumobotron PreHeader col-m-12"> -->
<!-- <h1 class="font-comic text-center clearfix" style="margin-top:100px;font-size:50px;color:#fff"><u><strong>Brain World</strong></u></h1> -->
<!-- </div> -->
<!-- <div class="footer col-m-12" style="position:absolute;bottom:0;width:100vw; padding:20px;"> -->
<!-- <button class="btn btn-lg btn-success center-block" style="border-radius:50%;" ><span class="glyphicon glyphicon-arrow-right"></span></button> -->
<!-- </div> -->
<!-- </div> -->


  
<div class="container-fluid" id="begin"><center><img src="images/BrainWorld1.png" class="img-responsive" style="height:80px"></center></div> 

<nav class="navbar navbar-DarkBlue font-times text-bold" data-spy="affix" data-offset-top="80" style="font-size:18px;">
    <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="#begin"><span class="text-DarkGreen text-bold">BRAIN WORLD&nbsp;|</span></a>
    </div>
    <div>
      <div class="collapse navbar-collapse" id="myNavbar">
        <ul class="nav navbar-nav ul-DarkBlue">

          <li><a href="#Tests"><span class="text-DarkGreen text-bold">TESTS</span></a></li>
          <li><a href="#AboutUs"><span class="text-DarkGreen text-bold">ABOUT US</span></a></li>
          <li><a href="Leaderboard.jsp"><span class="text-DarkGreen text-bold">LEADERBOARD</span></a></li>
<!--           <li><a href="#"><span class="text-DarkGreen text-bold">SAMPLE TEST</span></a></li> -->
        </ul>
        <ul class="nav navbar-nav navbar-right">
        <li><a href="Signup.jsp"><span class="glyphicon glyphicon-user"></span><span class="text-DarkGreen text-bold"> SIGN UP</span></a></li>
        <li><a href="Login.jsp"><span class="glyphicon glyphicon-log-in"></span><span class="text-DarkGreen text-bold">LOGIN</span></a></li>
      </ul>
      </div>
    </div>
</nav> 
 <div class="container-fluid" id="Welcome" style="margin-top:0px;width:110vw;padding-left:0px;">
<div class="jumbotron bg-Monkey img-responsive fitScreen" style="width:110vw;padding-left:0px;">
	<h1 class="text-center font-arial" style="margin-bottom:20px;letter-spacing:2px;">Welcome&nbsp;!</h1>
	<h2 class="text-center font-comic" style="min-height:40px;"></h2>
	<div class="col-md-12 text-serif text-center" style="letter-spacing:2px;font-size:30px; color: rgba(255,255,250,0.9);margin-top:20px;">
		Learn | Code | Compete 
	</div>
	<div class="container col-md-12" style="margin-top:50px;">
		<div class="container col-md-6 col-sm-12">
			<button class="btn btn-lg btn-transparent btn-AboutUs animated rotateInDownLeft">
				<span class="font-arial">
					About Us
				</span>
			</button>
		</div>
		<div class="container col-md-6 col-sm-12">
			<button class="btn btn-lg btn-transparent btn-ContactUs animated rotateInDownRight">
				<span class="font-arial">
					Contact Us
				</span>
			</button>
		</div>
	</div>
</div>
</div>
<!--  <div class="container-fluid"> -->

<!-- <img class="img-responsive fitScreen" src="images/Coding.jpg" alt="Keep Coding!"> -->
<!-- <!-- <div class="img-responsive bg-Coding fitScreen"></div> --> -->
<!-- </div> -->

<div class="container-fluid" id="Tests">
<div class="jumbotron box-black">
<h1 class="text-center font-papyrus">Tests</h1>
<div class="container">
  <br>
  <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
      <li data-target="#myCarousel" data-slide-to="3"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">

      <div class="item active">
        <img class="img-responsive" src="images/Coding-008.jpg" alt="Coding" width="460" height="345">
        <div class="carousel-caption">
          <span>Take Up A Test</span>
          <p>C++</p>
        </div>
      </div>

      <div class="item">
        <img class="img-responsive" src="images/Coding-008.jpg" alt="Coding" width="460" height="345">
        <div class="carousel-caption">
          <span>Take Up A Test</span>
          <p>Java</p>
        </div>
      </div>
    
      <div class="item">
        <img class="img-responsive" src="images/Coding-008.jpg" alt="Coding" width="460" height="345">
        <div class="carousel-caption">
          <span>Take Up A Test</span>
          <p>QBasics</p>
        </div>
      </div>

      <div class="item">
        <img class="img-responsive" src="images/Coding-008.jpg" alt="Coding" width="460" height="345">
        <div class="carousel-caption">
          <span>Take Up A Test</span>
          <p>Perl</p>
        </div>
      </div>
  
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
</div>
</div>
</div>
<div class="container-fluid"  id="AboutUs">
<div class="jumbotron text-white bg-Texture2 img-responsive">
<h1 class="text-center font-lucida">About Us</h1>
<div class="row text-center font-times font-bold">
	<div class="Stats col-sm-4">
		<div class="panel slideanim">
			<div class="panel-heading"><h2>Users</h2></div>
			<div class="panel-body"><h1>5</h1></div>
		</div>
	</div>
	<div class="Stats col-sm-4">
		<div class="panel slideanim">
			<div class="panel-heading"><h2>Domains</h2></div>
			<div class="panel-body"><h1>10</h1></div>
		</div>
	</div>
	<div class="Stats col-sm-4">
		<div class="panel slideanim">
			<div class="panel-heading"><h2>Tests</h2></div>
			<div class="panel-body"><h1>20</h1></div>
		</div>
	</div>
	
</div>

</div>
</div>

<footer class="container-fluid text-white text-center font-times" >
<!-- <marquee direction="left" behavior="scroll">
<img src="images/Companies/Adidas.jpg" class="img-rounded SmallImage">
<img src="images/Companies/Amazon.jpg" class="img-rounded SmallImage">
<img src="images/Companies/CocaCola.jpg" class="img-rounded SmallImage">
<img src="images/Companies/KFC.jpg" class="img-rounded SmallImage">
<img src="images/Companies/Pepsi.jpg" class="img-rounded SmallImage">
<img src="images/Companies/TacoBell.jpg" class="img-rounded SmallImage">
<img src="images/Companies/Google.png" class="img-rounded SmallImage">
<img src="images/Companies/MTv.png" class="img-rounded SmallImage">
</marquee> -->
</footer>
</body>
</html>