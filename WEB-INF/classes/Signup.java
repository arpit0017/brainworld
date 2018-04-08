

import java.io.IOException;
import java.sql.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Signup
 */
@WebServlet("/Signup")
public class Signup extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Signup() {
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
		String url="jdbc:mysql://localhost/brainworld";
		String user="root", password="p@t@n@hi";
		
		String FName=request.getParameter("fname");
		String LName=request.getParameter("lname");
		String Email=request.getParameter("email");
		String Username=request.getParameter("username");
		String Pass=request.getParameter("password");
		
		PreparedStatement DataRequest;
		Connection Db=null;
		ResultSet Results=null ;
		String query;
		RequestDispatcher rd;
		
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Db=DriverManager.getConnection(url,user,password);
		}
		catch(SQLException error)
		{
			System.out.println("SQL Error 101:\t"+error);
		}
		catch(ClassNotFoundException error)
		{
			System.out.println("Class Not Found 101:\t"+error);
		}
		catch(Exception error)
		{
			System.out.println("Error 101:\t"+error);
		}
		try
		{
			query="select count(*) from users where username=BINARY ?";
			DataRequest=Db.prepareStatement(query);
			DataRequest.setString(1, Username);
			Results=DataRequest.executeQuery();
			if(Results.next())
			{
				if(Results.getInt(1)!=0)
				{
					try{
						Db.close();
					}catch(Exception error)
					{
						System.out.println("ERROR :\t"+error);
					}
					rd = request.getRequestDispatcher("Signup.jsp");
					request.setAttribute("Error", 2);
					rd.forward(request, response);
					return;
				}
			}
			int MaxCount=0;
			query="select max(user_id) from users";
			DataRequest=Db.prepareStatement(query);
			Results=DataRequest.executeQuery();
			if(Results.next())
			{
				MaxCount=Results.getInt(1);
			}
			MaxCount+=1;
			query="insert into users(user_id,username,fname,lname,email, role) value(?, ?, ?, ?, ?, ?)";
			DataRequest=Db.prepareStatement(query);
			DataRequest.setInt(1, MaxCount);
			DataRequest.setString(2, Username);
			DataRequest.setString(3, FName);
			DataRequest.setString(4, LName);
			DataRequest.setString(5, Email);
			DataRequest.setString(6, "user");
			DataRequest.executeUpdate();
			CallableStatement cs = Db.prepareCall("{call insertPassword(?, ?)}");			
			cs.setString(1, Pass);
			cs.setInt(2, MaxCount);
			cs.execute();
		}
		catch(SQLException error)
		{
			System.out.println("SQL Error occurred in updating database!:\t"+error);
		}
		catch(Exception error)
		{
			System.out.println("Error occurred in updating database!:\t"+error);
		}
		
		rd = request.getRequestDispatcher("Home.jsp");
		request.setAttribute("Username", Username);
		request.setAttribute("Role", "user");
		rd.forward(request, response);
	}

}
