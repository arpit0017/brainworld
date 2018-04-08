<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Leaderboard | BrainWorld</title>
<script src="js/jquery-2.1.4.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/tooltipster.bundle.min.js"></script>
<script src="js/Leaderboard.js"></script>

<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/Create.css">
<link rel="stylesheet" type="text/css" href="css/Leaderboard.css">
<link rel="stylesheet" type="text/css" href="css/tooltipster.bundle.min.css" />
<link rel="stylesheet" type="text/css" href="css/tooltipster-sideTip-punk.min.css" />

</head>
<body class="bg-black no-scrollx no-scrolly">
<%
	String Username=new String();
	String Role=new String();
	try
	{
		HttpSession sess=request.getSession(false);
		Username=sess.getAttribute("Username").toString();
		Role=sess.getAttribute("Role").toString();
	}
	catch(NullPointerException error)
	{
		Username="Guest";
		System.out.println("Guest View");
	}
%>
<div class="container-fluid"><center><img src="images/BrainWorld1.png" class="img-responsive" style="height:80px"></center></div> 
<nav class="nav navbar-DarkBlue">
	<div class="navbar-header">
        <button type="button" class="navbar-toggle threeLine" data-toggle="collapse" data-target="#myNavbar">
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>                        
      </button>
      <%
      	if(!Username.matches("Guest"))
      	{
      		out.println(""+
		      "<a class=\"navbar-brand\" href=\"Home.jsp\" style=\"font-size:23px;\" >"+
		      "<span class=\"glyphicon glyphicon-home\">"+
		      "</span></a>");
      	}
      %>
    </div>
    <div>
      <div class="collapse navbar-collapse text-bold font-times" id="myNavbar">
      
        <ul class="nav navbar-nav" style="letter-spacing:3px;font-size:18px;">
         <%
	        if(Role.matches("admin")){
		        out.println(""+
		         "<li><a href=\"Practice.jsp\"><span class=\"text-DarkGreen text-bold\">PRACTICE</span></a> </li>"+
		         "<li><a href=\"Create.jsp\"><span class=\"text-DarkGreen text-bold\">CREATE</span></a></li>"+
// 		         "<li><a href=\"#\"><span class=\"text-DarkGreen text-bold\">ACHIEVEMENTS</span></a></li>"+
		         "<li><a href=\"Leaderboard.jsp\"><span class=\"text-DarkGreen text-bold\">LEADERBOARD</span></a></li>"+
		         "");
	        }
	        else if(Username.matches("Guest"))
	        {
	        	out.println(""+
	        			 "<li class=\"li-DarkBlue\"><a href=\"Welcome.jsp\"><span class=\"text-DarkGreen text-bold\">WELCOME</span></a></li>"+
						 "<li><a href=\"#\"><span class=\"text-DarkGreen text-bold\">LEADERBOARD</span></a></li>"+
	        	          "<li><a href=\"#\"><span class=\"text-DarkGreen text-bold\">SAMPLE TEST</span></a></li>"+
	        	        "</ul>"+
	        	        "<ul class=\"nav navbar-nav navbar-right\">"+
	        	        "<li><a href=\"Signup.jsp\"><span class=\"glyphicon glyphicon-user\"></span><span class=\"text-DarkGreen text-bold\"> SIGN UP</span></a></li>"+
	        	        "<li><a href=\"Login.jsp\"><span class=\"glyphicon glyphicon-log-in\"></span><span class=\"text-DarkGreen text-bold\">LOGIN</span></a></li>"+
	        	      ""
	        			);
	        }
	        else
	        {
	        	out.println(""+
	       	         "<li><a href=\"Practice.jsp\"><span class=\"text-DarkGreen text-bold\">PRACTICE</span></a> </li>"+
// 	       	         "<li><a href=\"#\"><span class=\"text-DarkGreen text-bold\">ACHIEVEMENTS</span></a></li>"+
	       	         "<li><a href=\"Leaderboard.jsp\"><span class=\"text-DarkGreen text-bold\">LEADERBOARD</span></a></li>"+
	       	         "");
	        }
         %>
        </ul>
        <%
        if(!Username.matches("Guest"))
        {
        	out.println(""+
		        "<ul class=\"nav navbar-nav navbar-right font-times text-bold\" style=\"font-size:23px;\">"+
		        	"<li><a href=\"#\"><span class=\"glyphicon glyphicon-search\"></span></a></li>"+
		        	
		        	"<li class=\"dropdown\">"+
		        	"<a class=\"dropdown-toggle\" data-toggle=\"dropdown\" href=\"#\"><span class=\"text-DarkGreen text-bold\">"+
		             ((Role.matches("admin"))?"<span class=\"my-tooltip glyphicon glyphicon-ok-circle role-specifier\" title=\"Admin,Best Wishes!\" style=\"font-size:15px;\"></span>":" ")+
		            		
		        	Username+
					"</span>"+
					"<span class=\"caret\"></span>"+
					"</a>"+
				"<ul class=\"dropdown-menu dropdown-menu-create bg-DarkBlue\">"+
		          "<li><a href=\"Profile.jsp\"><span class=\"text-DarkGreen text-bold\">Profile</span></a></li>"+
		          "<li><a href=\"Welcome.jsp\"><span class=\"text-DarkGreen text-bold\">Log Out</span></a></li>"+
		        "</ul>"+
		        "</li>"+
		        "</ul>"
		       );
        }
        
        %>
      </div>
    </div>
</nav>

<div class="container-fluid" style="margin:30px;">
<div class="row">
<div class="Filter col-md-12">
<a href="#" class="pull-right" style="margin-bottom:10px;" data-toggle="modal" data-target="#myModal">
	<span class="glyphicon glyphicon-filter text-DarkGreen" style="font-size:20px;text-shadow:1px 1px 1px #000;">
	</span>
	</a>
</div>
<div class="col-md-12 scrollScreen no-scrollx bg-GrayShine" style="scrollbar-face-color:#f00;
    -webkit-scrollbar-arrow-color:#0f0;
    scrollbar-DarkShadow-Color:#00f;">
<table class="table table-responsive font-papyrus text-white table-bordered table-Lead">
<thead>
<tr>
<%
	String Headers[]={"Username","Subject","Test","Date","Max Score","Score","Grade"};
	String DataSend[]={"username","sub_desc","test_desc","test_date","total_marks","score","grade"};
	int i=0;
	for(i=0;i<Headers.length;i++)
	{
		out.println("<th>"+
					"<span class=\"glyphicon glyphicon-arrow-up pull-left\" data-name=\""+DataSend[i]+"\""+
					"data-type=\"asc\">"+
					"</span>"+Headers[i]+"<span class=\"glyphicon glyphicon-arrow-down pull-right\" "+
					"data-name=\""+DataSend[i]+"\" data-type=\"desc\">"+
					"</span></th>");
	}
	
%>
</tr>
</thead>
<tbody class="LoadAjax">

</tbody>
</table>

</div>
</div>
</div>
<div class="container">
  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog modal-lg">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Filter</h4>

        </div>
        <div class="modal-body row">
			
			
        </div>
        <div class="modal-footer">
           <button class="btn btn-primary pull-left" id="AddFilter">
			<span class="text-center">Add Filter</span></button>
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
          <button type="button" id="ApplyFilter" class="btn btn-success" data-dismiss="modal">Apply</button>
        </div>
      </div>
      
    </div>
  </div>
  
</div>
</body>
</html>