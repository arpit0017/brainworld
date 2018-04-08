<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body>
<%@ page import="java.sql.*"%>
<%
	int ExamId=Integer.parseInt(request.getParameter("ExamId"));
	int SubjectId=Integer.parseInt(request.getParameter("SubjectId"));
	String ExamName=request.getParameter("ExamName");
	String ExamDesc=request.getParameter("ExamDesc");
	int MaxScore=Integer.parseInt(request.getParameter("MaxScore"));
	int PassScore=Integer.parseInt(request.getParameter("PassScore"));
	
	System.out.println("Recorded Call For Exam = "+ExamName+" Says Exam Id: "+ExamId+",SubjectId= "+SubjectId+" ExamDesc="+ExamDesc+" MaxScore= "+MaxScore+", PassScore= "+PassScore);
	
	PreparedStatement St=null;
	Connection Db=null;
	ResultSet Results=null;
	
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
	String Query=new String();
	try
	{
		if(ExamId==0)
		{
			Query="select max(test_id) from tests";
			St=Db.prepareStatement(Query);
			Results=St.executeQuery();
			if(Results.next()){
				PreparedStatement St2=null;
				
				String Query2="insert into tests values(?,?,?,?,?,?,CurDate(),'2016-12-31',?)";
				St2=Db.prepareStatement(Query2);
				St2.setInt(1, (Results.getInt(1)+1));
				St2.setInt(2,SubjectId);
				St2.setString(3, ExamName);
				St2.setString(4,ExamDesc);
				St2.setInt(5,MaxScore);
				St2.setInt(6, PassScore);
				St2.setInt(7,1);
				St2.executeUpdate();
				
			}
		}
		else
		{
			Query="update tests set test_name=?, test_desc=?, total_marks=?, passing_score=?, is_Active=? where test_id=?";	
			St=Db.prepareStatement(Query);
			St.setString(1, ExamName);
			St.setString(2,ExamDesc);
			St.setInt(3,MaxScore);
			St.setInt(4,PassScore);
			St.setInt(5,1);
			St.setInt(6,ExamId);
			St.executeUpdate();
		}
		
	}
	catch(SQLException error)
	{
		System.out.println("SQL Exception error 104:\t"+error);
	}
	catch(Exception error)
	{
		System.out.println("Exception error 104:\t"+error);
	}
	try
	{
		Db.close();
	}
	catch(Exception error)
	{
		System.out.println("Error Closing :"+error);
	}
%>
</body>
</html>