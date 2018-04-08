

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class InsertQuestions
 */
@WebServlet("/InsertQuestions")
public class InsertQuestions extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertQuestions() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String url="jdbc:mysql://localhost/brainworld";
		String user="root", password="p@t@n@hi";
		
		String Question=request.getParameter("question");
		int TargetTest=Integer.parseInt(request.getParameter("TargetTest"));
		String Options[]=new String[4];
		Options[0]=request.getParameter("Option1");
		Options[1]=request.getParameter("Option2");
		Options[2]=request.getParameter("Option3");
		Options[3]=request.getParameter("Option4");
		
		int IsAnswer=Integer.parseInt(request.getParameter("isAnswer"));
		//String Temp=Question;
		Question = Question.replace("<", "&lt");
		Question = Question.replace(">", "&gt");
		
		System.out.println(Question);
		
		int MaxQuesCount=0;
		int MaxTestQuesCount=0;
		int MaxQuesOptCount=0;
//		if(Temp.matches(Question))
//		{
//			System.out.println("Question Same... Question insertion Aborted!");
//			return;
//		}
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
			query="select max(q_id) from questions";
			DataRequest=Db.prepareStatement(query);
			Results=DataRequest.executeQuery();
			if(Results.next())
			{
				MaxQuesCount=Results.getInt(1);
			}
			MaxQuesCount+=1;
			query="insert into questions(q_id,subject_id,q_desc,is_Active) value(?,?,?,?)";
			DataRequest=Db.prepareStatement(query);
			DataRequest.setInt(1, MaxQuesCount);
			DataRequest.setInt(2, 1);
			DataRequest.setString(3, Question);
			DataRequest.setInt(4, 1);
//			DataRequest.setString(5, Email);
			
			DataRequest.executeUpdate();
		}
		catch(SQLException error)
		{
			System.out.println("SQL Error occurred in updating database! 1:\t"+error);
		}
		catch(Exception error)
		{
			System.out.println("Error occurred in updating database!:\t"+error);
		}
		try
		{
			query="select max(tq_id) from test_ques";
			DataRequest=Db.prepareStatement(query);
			Results=DataRequest.executeQuery();
			if(Results.next())
			{
				MaxTestQuesCount=Results.getInt(1);
			}
			MaxTestQuesCount+=1;
			query="insert into test_ques(tq_id,test_id,q_id) value(?,?,?)";
			DataRequest=Db.prepareStatement(query);
			DataRequest.setInt(1, MaxTestQuesCount);
			DataRequest.setInt(2, TargetTest);
			DataRequest.setInt(3, MaxQuesCount);
			
			//DataRequest.setInt(4, 1);
//			DataRequest.setString(5, Email);
			
			DataRequest.executeUpdate();
		}
		catch(SQLException error)
		{
			System.out.println("SQL Error occurred in updating database! 2:\t"+error);
		}
		catch(Exception error)
		{
			System.out.println("Error occurred in updating database!:\t"+error);
		}
		try
		{
			query="select max(qo_id) from ques_opt";
			DataRequest=Db.prepareStatement(query);
			Results=DataRequest.executeQuery();
			if(Results.next())
			{
				MaxQuesOptCount=Results.getInt(1);
			}
		}catch(Exception error)
		{
			System.out.println("Error:\t"+error);
		}
		
			
		int i=0;
		while(i<4)
		{
			try
			{
				query="insert into ques_opt(qo_id,q_id,qo_desc,is_Answer,is_Active) value(?,?,?,?,?)";
				DataRequest=Db.prepareStatement(query);
				System.out.println("MaxQuesOptCount:\t"+MaxQuesOptCount);
				DataRequest.setInt(1, ++MaxQuesOptCount);
				DataRequest.setInt(2, MaxQuesCount);
				DataRequest.setString(3,Options[i] );
				DataRequest.setInt(4, ((IsAnswer==i+1)?1:0));
				DataRequest.setInt(5, 1);
				
				//DataRequest.setInt(4, 1);
	//			DataRequest.setString(5, Email);
				
				DataRequest.executeUpdate();
			}
			catch(SQLException error)
			{
				System.out.println("SQL Error occurred in updating database! 3:\t"+error);
			}
			catch(Exception error)
			{
				System.out.println("Error occurred in updating database!:\t"+error);
			}
			i++;
		}
		
		
		try
		{
			Db.close();
		}
		catch(Exception error)
		{
			System.out.println("Error:"+error);
		}
		rd = request.getRequestDispatcher("InsertQuestions.jsp");
//		request.setAttribute("Username", Username);
		rd.forward(request, response);
	}
	

}
