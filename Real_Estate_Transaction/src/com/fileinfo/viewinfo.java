package com.fileinfo;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.*;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.connection.Dbconn;
import com.report.reportshow;

/**
 * Servlet implementation class viewinfo
 */
@WebServlet("/viewinfo")
public class viewinfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
	// private static final int BUFFER_SIZE = 4096;
	public static String origional = "";
	public static String Village_Name;
	public static String Taluka;
	public static String District;
	public static String Final_Land_Area;
	public static String Name;
	public static String number7;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public viewinfo() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String candidateid = request.getParameter("candidateid");
		int BUFFER_SIZE = 1024 * 100;
		Connection connection;
		try {
			connection = Dbconn.conn();

			Statement statement = connection.createStatement();
			ResultSet result1 = statement
					.executeQuery("select * from tblpdfdata where Id='"
							+ candidateid + "' ");
			if (result1.next()) {
				Name = result1.getString("Name");
				Village_Name = result1.getString("Village_name");
				Taluka = result1.getString("Taluka_name");
				District = result1.getString("Dist_name");
				Final_Land_Area = result1.getString("Final_Land_Area");
				number7 = result1.getString("Number7Data");
				//
				// // gets file name and file blob data
				String fileName = result1.getString("FileName");
				// } else {
				// no file found
				// response.getWriter().print("File not found for the id: " +
				// fileName);
			}

			System.out.println(candidateid + "=>" + Name + "=>" + Village_Name
					+ "=>" + Taluka + "=>" + District + "=>" + Final_Land_Area);
			reportshow.createreport(candidateid, Name, Village_Name, Taluka,
					District, Final_Land_Area, number7);

			FileInputStream fis;
			File image = new File(reportshow.filename);
			PreparedStatement stmt = connection
					.prepareStatement("UPDATE tblpdfdata set File_Data=?,FileName=? WHERE Id=?");

			fis = new FileInputStream(image);
			stmt.setBlob(1, fis);
			stmt.setString(2, reportshow.filen);
			stmt.setString(3, candidateid);
			stmt.executeUpdate();
			stmt.close();
			Statement statement01 = connection.createStatement();
			ResultSet result10 = statement01
					.executeQuery("select * from tblpdfdata where Id='"
							+ candidateid + "' ");
			if (result10.next()) {
				Name = result10.getString("Name");
				Village_Name = result10.getString("Village_name");
				Taluka = result10.getString("Taluka_name");
				District = result10.getString("Dist_name");
				Final_Land_Area = result10.getString("Final_Land_Area");
				number7 = result10.getString("Number7Data");

				// gets file name and file blob data
				String fileName = result10.getString("FileName");
				Blob blob = result10.getBlob("File_Data");
				InputStream inputStream = blob.getBinaryStream();
				int fileLength = inputStream.available();

				System.out.println("fileLength = " + fileLength);

				ServletContext context = getServletContext();

				// sets MIME type for the file download
				String mimeType = context.getMimeType(fileName);
				if (mimeType == null) {
					mimeType = "application/octet-stream";
				}

				// set content properties and header attributes for the response
				response.setContentType(mimeType);
				response.setContentLength(fileLength);
				String headerKey = "Content-Disposition";
				String headerValue = String.format(
						"attachment; filename=\"%s\"", fileName);
				response.setHeader(headerKey, headerValue);

				// writes the file to the client
				OutputStream outStream = response.getOutputStream();

				byte[] buffer = new byte[BUFFER_SIZE];
				int bytesRead = -1;

				while ((bytesRead = inputStream.read(buffer)) != -1) {
					outStream.write(buffer, 0, bytesRead);
				}

				inputStream.close();
				outStream.close();
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
