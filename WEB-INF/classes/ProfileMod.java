

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.*;

/**
 * Servlet implementation class ProfileMod
 */
@WebServlet("/ProfileMod")
public class ProfileMod extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProfileMod() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String Fname=request.getParameter("Fname");
		String Lname=request.getParameter("Lname");
		String Email=request.getParameter("Email");
		String Username=request.getParameter("Username");
		String Phone=request.getParameter("Phone");
		//System.out.println(Fname+"\t"+Lname+"\t"+Email+"\t"+Username);
		
		Connection Db=null;
		PreparedStatement St=null;
		String Query=new String();
		ResultSet Results=null;
		String Domains[];
		String DomainString=new String();
		String QueryString=new String();
		
	
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Db=DriverManager.getConnection("jdbc:mysql://localhost/brainworld","root", "p@t@n@hi");
		}
		catch(SQLException error)
		{
			System.out.println("ProfileMod SQL Exception 101:\t"+error);
		}
		catch(ClassNotFoundException error)
		{
			System.out.println("ProfileMod Class Not Found Error 101:\t"+error);
		}
		catch(Exception error)
		{
			System.out.println("ProfileMod Exception 101:\t"+error);
		}
		
		try
		{
			Query="update users set fname=?,lname=?,email=?,phone=? where username=?";
			St=Db.prepareStatement(Query);
			St.setString(1, Fname);
			St.setString(2, Lname);
			St.setString(3, Email);
			St.setString(4, Phone);
			St.setString(5, Username);
			St.executeUpdate();
		}
		catch(SQLException error)
		{
			System.out.println("ProfileMod SQL Exception 102:\t"+error);
		}
		catch(Exception error)
		{
			System.out.println("ProfileMod Exception 102:\t"+error);
		}
		
		Domains=request.getParameterValues("Domains");
		int i=0;
		int DomainLength=0;
		try
		{
			DomainLength=Domains.length;
		}
		catch(NullPointerException error)
		{
			System.out.println("Null Pointer Exception: Error in Calculation of Domains.length: "+error);
			DomainLength=0;
			try
			{
				Query="delete from usr_sub where user_id=(select user_id from users where username=?)";
				St=Db.prepareStatement(Query);
				St.setString(1, Username);
				St.executeUpdate();
			}
			catch(SQLException err)
			{
				System.out.println("ProfileMod SQL Exception 103:\t"+err);
			}
			catch(Exception err)
			{
				System.out.println("ProfileMod Exception 103:\t"+err);
			}
			try
			{
				Db.close();
			}
			catch(SQLException err)
			{
				System.out.println("ProfileMod Exception error 106:\t"+err);
			}
			catch(Exception err)
			{
				System.out.println("ProfileMod Exception error 106:\t"+err);
			}
			RequestDispatcher Rd=null;
			try
			{
				request.setAttribute("Username", Username);
				Rd=request.getRequestDispatcher("Profile.jsp");
				Rd.forward(request, response);
			}
			catch(Exception err)
			{
				System.out.println("ProfileMod Exception error 104:\t"+err);
			}
			return;
		}
		if(DomainLength==0)
		{
			DomainString="0";
		}
		System.out.println("HERE: "+DomainLength);
		for(i=0;i<DomainLength;i++)
		{
			System.out.println("HERE!");
			DomainString+=Domains[i]+((i==DomainLength-1)?(""):(", "));
			QueryString+="Select "+(i+1)+((i==0)?(" N"):"")+" Union All ";
		}
		//System.out.println(QueryString.length());
		if(i!=0)
			{
				QueryString=QueryString.substring(0, (QueryString.length()-10));
			}
		//System.out.println(QueryString);
		String ToadString=new String();

		
		//String DeleteString="delete from usr_sub where subject_id not in("+DomainString+") and user_id=(select user_id from users where username='ankit')";
		//System.out.println(DomainString);
		//System.out.println(QueryString);
		System.out.println(ToadString);
		try
		{
			Query="delete from usr_sub where subject_id not in("+DomainString+") and user_id=(select user_id from users where username=?)";
			St=Db.prepareStatement(Query);
			St.setString(1, Username);
			St.executeUpdate();
		}
		catch(SQLException error)
		{
			System.out.println("ProfileMod SQL Exception 103:\t"+error);
		}
		catch(Exception error)
		{
			System.out.println("ProfileMod Exception 103:\t"+error);
		}
		int Max=0;
		try
		{
			Query="select max(usr_sub_id) from usr_sub";
			St=Db.prepareStatement(Query);
			Results=St.executeQuery();
			if(Results.next())
			{
				Max=Results.getInt(1);
			}
		}
		catch(SQLException error)
		{
			System.out.println("ProfileMod SQL Exception 104:\t"+error);
		}
		catch(Exception error)
		{
			System.out.println("ProfileMod Exception 104:\t"+error);
		}
		
		try
		{
			ToadString="insert into usr_sub select * from "+
					"(select @rownum:=@rownum+1 as pk,x.* from "+
					"( SELECT tablename.id, convert(SUBSTRING_INDEX(SUBSTRING_INDEX(tablename.sub_id, ',', numbers.n), "+
					"',', -1), unsigned integer) subject FROM ("+
					QueryString+
					") numbers INNER JOIN (select (select user_id from users where username=?) id, '"+DomainString+"' sub_id) "+
					"tablename ON CHAR_LENGTH(tablename.sub_id) "+
					"-CHAR_LENGTH(REPLACE(tablename.sub_id, ',', ''))>=numbers.n-1) x, "+
					"(SELECT @rownum:=?) r where not exists "+
					"(select us.subject_id from usr_sub us,users u where us.user_id=u.user_id and u.username = ? "+
					"and us.subject_id = x.subject) )b";
			St=Db.prepareStatement(ToadString);
			St.setInt(2, Max);
			St.setString(1, Username);
			St.setString(3, Username);
			St.executeUpdate();
		}
		catch(SQLException error)
		{
			System.out.println("ProfileMod SQL Exception 105:\t"+error);
		}
		catch(Exception error)
		{
			System.out.println("ProfileMod Exception 105\t"+error);
		}
		
		
		
		try
		{
			Db.close();
		}
		catch(SQLException error)
		{
			System.out.println("ProfileMod Exception error 106:\t"+error);
		}
		catch(Exception error)
		{
			System.out.println("ProfileMod Exception error 106:\t"+error);
		}
		
		RequestDispatcher Rd=null;
		try
		{
			request.setAttribute("Username", Username);
			Rd=request.getRequestDispatcher("Profile.jsp");
			Rd.forward(request, response);
		}
		catch(Exception error)
		{
			System.out.println("ProfileMod Exception error 104:\t"+error);
		}
	}

}
