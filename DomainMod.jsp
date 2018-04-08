<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

</head>
<body>
<%@page import="java.sql.*" %>
<%
	String GetSubject=new String();
	int GetSubjectId=0;
	String Check=new String();
	PreparedStatement St=null;
	Connection Db=null;
	ResultSet Results=null;
	String Query=new String();
	
	String GetState=request.getParameter("State");
	String GetData=request.getParameter("Data");
	//System.out.println(GetState+"\n"+GetData);
	
	
	
	HttpSession sess=request.getSession(false);
	String Username=sess.getAttribute("Username").toString();
	
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
	
// 	try{
// 		Query="select sub_desc from subjects s, usr_sub us, users u where us.user_id = u.user_id and us.subject_id=s.subject_id and username=?";
// 		St=Db.prepareStatement(Query);
// 		St.setString(1, Username);
// 		Results=St.executeQuery();
// 		while(Results.next())
// 		{
// 			GetSubject=Results.getString("sub_desc");
// 			out.println("<span class=\"label label-default\">"+GetSubject+"<a href=\"#\"><span class=\"glyphicon glyphicon-remove text-danger\" style=\"padding:2px;margin:2px;\"></span></a></span>");
// 		}
// 	}
// 	catch(SQLException error)
// 	{
// 		System.out.println("Profile SQL Exception 104:\t"+error);
// 	}
// 	catch(Exception error)
// 	{
// 		System.out.println("Profile Exception 104:\t"+error);
// 	}
		
		

	
%>

<div id="edit-domain">
	<%
	try
	{
// 		Query="select s.subject_id, s.sub_desc from subjects s where s.subject_id not in"+
// 		"( select subject_id from usr_sub us,users u where us.user_id=u.user_id and u.username=?)";
		Query="select s.subject_id, s.sub_desc, us.user_id "+
				"from subjects s left outer join"+
				"(select us.user_id, subject_id from usr_sub us, users u where us.user_id = u.user_id and u.username= ?) us "+
				"on s.subject_id=us.subject_id order by -user_id desc,sub_desc";
		St=Db.prepareStatement(Query);
		St.setString(1, Username);
		Results=St.executeQuery();
		while(Results.next())
		{
			Check="";
			//out.println("user_id:"+Results.getInt("user_id"));
			if(Results.getInt("user_id")!=0)
			{
				Check="checked";
			}
			GetSubjectId=Results.getInt("subject_id");
			GetSubject=	Results.getString("sub_desc");
			out.println("<label class=\"checkbox-inline\" id=\"checkbox"+GetSubjectId+"\"><input type=\"checkbox\" class=\"domainBox\" name=\"Domains\" data-SubId=\""+GetSubjectId+"\" value="+GetSubjectId+" "+Check+">");
			out.println(GetSubject+"</label>");
		}
	}
	catch(SQLException error)
	{
		System.out.println("Profile SQL Exception error 105:\t"+error);
	}
	catch(Exception error)
	{
		System.out.println("Profile Exception error 105:\t"+error);
	}
	
	%>
	
</div>
</body>
</html>