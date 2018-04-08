

import java.io.IOException;
import java.sql.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class RegisterForExam
 */
@WebServlet("/RegisterForExam")
public class RegisterForExam extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterForExam() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		HttpSession sess=request.getSession(false);
		String Username=sess.getAttribute("Username").toString();
		System.out.println(Username);
		
		int NewTestNumber=0;
		int TestId=Integer.parseInt(request.getParameter("TestId"));
		
		int IsPractice=Integer.parseInt(request.getParameter("isPractice"));
		System.out.println(" "+TestId);
		String Query=new String();
		
		if(IsPractice==1)
		{
			RequestDispatcher rd;
			rd = request.getRequestDispatcher("PracticeExam.jsp");
			request.setAttribute("TestId", TestId);
			rd.forward(request, response);
			return;
		}
		Connection Db=null;
		PreparedStatement St=null;
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
		
		//------------------------GettingLastUserTestID--------------------------
		try
		{
			Query="select max(ut_id) from usr_tests";
			St=Db.prepareStatement(Query);
			Results=St.executeQuery();
		}
		catch(SQLException error)
		{
			System.out.println("SQL Exception error 102 :\t"+error);
		}
		catch(Exception error)
		{
			System.out.println("Exception error 102:\t"+error);
		}
		
		try
		{
			if(Results.next())
			{
				NewTestNumber=Results.getInt(1);
				NewTestNumber+=1;
			}
			else
			{
				System.out.println("Impossible!:No Data Found!Check Code Again!");
			}
		}
		catch(SQLException error)
		{
			System.out.println("SQL Exception error 103:\t"+error);
		}
		catch(Exception error)
		{
			System.out.println("Exception error 103:\t"+error);
		}
		
		//------------------------DataInsertionSegment--------------------------
		try
		{
			Query="insert into usr_tests(user_id, test_id, test_date, score, grade) select user_id,?,CurDate(),0,'F' from users u where u.username=?";
			St=Db.prepareStatement(Query);
			// St.setInt(1, NewTestNumber);
			St.setInt(1,TestId);
			St.setString(2, Username);
			St.executeUpdate();
			Query = "select max(ut_id) from usr_tests where user_id = (select user_id from users where username = ?)";
			St = Db.prepareStatement(Query);
			St.setString(1, Username);
			Results = St.executeQuery();
			if(Results.next()){
				NewTestNumber = Results.getInt(1);
				System.out.println("New Test number is " + NewTestNumber);
			}else{
				System.out.println("Could not find new test number");
			}
		}
		catch(SQLException error)
		{
			System.out.println("SQL Exception error 102 :\t"+error);
		}
		catch(Exception error)
		{
			System.out.println("Exception error 102:\t"+error);
		}
		RequestDispatcher rd;
		rd = request.getRequestDispatcher("Exam.jsp");
		request.setAttribute("TestId", TestId);
		request.setAttribute("UserTestId", NewTestNumber);
		rd.forward(request, response);
	
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

}
