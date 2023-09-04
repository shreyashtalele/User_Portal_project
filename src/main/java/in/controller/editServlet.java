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
import javax.servlet.http.HttpSession;

import com.mysql.cj.Session;


@WebServlet("/editServlet")
public class editServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String name = request.getParameter("name");
		String uname = request.getParameter("uname");
		String password = request.getParameter("password");
		
		HttpSession session = request.getSession();
		String oldname= (String) session.getAttribute("uname");
		String oldpwd =   (String) session.getAttribute("password");
		
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		String updateQuery = "update user set name=?,uname=?,password=? where id=?";
		int Affectedrow;
		RequestDispatcher rd = null;
		
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
				preparedStatement = connection.prepareStatement(updateQuery);
				
				preparedStatement.setString(1,name);
				preparedStatement.setString(2,uname);
				preparedStatement.setString(3,password);
				
				preparedStatement.setInt(4, (int)session.getAttribute("id"));
				
				
				
				rd = request.getRequestDispatcher("edit.jsp");
				
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


