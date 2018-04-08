<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page import="java.sql.*"%>
<%
	String SortingElement=request.getParameter("Element");
	String SortingType=request.getParameter("Type");
	String Filter=request.getParameter("Filter");
	
	System.out.println(SortingElement+" "+SortingType);
	
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
	
%>
<%
	String Query=new String();
	try
	{
		Query="    select username,sub_desc,test_desc,test_date,total_marks, score,grade "+
			    "from users u,subjects s, usr_tests ut, tests t "+
			    "where t.subject_id = s.subject_id and ut.test_id = t.test_id "+
			    "and u.user_id=ut.user_id "+Filter+" order by "+SortingElement+" "+
			    SortingType+"";
		St=Db.prepareStatement(Query);
		Results=St.executeQuery();
		
		while(Results.next())
		{
			out.println("<tr>");
			out.println("<td>"+Results.getString("username")+"</td>");
			out.println("<td>"+Results.getString("sub_desc")+"</td>");
			out.println("<td>"+Results.getString("test_desc")+"</td>");
			out.println("<td>"+Results.getString("test_date")+"</td>");
			out.println("<td>"+Results.getString("total_marks")+"</td>");
			out.println("<td>"+Results.getString("score")+"</td>");
			out.println("<td>"+Results.getString("grade")+"</td>");
			out.println("</tr>");
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
