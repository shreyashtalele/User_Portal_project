package in.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



@WebServlet("/loginServlet")
public class loginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	 
		// Resources
		PreparedStatement preparedStatement = null;
		Connection connection = null;
		ResultSet resultset = null;
		RequestDispatcher rd = null;
		HttpSession session = request.getSession();
		
		String selectQuery = "select * from user where uname=? and password =?";
		
		String uname =  request.getParameter("username");
		String password =  request.getParameter("password");
		
		
		try {
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		try {
			String url="jdbc:mysql://localhost:3306/db";
			String user ="root";
			String pwd = "root";
			
			connection =DriverManager.getConnection(url,user,pwd);
			
			if (connection!=null) {
				
				preparedStatement = connection.prepareStatement(selectQuery);
				preparedStatement.setString(1,uname);
				preparedStatement.setString(2,password);
				
				resultset = preparedStatement.executeQuery();
				
			}
			if(resultset!=null)
			{
				if(resultset.next())
				{
					session.setAttribute("status", "success");
					session.setAttribute("id",resultset.getInt("id"));
					session.setAttribute("name",resultset.getString("name"));
					session.setAttribute("uname",resultset.getString("uname"));
					session.setAttribute("lname",resultset.getString("lname"));
					session.setAttribute("password",resultset.getString("password"));
					rd = request.getRequestDispatcher("welcome.jsp");
				}
				else {
					session.setAttribute("status", "fail");
					rd = request.getRequestDispatcher("index.jsp");
					
				}
				rd.forward(request, response);
			}
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
            		
	}

}
