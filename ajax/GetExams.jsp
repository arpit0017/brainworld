<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body>
<%@page import="java.sql.*" %>

<div class="container scrollScreen">
			<table class="table table-responsive text-center" style="color:#fff;">
				<%
				PreparedStatement St=null;
				Connection Db=null;
				ResultSet Results=null;
				String Mode=request.getParameter("Mode");
				int SubjectId=Integer.parseInt(request.getParameter("Subject"));
				System.out.println("Recorder value for request of exams: "+SubjectId);
				if(Mode.matches("edit"))
				{
					out.println("<tr>"+
							"<td>Add New Exam</td>"+
							"<td><button class=\"btn btn-lg SelectExamButton\" data-subjectid=\""+SubjectId+"\" data-id=\"0\">Select</button></td>"+
						"</tr>");
				}
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
					Query="select test_id,test_name from tests where subject_id=?";
					St=Db.prepareStatement(Query);
					St.setInt(1, SubjectId);
					Results=St.executeQuery();
					while(Results.next())
					{
						out.println("<tr><td>"+Results.getString("test_name")+"</td>"+
									"<td><button class=\"btn btn-lg SelectExamButton\""+
									"data-subjectid=\""+SubjectId+"\" data-id=\""+Results.getInt("test_id")+"\">Select</button></td>");
					}
					
				}
				catch(SQLException error)
				{
					System.out.println("SQL ERROR: "+error);
				}
				catch(Exception error)
				{
					System.out.println("General Error "+error);
				}
				
				try
				{
					Results.close();
					Db.close();
				}
				catch(Exception error)
				{
					System.out.println("Error Closing connections: "+error);
				}
			%>
			</table>
			</div>
			<div class="pull-right" style="margin:20px">
				<button class="btn btn-lg btn-default" id="ExamViewPageBackButton">Back</button>
			</div>
</body>
</html>