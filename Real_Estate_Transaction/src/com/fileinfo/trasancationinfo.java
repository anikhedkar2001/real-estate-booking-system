package com.fileinfo;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Blockchain.Block;
import Blockchain.ChainConsensus;
import Blockchain.ptop;

import com.connection.Dbconn;

/**
 * Servlet implementation class trasancationinfo
 */
@WebServlet("/trasancationinfo")
public class trasancationinfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public trasancationinfo() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection con;
		HttpSession session=request.getSession(true);
		PrintWriter pw=response.getWriter();
		String emailid=(String)session.getAttribute("email");
		String candidateid=request.getParameter("candidateid");
		String uploadDates=null,number=null,Owner_Name=null,FileName=null;
		String Village_name=null,Taluka_name=null,Dist_name=null,Land_area=null,Email_ID=null,Number7Data=null;
		String landsale=request.getParameter("land_sale");
		String Directions=request.getParameter("directions");
		String Uname=null,Umobno=null;
		try
		{
			con = Dbconn.conn();
			Statement stRegister=con.createStatement();
			ResultSet rsLogin;
			rsLogin=stRegister.executeQuery("select * from userregistration where Uemail='" +emailid+ "'");
			if(rsLogin.next())
			{
				Uname=rsLogin.getString("Uname");
				Umobno=rsLogin.getString("Umobno");
				RequestDispatcher rd = request.getRequestDispatcher("/UserHome.jsp");
				rd.include(request, response); 
								
			}
			Statement statement = con.createStatement();
            ResultSet result1 =statement.executeQuery("select * from tblpdfdata where Id='"+candidateid+"' ") ; 
			if(result1.next())
				  {
				uploadDates=result1.getString("Current_Data");
				number=result1.getString("Number7Data");
				Owner_Name=result1.getString("Name");
				FileName=result1.getString("FileName");
				Village_name=result1.getString("Village_name");
				Taluka_name=result1.getString("Taluka_name");
				Dist_name=result1.getString("Dist_name");
				Land_area=result1.getString("Land_area");
				Email_ID=result1.getString("Email_ID");
				  }
			double landsales=Double.parseDouble(landsale);
			double oldlandsales=Double.parseDouble(Land_area);
			
			if(landsales<oldlandsales)
			{
				double finallandsales=oldlandsales-landsales;
				Statement st01 = con.createStatement();
				Statement st02 = con.createStatement();
				Statement st03= con.createStatement();
				SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
				Date date = new Date();
				String strDate= formatter.format(date);
				st01.executeUpdate("update tblpdfdata set Land_area='"+finallandsales+"',Current_Data='"+strDate+"',Land_Sale='"+landsales+"' where Id='"+candidateid+"'");
				String Username=(String)session.getAttribute("name");
				System.out.println("Final Sale Area=>"+finallandsales);
				String data=Uname+Umobno+uploadDates+number+Owner_Name+FileName+Village_name+Taluka_name+Dist_name+Land_area;
				
				ptop.ptopverify(4,data);
				st02.executeUpdate("insert into tbltransation(Owner_Name,Village_Name,Taluka_Name,Dist_Name,User_Name,Land_Area,Land_Area_N,Current_Date_N,Current_BlockData,Owner_id,Number7,U_Name,Directions_Data) values('"+Email_ID+"','"+Village_name+"','"+Taluka_name+"','"+Dist_name+"','"+emailid+"','"+oldlandsales+"','"+landsales+"','"+strDate+"','"+Block.hash+"','"+candidateid+"','"+number+"','"+Username+"','"+Directions+"')");
				
				
				
			}
			else
			{
				pw.println("<html><script>alert('Area Not Valid');</script><body>");
				pw.println("");
				pw.println("</body></html>");
			}
		}
		catch(Exception e)
		{
			pw.println("<script> alert(' Unexpected Error');</script>");
			
			e.printStackTrace();
		}
		response.sendRedirect("ShowInfo.jsp");
	}

}
