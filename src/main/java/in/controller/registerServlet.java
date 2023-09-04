package in.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/registerServlet")
public class registerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Resources
		
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		String insertQuery = "insert into user(`uname`,`lname`,`name`,`password`) values(?,?,?,?)";
		int Affectedrow;
		RequestDispatcher rd = null;
		
		String name =  request.getParameter("name");
		String uname =  request.getParameter("uname");
		String lname =  request.getParameter("lname");
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
			
			if(connection!=null) {
			preparedStatement = connection.prepareStatement(insertQuery);
			
			preparedStatement.setString(1,uname);
			preparedStatement.setString(2,lname);
			preparedStatement.setString(3,name);
			preparedStatement.setString(4,password);
			rd = request.getRequestDispatcher("register.jsp");
			
			Affectedrow = preparedStatement.executeUpdate();
			
			if(Affectedrow>0)
			{
				request.setAttribute("status","success");
			}
			else {
				request.setAttribute("status","fail");
			}
			
			rd.forward(request, response);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			try {
				connection.close();
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
		}

	}

}
