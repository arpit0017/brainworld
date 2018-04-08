<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body>
<%@ page import="java.sql.*"%>
<%
	int SubjectId=Integer.parseInt(request.getParameter("SubjectId"));
	String SubjectName=request.getParameter("SubjectName");
	
	System.out.println("Recorded Call For Subject = "+SubjectName+" Says Subject Id: "+SubjectId);
	
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
		if(SubjectId==0)
		{
			Query="select max(subject_id) from subjects";
			St=Db.prepareStatement(Query);
			Results=St.executeQuery();
			if(Results.next()){
				PreparedStatement St2=null;
				ResultSet Results2=null;
				String Query2="insert into subjects values(?,?,CurDate(),?)";
				St2=Db.prepareStatement(Query2);
				St2.setInt(1, (Results.getInt(1)+1));
				St2.setString(2, SubjectName);
				St2.setInt(3, 1);
				St2.executeUpdate();
				Results2.close();
			}
		}
		else
		{
			Query="update subjects set sub_desc=? where subject_id=?";	
			St=Db.prepareStatement(Query);
			St.setString(1, SubjectName);
			St.setInt(2, SubjectId);
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
		Results.close();
		Db.close();
	}
	catch(Exception error)
	{
		System.out.println(error);
	}
%>
</body>
</html>