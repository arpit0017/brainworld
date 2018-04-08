
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.*;

/**
 * Servlet implementation class login
 */
@WebServlet("/login")
public class login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public login() {
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
		String Username = request.getParameter("username");
		String Password=request.getParameter("password");
		System.out.println("Username : " + Username);
		System.out.println("Password : " + Password);
		PreparedStatement DataRequest=null;
		Connection Db=null;
		ResultSet results=null;
		RequestDispatcher rd=null;
		
		String Role=new String();
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Db=DriverManager.getConnection("jdbc:mysql://localhost/brainworld","root","p@t@n@hi");
		}
		catch(SQLException error)
		{
			System.out.println("SQL Exception 101: \t"+error);
		}
		catch(ClassNotFoundException error)
		{
			System.out.println("Class Not Found 101:\t"+error);
			
		}
		catch(Exception error)
		{
			System.out.println("General Exception 101:\t"+error);
		}
		
		try
		{
			String Querry="select p.password from users u,password p where u.user_id=p.user_id and p.is_active = 1 and username = BINARY ?";
			DataRequest=Db.prepareStatement(Querry);
			DataRequest.setString(1, Username);
			results=DataRequest.executeQuery();
			if(results.next())
			{
				if(Password.matches(results.getString(1)))
				{
					try
					{
						String Query2="select role from users where username = BINARY ?";
						DataRequest=Db.prepareStatement(Query2);
						DataRequest.setString(1, Username);
						results=DataRequest.executeQuery();
						if(results.next())
						{
							Role=results.getString(1);
							Db.close();
							request.setAttribute("Username", Username);
							request.setAttribute("Role",Role);
							System.out.println("Sendng to Home");
							rd=request.getRequestDispatcher("Home.jsp");
							rd.forward(request, response);
						}
						
					}
					catch(SQLException error)
					{
						System.out.println("SQL Exception 102:\t"+error);
					}
					catch(Exception error)
					{
						System.out.println("Exception error 102:\t"+error);
					}
					
				}
				else
				{
					Db.close();
					request.setAttribute("ErrorCode", 0);		//Password Incorrect
					rd=request.getRequestDispatcher("Login.jsp");
					rd.forward(request, response);
				}
			}
			else
			{
				Db.close();
				request.setAttribute("ErrorCode",1);			//User not found
				rd=request.getRequestDispatcher("Login.jsp");
				rd.forward(request,response);
				
			}
			
		}
		catch(SQLException error)
		{
			System.out.println("SQL Exception 102:\t"+error);
		}
		catch(Exception error)
		{
			System.out.println("Exception error 102:\t"+error);
		}
		
		
	}

}
