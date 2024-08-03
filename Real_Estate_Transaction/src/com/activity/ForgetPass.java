package com.activity;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.connection.Dbconn;
import com.connection.SendMail;

/**
 * Servlet implementation class ForgetPass
 */
@WebServlet("/ForgetPass")
public class ForgetPass extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ForgetPass() {
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
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		String username=request.getParameter("txt_Uname");
		String e=request.getParameter("txt_Email");
		
		try 
		{
			Connection con=Dbconn.conn();
			Statement st=con.createStatement();
			String q="select * from userregistration where Uemail='"+e+"'";
			ResultSet i=st.executeQuery(q);
			
			if(i.next())
			{
				String password=i.getString("Upassword");
				SendMail.Sendforgetpassword(e,password);
				out.println("<script type=\"text/javascript\">");  
				out.println("alert('Send Password');");  
				out.println("</script>");
				response.sendRedirect("LoginPage.jsp");
				
			}	
			else 
			{
				out.println("<script type=\"text/javascript\">");  
				out.println("alert('Email ID doesnot exist. Provide Correct Email ID');");  
				out.println("</script>");    
				request.getRequestDispatcher("/ForgetPassword.jsp").include(request, response);
			}
		} 
		catch (Exception e2)
		{
			e2.printStackTrace();
		}
	

	}

}
