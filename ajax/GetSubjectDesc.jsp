<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body>
<%@ page import="java.sql.*"%>
<%
	int SubjectId=Integer.parseInt(request.getParameter("id"));
	
	if(SubjectId==0)
	{
		out.println("<div class=\"container\" style=\"margin:20px;\">"+
				"<input type=\"hidden\" id=\"SubjectId\" value=\""+SubjectId+"\">"+
		"<div class=\"col-sm-12\">"+
		"<input type=\"text\" class=\"center-block input-lg\" style=\"color:#000\" name=\"SubName\" id=\"SubName\" placeholder=\"Subject Name\">"+
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
// 	System.out.println("Recorded Call For Subject Says Subject Id: "+SubjectId);
	
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
		Query="select sub_desc,is_Active from subjects where subject_id=?";	
		St=Db.prepareStatement(Query);
		St.setInt(1, SubjectId);
		Results=St.executeQuery();
		
		if(Results.next())
		{
			out.println("<div class=\"container-fluid\" style=\"margin-top:20px;\">"+
					"<input type=\"hidden\" id=\"SubjectId\" value=\""+SubjectId+"\">"+
			"<div class=\"col-sm-12\">"+
			"<input type=\"text\" class=\"center-block input-lg\" style=\"color:#000\" name=\"SubName\" id=\"SubName\" value=\""+Results.getString("sub_desc")+"\" placeholder=\"Subject Name\">"+
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
<div class="pull-right" style="margin:20px;">
	<button class="btn btn-success btn-lg" id="SubjectModPageSubmitButton">Submit</button>
	<button class="btn btn-lg btn-default" id="SubjectModPageBackButton">Back</button>
</div>
</body>
</html>