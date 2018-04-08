<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body>
	<%@ page import="java.sql.*"%>
	<%@ page import="java.util.*"%>
	<%
	int SubjectId=Integer.parseInt(request.getParameter("Subject"));
	int QuestionId=Integer.parseInt(request.getParameter("QID"));
	String Question=request.getParameter("Question");
// 	String Options=request.getParameter("OptionValues");
	int CorrectOption=Integer.parseInt(request.getParameter("Correct"));
	int IsActive=Integer.parseInt(request.getParameter("IsActive"));
	
String[] Options = request.getParameterValues("Options[]");
for (int i=0; i < Options.length; ++i) {
   System.out.println(Options[i]+((i==CorrectOption)?" Correct":"")); 
   
}

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
		if(QuestionId==0)
		{
			Query="select max(q_id) from questions";
			St=Db.prepareStatement(Query);
			Results=St.executeQuery();
			int MaxQId=0;
			if(Results.next())
			{
				PreparedStatement St2=null;
				MaxQId=Results.getInt(1);
				System.out.println("MaxQId: "+MaxQId);
				String Query2="insert into questions values(?,?,?,?,NOW())";
				St2=Db.prepareStatement(Query2);
				St2.setInt(1,(MaxQId+1));
				St2.setInt(2, SubjectId);
				St2.setString(3,Question);
				St2.setInt(4, IsActive);
				St2.execute();
				
			}
			Query="select max(qo_id) from ques_opt";
			St=Db.prepareStatement(Query);
			Results=St.executeQuery();
			if(Results.next())
			{
				int MaxQoId=Results.getInt(1);
				PreparedStatement St2=null;
				String Query2=new String();
				System.out.println("MaxQId="+MaxQId);
				for (int j=0; j < Options.length; ++j)
				{
					Query="insert into ques_opt values(?,?,?,?,1)";
					St2=Db.prepareStatement(Query);
					St2.setInt(1, ++MaxQoId);
					St2.setInt(2,(MaxQId+1));
					St2.setString(3,Options[j]);
					St2.setInt(4,((j==CorrectOption)?1:0));
					System.out.println(Options[j]+((j==CorrectOption)?" Correct":""));
					St2.executeUpdate();
					   
				}
				St2.close();
				
			}
		}
		else
		{
			Query="update questions set q_desc=?, is_Active=?, date_added=NOW() where q_id=?";	
			St=Db.prepareStatement(Query);
			St.setString(1, Question);
			St.setInt(2, IsActive);
			St.setInt(3, QuestionId);
			St.executeUpdate();
// 			Query="select count(*) from ques_opt where q_id = ?";
// 			St=Db.prepareStatement(Query);
// 			St.setInt(1,QuestionId);
// 			ResultSet res=St.executeQuery();
// 			int MaxOpt=0, MaxQoId=0;
// 			if(res.next())
// 			{
// 				MaxOpt=res.getInt(1);
// 			}
// 			Query="select max(qo_id) from ques_opt";
// 			St=Db.prepareStatement(Query);
// 			res=St.executeQuery();
// 			if(res.next())
// 			{
// 				MaxQoId = res.getInt(1);
// 			}
			
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