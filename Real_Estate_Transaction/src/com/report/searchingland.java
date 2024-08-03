package com.report;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.connection.Dbconn;

/**
 * Servlet implementation class searchingland
 */
@WebServlet("/searchingland")
public class searchingland extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public static String origional="";
	public static String Village_Name;
	public static String Taluka;
	public static String District;
	public static String Final_Land_Area;
	public static String Name;
	public static String number7;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public searchingland() {
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
		String number=request.getParameter("number");
		PrintWriter pw=response.getWriter();
		String candidateid="";
		   int BUFFER_SIZE = 1024*100;
     	Connection connection;
			try {
				connection = Dbconn.conn();
			
         Statement statement = connection.createStatement();
         ResultSet result1 =statement.executeQuery("select * from tblpdfdata where Number7Data='"+number+"' ") ; 
			if(result1.next())
				  {
				Name=result1.getString("Name");
				Village_Name= result1.getString("Village_name");
				Taluka= result1.getString("Taluka_name");
				District= result1.getString("Dist_name");
				Final_Land_Area=result1.getString("Final_Land_Area");
				number7=result1.getString("Number7Data");
				candidateid=result1.getString("Id");
				
		                // gets file name and file blob data
		                String fileName = result1.getString("FileName");
		                Blob blob = result1.getBlob("File_Data");
		                InputStream inputStream = blob.getBinaryStream();
		                int fileLength = inputStream.available();
		                 
		                System.out.println("fileLength = " + fileLength);
		 
		 
		                System.out.println(candidateid+"=>"+Name+"=>"+Village_Name+"=>"+Taluka+"=>"+District+"=>"+Final_Land_Area);
		    			reportshow.createreport(candidateid,Name,Village_Name, Taluka, District,Final_Land_Area,number7);
		    			
		            } else {
		            	pw.println("<html><script>alert('Area Not Valid');</script><body>");
						pw.println("");
						pw.println("</body></html>"); 
		            }
			
			
			
			
			RequestDispatcher rd = request
					.getRequestDispatcher("/UserHome.jsp");
			rd.include(request, response);
			 
			
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}

}
