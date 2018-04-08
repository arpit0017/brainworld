<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@page import="java.sql.*"%>
<%

String str=request.getParameter("str");
//System.out.println(str);
String Value;

if(str.length()<5)
{
	out.println("Username must be atleast 5 characters long");
	return;
}


PreparedStatement DataRequest;
Connection Db=null;
ResultSet Results=null ;
String query;

try
{
		Class.forName("com.mysql.jdbc.Driver");
		Db=DriverManager.getConnection("jdbc:mysql://localhost/brainworld","root","p@t@n@hi");
}
catch(ClassNotFoundException error)
{
	out.println("\nClass Not Found Error:\t" + error);
}
catch(SQLException error)
{
	out.println("\nSQL Error 101!" + error);
}
try
{
	query="Select username from users where username=?";
	DataRequest = Db.prepareStatement(query);
	DataRequest.setString(1,str);
	Results = DataRequest.executeQuery();
	if(Results.next())
	{
		out.println("User Exists! Try out a diffrent name!");
	}
	else
	{
		out.println("Available!");
	}

}
catch(SQLException error)
{
	out.println("\nSQL Exception 102:\t"+error);
}
catch(Exception error)
{
	out.println(error);
}
%>
</body>
</html>