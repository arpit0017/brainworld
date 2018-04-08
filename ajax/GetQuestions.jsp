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
				String Caller=request.getParameter("Caller");
				int SubjectId=Integer.parseInt(request.getParameter("Subject"));
				if(Mode.matches("edit"))
				{
					out.println("<tr>"+
							"<td>Add New Question</td>"+
							"<td><button class=\"btn btn-lg SelectQuestionButtonFor"+Caller+"\" data-id=\"0\">Select</button></td>"+
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
					Query="select q_id, q_desc from questions where subject_id=?";
					St=Db.prepareStatement(Query);
					St.setInt(1, SubjectId);
					Results=St.executeQuery();
					while(Results.next())
					{
						out.println("<tr><td><pre style=\"max-width:60vw;\">"+Results.getString("q_desc")+"</pre></td>"+
									"<td><button class=\"btn btn-lg SelectQuestionButtonFor"+Caller+"\""+
									" data-id=\""+Results.getInt("q_id")+"\">Select</button></td>");
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
				<button class="btn btn-lg btn-default" id="QuestionsViewPageBackButton">Back</button>
			</div>
</body>
</html>