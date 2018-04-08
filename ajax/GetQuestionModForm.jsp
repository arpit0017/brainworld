<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body>
<%@page import="java.sql.*" %>
<div class="container scrollScreen">
				<%
				int QuestionId=Integer.parseInt(request.getParameter("Question"));
				int SubjectId=Integer.parseInt(request.getParameter("Subject"));
				String QuesDesc=new String();
				String[] Options=new String[4];
				int TotalOptions=0, CorrectAnswer=0;
				int IsActive=0;
				
				if(QuestionId!=0)
				{
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
						Query="select q_desc,is_Active from questions where q_id=?";
						St=Db.prepareStatement(Query);
						St.setInt(1, QuestionId);
						Results=St.executeQuery();
						
						if(Results.next())
						{
							QuesDesc=Results.getString("q_desc");
							IsActive=Results.getInt("is_Active");
						}
						
						Results.close();
						
						Query="select qo_id, qo_desc, is_Answer from ques_opt where q_id=?";
						St=Db.prepareStatement(Query);
						St.setInt(1, QuestionId);
						Results=St.executeQuery();
						TotalOptions=0;
						while(Results.next())
						{
							Options[TotalOptions]=Results.getString(2);	
							if(Results.getInt("is_Answer")==1)
							{
								CorrectAnswer=TotalOptions;
								System.out.println(CorrectAnswer);
							}
							TotalOptions++;
						}
						Results.close();
						Db.close();
					}catch(SQLException Error)
					{
						System.out.println("SQL Exception in GetQuestionsModForm 101: "+Error);
					}
					catch(Exception Error)
					{
						System.out.println("General Exception in GetQuestionsModForm 101: "+Error);
					}
				}
				%>
			<div class="container col-sm-12">
				<%out.println("<input type=\"hidden\" id=\"SubjectId\" data-id=\""+SubjectId+"\">"); %>
				<%out.println("<input type=\"hidden\" id=\"QuestionId\" data-id=\""+QuestionId+"\">"); %>
				<%out.println("<input type=\"hidden\" id=\"TotalOptions\" data-total=\""+TotalOptions+"\">"); %>
				<div class="form-group"  style="color:#000;">
					<%out.println("<textarea id=\"QuesDesc\" class=\"input-lg center-block form-control\" rows=10>"+
					QuesDesc+
					"</textarea>");
					%>
					<div class="OptionsArea container-fluid col-sm-12">
					<%
					
						int i=0;
						for(i=0;i<TotalOptions;i++)
						{
							out.println("<div class=\"col-sm-6\">");
							out.println("<center><div class=\"radio\">");
							out.println("<label class=\"center-block\">");
							out.println("<input type=\"radio\" name=\"Options\" value=\""+i+"\""+
									((CorrectAnswer==i)?"checked":" ")+">");
							out.println("<input type=\"text\" palceholder=\"Enter Option here\""+
										"class=\"input-lg\" id=\"Option"+i+"\" value=\""+Options[i]+"\">");
							out.println("</label>");
							out.println("</div></center>");
							out.println("</div>");
						}
					%>
					</div>
					<%
					
					out.println("<div class=\"checkbox\">"+
									"<label><input type=\"checkbox\" "+((IsActive)==1?"checked":"")+">Active</label>"+
								"</div>");
											
					%>

				</div>
			</div>
			<% 
			if(QuestionId==0){
			out.println("<button class=\"btn btn-primary pull-right\" id=\"AddOptions\">Add Options</button>");
			}
			%>
	</div>
	<div class="pull-right" style="margin:20px">
				<button class="btn btn-success btn-lg" id="QuestionModPageSubmitButton">Submit</button>
				<button class="btn btn-lg btn-default" id="QuestionModPageBackButton">Back</button>
	</div>
</body>
</html>