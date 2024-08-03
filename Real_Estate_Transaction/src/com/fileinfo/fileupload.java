package com.fileinfo;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.connection.Dbconn;
import com.itextpdf.text.pdf.PdfReader;
import com.itextpdf.text.pdf.parser.PdfTextExtractor;

/**
 * Servlet implementation class fileupload
 */
@WebServlet("/fileupload")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
maxFileSize = 1024 * 1024 * 10, // 10MB
maxRequestSize = 1024 * 1024 * 50)
public class fileupload extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public static String data = null;
	public static String ContentType = null;
	public static String fileName = null,strOriginal;
	public static long size;
	File finalpath;
	public fileupload() {
		super();
		// 
	}

	String getFileName(Part filePart) {
		for (String cd : filePart.getHeader("content-disposition").split(";")) {
			if (cd.trim().startsWith("filename")) {
				String fileName = cd.substring(cd.indexOf('=') + 1).trim()
						.replace("\"", "");
				return fileName.substring(fileName.lastIndexOf('/') + 1)
						.substring(fileName.lastIndexOf('\\') + 1);
				// return cd.substring(cd.indexOf('=') + 1).trim().replace("\"",
				// "") ;
			}

		}

		return null;

	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// 
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		PrintWriter pw = response.getWriter();
		InputStream inputStream = null;
		Connection con;
		String id=request.getParameter("transactionid");
		Part filePart = request.getPart("txt_search");
		String currentdate=request.getParameter("currentdate");
		String number=request.getParameter("number");
		String name=request.getParameter("name");
		String Village_name=request.getParameter("Village_name");
		String Taluka_name=request.getParameter("Taluka_name");
		String dist_name=request.getParameter("dist_name");
		String land_area=request.getParameter("land_area");
		String emailid=request.getParameter("txtEmail");
		String sale="0";
		fileName = getFileName(filePart);
		size = filePart.getSize();
		ContentType = filePart.getContentType();
		inputStream = filePart.getInputStream();
		System.out.print("File" + filePart);
		System.out.print("\nFileName:-" + fileName);
		System.out.print("\nFileSize:-" + size);
		System.out.println("\nFileContentType:-" + ContentType);
		System.out.print("\nVillage_name:-" + Village_name);
		System.out.print("\nTaluka_name:-" + Taluka_name);
		System.out.println("\nDist_name:-" + dist_name);
		System.out.println("\nLand_area:-" + land_area);
		finalpath = new File(Dbconn.filepath,name);
		finalpath.mkdir();
		BufferedReader br = null;
		try {
			con = Dbconn.conn();
			Statement st1 = (Statement) con.createStatement();
			filePart.write(finalpath + File.separator+ fileName);
			String path=finalpath + File.separator+ fileName;
			String profilephoto=Dbconn.filepath1+name+"/"+fileName;
			System.out.println("Name=>"+name);
			System.out.println("Photo=>"+profilephoto);
			st1.executeUpdate("insert into tbldata(Current_Dates,Owner_Number,Owner_Name,FilePath_photo) values('" + currentdate
					+ "','" + number + "','" + name + "','"+profilephoto+"')");
//			strOriginal = getpdfFromInputStream(inputStream);
//			System.out.println("Origional:-" + strOriginal);
			
			String sql = "INSERT INTO tblpdfdata values (?,?,?,?,?,?,?,?,?,?,?,?,?)";
			
			PreparedStatement statement = con.prepareStatement(sql);
			statement.setString(1, id);
			statement.setString(2, currentdate);
			statement.setString(3, number);

			statement.setString(4, name);

			statement.setString(5, fileName);
			statement.setBlob(6, inputStream);
			statement.setString(7, Village_name);
			statement.setString(8, Taluka_name);
			statement.setString(9, dist_name);
			statement.setString(10, land_area);
			statement.setString(11, sale);
			statement.setString(12,land_area);
			statement.setString(13,emailid);
			statement.executeUpdate();
			
			pw.println("<html><script>alert('File Uploaded Sucessfully');</script><body>");
			pw.println("");
			pw.println("</body></html>");
			RequestDispatcher rd = request
					.getRequestDispatcher("/AdminProfile.jsp");
			rd.include(request, response);

		} catch (Exception e) {
			System.out.println(e);
		}

	}

	private String getpdfFromInputStream(InputStream is) throws IOException {
		String data = null;
		PdfReader pdfReader = new PdfReader(is);
		// Get the number of pages in pdf.
		int pages = pdfReader.getNumberOfPages();
		// Iterate the pdf through pages.
		for (int i = 1; i <= pages; i++) {
			// Extract the page content using PdfTextExtractor.
			data = PdfTextExtractor.getTextFromPage(pdfReader, i);
			// Print the page content on console.

		}
		return data;
	}

}
