<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Practice Exam | Brain World</title>
<script src="js/jquery-2.1.4.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/Exam.js"></script>
<!-- <script src="js/Profile.js"></script> -->

<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/Create.css">

<link rel="stylesheet" href="css/Exam.css">

</head>

<body class="bg-black text-white">
<div class="container-fluid"><center><img src="images/BrainWorld1.png" class="img-responsive" style="height:80px"></center></div> 

<%@ page import="java.sql.*"%>
<%@page import="java.util.*" %>
<%
	HttpSession sess=request.getSession(false);
	String Username=sess.getAttribute("Username").toString();
// 	System.out.println(Username);
	
	int TestId=Integer.parseInt(request.getAttribute("TestId").toString());
	System.out.println("TestID:\t"+TestId);
	PreparedStatement St=null;
	Connection Db=null;
	ResultSet ResultsForQues=null,ResultsForOptions=null,Results=null;
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
	
%>
<%
	int TotalQues=15,MaxQues=10;
	int QuesNumber=0;
	Random RandomNum=new Random();
	int RandomQues[]= new int[MaxQues];
	String Questions[]=new String[TotalQues];
	int QuesId[] = new int[TotalQues];
	int i=0,ctr=1,NewNum=0,j;
	int NewUtqId=0;
%>

<div class="rows">

<div class="col-md-2" style="padding:20px;margin-top:10px;">
<div id="Timer" class="font-times text-center" style="margin-top:5px;letter-spacing:2px;font-size:30px;color:#f00;">

</div>
<div class="border-inverse" style="padding:10px;">
<h2 class="text-white font-papyrus text-center"><u>Overview</u></h2>
<center>
<%
	for(int k=0;k<MaxQues;k++)
	{
		out.println("<button style=\"margin:1px;\" class=\"Button btn btn-sm btn-primary text-center\" id=\"Button"+(k+1)+"\">"+(((k+1)<10)?("&nbsp;&nbsp;"+(k+1)):(k+1))+"</button>");
	}
%>
</center>
</div>
<!-- <div> -->
<!-- <h2 class="text-white font-papyrus"><u>Instructions</u></h2> -->
<!-- <ol type="number"> -->
<!-- <li>Attempt all questions.</li> -->
<!-- <li>Each question carries 25 marks.</li> -->
<!-- <li>Use <i>OVERVIEW</i> section to jump between questions.</li> -->
<!-- </ol> -->
<!-- </div> -->
</div>

<form name="SubmitAnswers" id="ExamForm" method="post" action="SubmitAnswers">
<input type="hidden" name="IsPractice" value="1">
<div class="col-md-10">
<div class="row">
<div class="col-md-12">
<!-- <div class="col-md-4"> -->
<!-- <h2 class="text-white font-papyrus"><u>Questions</u></h2> -->
<!-- </div> -->
<div class="col-md-4">
<!-- <div id="Timer" class="font-times center-block" style="margin-top:5px;letter-spacing:2px;font-size:40px;color:#f00;"> -->

<!-- </div> -->
</div>
</div>
<div class="col-md-12" style="margin-top:50px;">
<div class="bg-GrayShine BorderGreen" style="height:65vh;width:80vw;">
<%
	
	// --------------------Creating Random Number Array-----------------------------
	while(i<MaxQues)
	{
		ctr=1;
		while(ctr==1)
		{
			NewNum=RandomNum.nextInt(TotalQues);
			ctr=0;
			for(j=0;j<i;j++)
			{
				if(NewNum==RandomQues[j])
				{
					ctr=1;
					break;
				}
			}
		}
		RandomQues[i]=NewNum;
		i++;
	}
	i=0;
	while(i<RandomQues.length)
	{
		System.out.print(RandomQues[i++] + " ");
	}
	
	try
	{
		Query=" select q.q_id,q_desc from questions q,test_ques tq where q.q_id=tq.q_id and tq.test_id=?";
		St=Db.prepareStatement(Query);
		St.setInt(1, TestId);
		ResultsForQues=St.executeQuery();
	}
	catch(SQLException error)
	{
		System.out.println("SQL Exception error 102 :\t"+error);
	}
	catch(Exception error)
	{
		System.out.println("Exception error 102:\t"+error);
	}
	

	// -------------------------Reading Questions----------------------------
	i=0;
	try
	{
		while(ResultsForQues.next() && i<TotalQues)
		{
			Questions[i]=ResultsForQues.getString("q_desc");
			System.out.println("Working For 103:\n Current value of i:\t"+i);
			QuesId[i++]=ResultsForQues.getInt("q_id");
			System.out.println("Previous questions id:\t"+QuesId[i-1]);//+"\nPrevious Question:\t"+Questions[i-1]);
		}	
	}
	catch(SQLException error)
	{
		System.out.println("SQL Exception error 103:\t"+error);
	}
	catch(Exception error)
	{
		System.out.println("Hello ! Exception error 103:\t"+error);
	}
	
	j=0;
	while(j<MaxQues)
	{
		QuesNumber++;
		System.out.println("HERE!"+QuesNumber);
		out.println("<div id=\"Question"+(j+1)+"\" class=\"col-md-12 QuestionDiv\">");
		out.println("<div class=\"col-md-12 font-impact text-white\""+
				" style=\"font-size:25px;margin:20px;\"><span class=\"col-md-4 CursorPointer col-sm-4"+
				"text-left Previous glyphicon glyphicon-backward\" name=\""+
				QuesNumber+"\"></span><span class=\"col-md-4 col-sm-4 text-center CursorPointer Flag"+
				" glyphicon glyphicon-flag\""+
				"name=\""+QuesNumber+"\"></span>"+
				"<span class=\"col-md-4 col-sm-4 CursorPointer text-right Next glyphicon glyphicon-forward\""+
				"name=\""+QuesNumber+"\"></span></div>");
			
				
		try{out.println("<pre class=\"ScrollableQues\">"+Questions[RandomQues[j]]+"</pre>");}catch(ArrayIndexOutOfBoundsException error){
			System.out.println("Exception with a value of j:\t"+j);
		}
		//-----------Getting a new UTQ_ID for given question----------------
// 		try
// 		{
// 			Query="select max(utq_id) from usr_test_ques";
// 			St=Db.prepareStatement(Query);
// 			Results=St.executeQuery();
// 			if(Results.next())
// 			{
// 				NewUtqId=Results.getInt(1)+1;
// 			}
// 		}
// 		catch(SQLException error)
// 		{
			
// 			System.out.println("SQL Exception error 104 :\t"+error);
// 		}
// 		catch(Exception error)
// 		{
// 			System.out.println("Exception error 104:\t"+error);
// 		}
		
// 		//----------------Updating User's Test Questions Database-----------------
		
// 		try
// 		{
// 			Query="insert into usr_test_ques values(?,?,?,'Not Answered')";
// 			St=Db.prepareStatement(Query);
// 			System.out.println(NewUtqId+" "+UserTestId+" "+QuesId[RandomQues[j]]);
// 			St.setInt(1, NewUtqId);
// 			St.setInt(2,UserTestId);
// 			St.setInt(3,QuesId[RandomQues[j]]);
// 			St.executeUpdate();
// 		}
// 		catch(SQLException error)
// 		{
// 			System.out.println("SQL Exception error 104 here:\t"+error);
// 		}
// 		catch(Exception error)
// 		{
// 			System.out.println("Exception error 104:\t"+error);
// 		}
		
		try
		{
			Query=" select qo_id, qo_desc from ques_opt qo, questions q where qo.q_id = q.q_id and q.q_id=?";
			St=Db.prepareStatement(Query);
			St.setInt(1, QuesId[RandomQues[j]]);
			ResultsForOptions=St.executeQuery();
		}
		catch(SQLException error)
		{
			System.out.println("SQL Exception error 104 :\t"+error);
		}
		catch(Exception error)
		{
			System.out.println("Exception error 104:\t"+error);
		}
		try
		{
			out.println("<div class=\"col-md-12\">");
			while(ResultsForOptions.next())
			{
				out.println("<div class=\"col-md-6\"><input type=\"radio\" name=\""+QuesNumber+"\" value=\""+ResultsForOptions.getInt("qo_id")+"\" "+
				" class=\"text-center text-white RadioButton\"> &nbsp;"+ResultsForOptions.getString("qo_desc")+"</div>");
				
			}
			out.println("</div>");
		}
		catch(SQLException error)
		{
			System.out.println("SQL Exception error 105:\t"+error);
		}
		catch(Exception error)
		{
			System.out.println("Exception error 105:\t"+error);
		}
		j++;
		out.println("</div>");
	}
	System.out.println("HERE HERE");
	out.println("<div id=\"Question"+(j+1)+"\" class=\"QuestionDiv EndOfQuestions font-papyrus\">You have answered"+
	" All Questions. To Submit the answers click the submit button or to view any previous question"+
			" click on the Question Number in the OVERVIEW section.</div>");
	out.println("<input type=\"hidden\" id=\"MaxQues\" value=\""+MaxQues+"\" name=\"MaxQues\">");
	
	try
	{
		Results.close();
		Db.close();
	}
	catch(SQLException error)
	{
		System.out.println("SQL Exception in Closing DataBase 106:\t"+error);
	}
	catch(Exception error)
	{
		System.out.println("Exception error 106: " + error);
	}
	System.out.println("HERE HERE HERE!");
%>
</div>
<div class="col-md-12" style="margin-top:10px;">
<center><button class="btn-lg btn-success" style="display:inline-block;">Submit</button></center>
</div>
</div>
</div>
</div>

</form>
</div>

</body>
</html>