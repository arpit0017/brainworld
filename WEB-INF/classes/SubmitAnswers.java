

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.sql.*;
import java.math.*;
/**
 * Servlet implementation class SubmitAnswers
 */
@WebServlet("/SubmitAnswers")
public class SubmitAnswers extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SubmitAnswers() {
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
		
		int MaxQues=Integer.parseInt(request.getParameter("MaxQues").toString());
		float TotalMarks=100f;
		int PassingMarks=40;
		float MarksForEachQuestion=(TotalMarks/MaxQues);
		int UserTestId=0;
		int IsPractice=0;
		try
		{
			UserTestId=Integer.parseInt(request.getParameter("UserTestId").toString());
			IsPractice=Integer.parseInt(request.getParameter("IsPractice").toString());
		}
		catch(NumberFormatException error)
		{
			System.out.println("Not a Practice Test");
		}
		catch(NullPointerException error)
		{
			System.out.println("Not a Practice Test");
		}
		int i=0;
		float Score=0f;
		String Value=new String();
		HttpSession sess=request.getSession(false);
		String Username=sess.getAttribute("Username").toString();
//	 	System.out.println(Username);

		PreparedStatement St=null;
		Connection Db=null;
		ResultSet Results=null,ResultsForQId=null;
		String Query=new String();
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
		while(i++ < MaxQues)
		{
			
			Value=request.getParameter(""+i+"");
			
			System.out.println(i+" "+Value);
			if(Value==null)
				continue;
			try
			{
				
				Query="select qo_desc,is_Answer from ques_opt where qo_id =?";
				St=Db.prepareStatement(Query);
				St.setInt(1,Integer.parseInt(Value));
				Results=St.executeQuery();
				//System.out.println("this"+Integer.parseInt(Value));
			}
			catch(SQLException error)
			{
				System.out.println("SQL Exception error 102 :\t"+error);
			}
			catch(Exception error)
			{
				System.out.println("Exception error 102:\t"+error);
			}
			Math.ceil(Score);
			//System.out.println("value of score:\t"+Score);
			try
			{
				if(Results.next())
				{
					if(IsPractice==0)
					{
						try
						{
							Query="select q_id from ques_opt where qo_id=?";
							St=Db.prepareStatement(Query);
							St.setInt(1, Integer.parseInt(Value));
							ResultsForQId=St.executeQuery();
							if(ResultsForQId.next())
							{
								Query="update usr_test_ques set usr_answer = ? where ut_id=? and q_id=?";
								St=Db.prepareStatement(Query);
								St.setString(1, Results.getString("qo_desc"));
								St.setInt(2,UserTestId);
								St.setInt(3,ResultsForQId.getInt("q_id"));
								St.executeUpdate();
								
							}
							//System.out.println("this"+Integer.parseInt(Value));
						}
						catch(SQLException error)
						{
							System.out.println("SQL Exception error 102 :\t"+error);
						}
						catch(Exception error)
						{
							System.out.println("Exception error 102:\t"+error);
						}
					}
					
					if(Results.getInt(2)==1)
					{
						Score+=MarksForEachQuestion;
					}
					
					
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
			if(IsPractice==0)
			{
				try
				{
					Query="update usr_tests set score=? ,grade=? where ut_id=?";
					St=Db.prepareStatement(Query);
					St.setInt(1, (int) Score);
					St.setString(2, (Score>PassingMarks)?"p":"f");
					St.setInt(3, UserTestId);
					St.executeUpdate();
				}
				catch(SQLException error)
				{
					System.out.println("SQL Exception 104:\t"+error);
				}
				catch(Exception error)
				{
					System.out.println("Exception 104:\t"+error);
				}
			}
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
		RequestDispatcher rd=request.getRequestDispatcher("Result.jsp");
			request.setAttribute("Score", (int)Score);
			if(Score>PassingMarks)
				request.setAttribute("PassOrFail","Pass");
			else
				request.setAttribute("PassOrFail", "Fail");
			try
			{
			rd.forward(request, response);
		}catch(Exception error){System.out.println("Error:\t"+error);}
	}
	
	
}
