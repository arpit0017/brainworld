<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body>
<%@page import="java.sql.*" %>

<div class="container scrollScreen">
			<table class="table table-responsive table-striped-gray-black text-center">
				<%
				PreparedStatement St=null;
				Connection Db=null;
				ResultSet Results=null;
				String Mode=request.getParameter("Mode");
				String Caller=request.getParameter("Caller");
				if(Mode.matches("edit"))
				{
					out.println("<tr>"+
							"<td>Add New Subject</td>"+
							"<td><button class=\"btn btn-primary SelectSubjectButtonFor"+Caller+"\" data-id=\"0\">Select</button></td>"+
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
					Query="select subject_id,sub_desc from subjects";
					St=Db.prepareStatement(Query);
					Results=St.executeQuery();
					while(Results.next())
					{
						out.println("<tr><td>"+Results.getString("sub_desc")+"</td>"+
									"<td><button class=\"btn btn-primary SelectSubjectButtonFor"+Caller+"\""+
									" data-id=\""+Results.getInt("subject_id")+"\">Select</button></td>");
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
</body>
</html>