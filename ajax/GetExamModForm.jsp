<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body>
<%@page import="java.sql.*" %>
<div class="container scrollScreen">
				<%
				int ExamId=Integer.parseInt(request.getParameter("ExamId"));
				int SubjectId=Integer.parseInt(request.getParameter("SubjectId"));
				if(ExamId==0)
				{
					out.println("<div class=\"container\" style=\"margin:20px;\">"+
							"<input type=\"hidden\" id=\"ExamId\" value=\""+ExamId+"\">"+
					"<input type=\"hidden\" id=\"SubjectId\" value=\""+SubjectId+"\">"+
					"<div class=\"form-group\">"+
					"<input type=\"text\" class=\"center-block input-lg\" style=\"color:#000\" name=\"ExamName\" id=\"ExamName\" placeholder=\"Exam Name\">"+
					"</div>"+
					"<div class=\"form-group\"><textarea name=\"ExamDesc\" class=\"center-block input-lg\""+
					"style=\"color:#000\" id=\"ExamDesc\">"+
					"</textarea></div>"+
					"<div class=\"form-group\"><input type=\"number\" class=\"center-block input-lg\""+
					"style=\"color:#000\" name=\"MaxScore\" placeholder=\"Maximum Marks\" id=\"MaxScore\">"+
					"</div>"+
					"<div class=\"form-group\"><input type=\"number\" class=\"center-block input-lg\" style=\"color:#000\""+
					"name=\"PassScore\" placeholder=\"Passing Marks\" id=\"PassScore\">"+
					"</div>"+
					"<div class=\"form-group\">"+        
						"<div class=\"col-sm-offset-2 col-sm-10\">"+
							"<div class=\"checkbox\">"+
								"<label><input type=\"checkbox\">Active</label>"+
							"</div>"+
						"</div>"+
					"</div>"+
					"<div class=\"form-group\">"+        
				      "<div >"+
				        ""+
				      "</div>"+
				    "</div>"+
				""+
				"</div>");		
				}
				else
			   {
//			 	System.out.println("Recorded Call For Subject Says Subject Id: "+SubjectId);
				
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
					Query="select t.test_name,t.test_desc,t.total_marks,t.passing_score,"+
							"is_Active from tests t where"+
							" t.test_id=?"	;	
					St=Db.prepareStatement(Query);
					St.setInt(1, ExamId);
					Results=St.executeQuery();
					
					if(Results.next())
					{
						out.println("<div class=\"container-fluid\" style=\"margin-top:20px;\">"+
								"<input type=\"hidden\" id=\"ExamId\" value=\""+ExamId+"\">"+
								"<input type=\"hidden\" id=\"SubjectId\" value=\""+SubjectId+"\">"+
						"<div class=\"form-group\">"+
						"<input type=\"text\" class=\"center-block input-lg\" style=\"color:#000\""+
						"name=\"ExamName\" id=\"ExamName\" value=\""+Results.getString("test_name")+
						"\" placeholder=\"Exam Name\">"+
						"</div>"+
						"<div class=\"form-group\" style=\"margin-top:10px;\">"+
						"<textarea class=\"center-block input-lg\" style=\"color:#000\""+
						"name=\"ExamDesc\" id=\"ExamDesc\""+
						">"+Results.getString("test_desc")+
						"</textarea></div>"+
						"<div class=\"form-group\">"+
						"<input type=\"number\" class=\"center-block input-lg\" style=\"color:#000\""+
						"name=\"MaxScore\" placeholder=\"Maximum Marks\""+
						"id=\"MaxScore\" value=\""+Results.getInt("total_marks")+"\">"+
						"</div>"+
						"<div class=\"form-group\">"+
						"<input type=\"number\" class=\"center-block input-lg\" style=\"color:#000\""+
						"name=\"PassScore\" placeholder=\"Passing Marks\""+
						"id=\"PassScore\" value=\""+Results.getInt("passing_score")+"\">"+
						"</div>"+
						"<div class=\"form-group\">"+        
							"<div class=\"col-sm-offset-2 col-sm-10\">"+
								"<div class=\"checkbox\">"+
									"<label><input type=\"checkbox\" "+((Results.getInt("is_Active"))==1?"checked":"")+">Active</label>"+
								"</div>"+
							"</div>"+
						"</div>"+
						"<div class=\"form-group\">"+        
					      "<div >"+
					        ""+
					      "</div>"+
					    "</div>"+
					""+
					"</div>");
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
			   }
			%>
			<%
				
			%>
	</div>
	<div class="pull-right" style="margin:20px">
		<button class="btn btn-success btn-lg" id="ExamModPageSubmitButton">Submit</button>
		<button class="btn btn-lg btn-default" id="ExamModPageBackButton">Back</button>
	</div>
</body>
</html>