<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Exam Registration | Brain World</title>
<script src="js/jquery-2.1.4.js"></script>
<script src="js/bootstrap.min.js"></script>
<!-- <script src="js/Profile.js"></script> -->
<!-- <link rel="stylesheet" href="css/bootstrap.css"> -->
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/Create.css">
<!-- <link rel="stylesheet" href="css/Profile.css"> -->

</head>


<body class="bg-black">
<% 
	String GoVal=request.getParameter("GoValue");
	int IsPractice=0;
	try
	{
		IsPractice=Integer.parseInt(request.getParameter("IsPractice"));
	}
	catch(NumberFormatException error)
	{
		System.out.println("Not a Practice test...");
	}
	
	int Val=Integer.parseInt(GoVal);
%>
<%
String TestName=null;String TestDesc=null;String SubDesc =null;int MaxMarks =0;int PassMarks=0;
%>

<div class="container-fluid"><center><img src="images/BrainWorld1.png" class="img-responsive" style="height:80px"></center></div> 
<nav class="nav navbar-DarkBlue">
	<div class="navbar-header">
        <button type="button" class="navbar-toggle threeLine" data-toggle="collapse" data-target="#myNavbar">
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand text-DarkGreen" href="Home.jsp" style="font-size:23px;" ><span class="glyphicon glyphicon-home"></span></a>
    </div>
    <div>
      <div class="collapse navbar-collapse text-bold font-times" id="myNavbar">
      
        <ul class="nav navbar-nav text-DarkGreen" style="letter-spacing:3px;font-size:18px;">
         <li><a href="#" class="text-DarkGreen">PRACTICE</a> </li>
         <li><a href="#" class="text-DarkGreen">CREATE</a></li>
         <li><a href="#" class="text-DarkGreen">ACHIEVEMENTS</a></li>
        </ul>
        <ul class="nav navbar-nav navbar-right font-times text-bold" style="font-size:23px;">
        	<li><a href="#"><span class="glyphicon glyphicon-search"></span></a></li>
        	
        	<li class="dropdown">
        	<a class="dropdown-toggle text-DarkGreen" data-toggle="dropdown" href="#">
        	<%
	        	HttpSession sess=request.getSession(false);
	        	String Username=sess.getAttribute("Username").toString();		
	        	out.println(Username);
			%>
			
			<span class="caret"></span>
			</a>
		<ul class="dropdown-menu dropdown-menu-create">
          <li><a href="Profile.jsp">Profile</a></li>
          <li><a href="#">Exit</a></li>
        </ul>
        </li>
        </ul>
      </div>
    </div>
</nav>
<%@ page import="java.sql.*"%>
<%
	
	PreparedStatement St=null;
	Connection Db=null;
	ResultSet Results=null;
	String Query=new String();
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		Db=DriverManager.getConnection("jdbc:mysql://localhost/brainworld","root","p@t@n@hi");
	}
	catch(SQLException error)
	{
		System.out.println("SQL Exception 101:\t"+error);
	}
	catch(ClassNotFoundException error)
	{
		System.out.println("Class Not Found Error 101:\t"+error);
	}
	catch(Exception error)
	{
		System.out.println("Exception 101:\t"+error);
	}
	
	try
	{
		Query="select *, sub_desc from tests t,subjects s where t.test_id=? and t.subject_id=s.subject_id";
		St=Db.prepareStatement(Query);
		St.setInt(1, Val);
		Results=St.executeQuery();
	}
	catch(SQLException error)
	{
		System.out.println("SQL Exception error 102 :\t"+error);
	}
	catch(Exception error)
	{
		System.out.println("Exception error 102:\t"+error);
	}
	
	try
	{
		if(Results.next())
		{
			TestName=Results.getString("test_name");
			TestDesc=Results.getString("test_desc");
			SubDesc=Results.getString("sub_desc");
			MaxMarks=Results.getInt("total_marks");
			PassMarks=Results.getInt("passing_score");
// 			System.out.println(TestName+" "+TestDesc);
				
		}
		else
		{
			System.out.println("Impossible!:No Data Found!Check Code Again!");
		}
	}
	catch(SQLException error)
	{
		System.out.println("SQL Exception error 103:\t"+error);
	}
	catch(Exception error)
	{
		System.out.println("Exception error 103:\t"+error);
	}
	
%>
<div class="container">
	<form name="RegisterForExam" action="RegisterForExam" method="post">
	<%out.println("<input type=\"hidden\" name=\"isPractice\" value=\""+IsPractice+"\"> "); %>
	<div class="bg-GrayShine BorderGreen">
		<center><span class="text-white font-AdobeB"
			style="font-size:50px;letter-spacing:4px;border-bottom:Solid 2px #fff;
			border-radius:15%;"><%out.println(TestName); %></span></center>
		<hr>
		<div>
		<h2 class="font-ArialR text-center" style="color:#fff;"><u><b>Description</b></u></h2>
		<p class="text-center font-times text-white"><%out.println(TestDesc);%>.</p>
		<h3 class="text-primary text-bold font-papyrus text-center" >Maximum Marks:<i class="text-white">&nbsp;<%out.println(MaxMarks);%></i></h3>
		<h3 class="text-success text-bold font-papyrus text-center">Passing Marks:<i class="text-white">&nbsp;<%out.println(PassMarks);%></i></h3>
		<h3 class="text-danger font-papyrus text-bold text-center">Time Limit:<i class="text-white">&nbsp;3:00:00 hrs</i></h3>
		</div>
		<hr>
		
		<div>
		<h2 class="font-ArialR text-center" style="color:#fff;"><u><b>Instructions</b></u></h2>
		<ol type="number" class="text-white font-times row" style="font-size:15px;margin-left:50px;">
			<li class="col-md-4">Attempt all questions.</li>
			<li class="col-md-4">Each question carries 10 marks.</li>
			<li class="col-md-4">Use <i>OVERVIEW</i> section to jump between questions.</li>
		</ol>
		</div>
		<hr>
		<button class="btn-lg btn-success center-block" id="RegisterButton">Start<span class="glyphicon glyphicon-circle-arrow-right" style="margin-left:20px;"></span></button>
		<%out.println("<input type=\"hidden\" name=\"TestId\" id=\"TestId\" value=\""+Val+"\">");%>
	</div>
	</form>
</div>

</body>
</html>