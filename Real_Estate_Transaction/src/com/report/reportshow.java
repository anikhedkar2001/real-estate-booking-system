package com.report;

import java.io.FileOutputStream;
import java.security.acl.Owner;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import com.connection.*;
import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Document;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.FontFactory;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.Rectangle;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;

public class reportshow {
	public static ArrayList<String> Ownernamelist=new ArrayList<String>();
	public static String filename="",filen="";
    public static void createreport(String id,String Name,String Village_Name,String Taluka,String District,String land_area,String number7) {

    	Ownernamelist.add("First");
    	Ownernamelist.add("Second");
    	Ownernamelist.add("Third");
    	Ownernamelist.add("Fourth");
    	Ownernamelist.add("Fifth");
    	Ownernamelist.add("Sixth");
    	Ownernamelist.add("Seventh");
    	Ownernamelist.add("Eighth");
    	Ownernamelist.add("Ninth");
    	Ownernamelist.add("Tenth");
    	
    	 Document doc = new Document();
        try {

        	filename=Dbconn.filereport + "Report_" + id + ".pdf";
        	filen="Report_" + id + ".pdf";
            // String Systolic = null, Diastolic = null, Heart_Rate = null, Cholestrol_LDL = null, Cholestrol_HDL = null, Stress = null, Suger = null, QT_Interval = null, PR_Interval = null, Oxygen_saturation = null, Hemoglobin = null, totalCholestrol = null, cvd = null, cardiac = null, vage = null;
            PdfWriter.getInstance(doc, new FileOutputStream(filename));
            doc.open();
            PdfPTable table3 = new PdfPTable(4);
            PdfPTable table1 = new PdfPTable(4);

            float[] columnWidthsa1 = {2.5f, 2.0f, 2.0f, 2.5f}; // Second column will be
            // twice as first and third
            table1.setWidths(columnWidthsa1);
            Font redFont = new Font(Font.FontFamily.TIMES_ROMAN, 12, Font.ITALIC | Font.UNDERLINE, BaseColor.RED);
            PdfPCell cellt40 = new PdfPCell(new Phrase("Village Sample Seven", redFont));
            PdfPCell cellt401 = new PdfPCell(new Phrase("Official records", redFont));
            PdfPCell cellt402 = new PdfPCell(new Phrase("Maharashtra Land Revenue Officer Record", redFont));
            PdfPCell cell41 = new PdfPCell(new Phrase("Original Owner Name:", FontFactory.getFont(FontFactory.HELVETICA, 8)));
            PdfPCell cell42 = new PdfPCell(new Phrase(Name, FontFactory.getFont(FontFactory.HELVETICA, 8)));
            PdfPCell cell59 = new PdfPCell(new Phrase("Land Area Total:", FontFactory.getFont(FontFactory.HELVETICA, 8)));
            PdfPCell cell60 = new PdfPCell(new Phrase(land_area, FontFactory.getFont(FontFactory.HELVETICA, 8)));
            PdfPCell cell43 = new PdfPCell(new Phrase("Village Name:", FontFactory.getFont(FontFactory.HELVETICA, 8)));
            PdfPCell cell44 = new PdfPCell(new Phrase(Village_Name, FontFactory.getFont(FontFactory.HELVETICA, 8)));
            
            PdfPCell cell00 = new PdfPCell(new Phrase("Taluka:", FontFactory.getFont(FontFactory.HELVETICA, 8)));
            PdfPCell cell01 = new PdfPCell(new Phrase(Taluka, FontFactory.getFont(FontFactory.HELVETICA, 8)));
            PdfPCell cell02 = new PdfPCell(new Phrase("District:", FontFactory.getFont(FontFactory.HELVETICA, 8)));
            PdfPCell cell03 = new PdfPCell(new Phrase(District, FontFactory.getFont(FontFactory.HELVETICA, 8)));
            
            PdfPCell cell002 = new PdfPCell(new Phrase("7/12 Number:", FontFactory.getFont(FontFactory.HELVETICA, 8)));
            PdfPCell cell003 = new PdfPCell(new Phrase(number7, FontFactory.getFont(FontFactory.HELVETICA, 8)));
            
            
            Date day = new Date();
            SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
            String strDate = formatter.format(day);
            PdfPCell cellt71 = new PdfPCell(new Phrase("Date:", FontFactory.getFont(FontFactory.HELVETICA, 8)));
            PdfPCell cellt72 = new PdfPCell(new Phrase(strDate, FontFactory.getFont(FontFactory.HELVETICA, 8)));
            cellt40.setColspan(4);
            cellt401.setColspan(4);
            cellt402.setColspan(4);
            cellt72.setColspan(3);
            cellt402.setHorizontalAlignment(Element.ALIGN_CENTER);
            cellt401.setHorizontalAlignment(Element.ALIGN_CENTER);
            cellt40.setHorizontalAlignment(Element.ALIGN_CENTER);
            cellt40.setBorder(Rectangle.NO_BORDER);
            cellt401.setBorder(Rectangle.NO_BORDER);
            cellt402.setBorder(Rectangle.NO_BORDER);
            cell41.setBorder(Rectangle.NO_BORDER);
            cell42.setBorder(Rectangle.NO_BORDER);
            cell59.setBorder(Rectangle.NO_BORDER);
            cell60.setBorder(Rectangle.NO_BORDER);
            cell43.setBorder(Rectangle.NO_BORDER);
            cell44.setBorder(Rectangle.NO_BORDER);
            cell00.setBorder(Rectangle.NO_BORDER);
            cell01.setBorder(Rectangle.NO_BORDER);
            cell02.setBorder(Rectangle.NO_BORDER);
            cell03.setBorder(Rectangle.NO_BORDER);
            cell002.setBorder(Rectangle.NO_BORDER);
            cell003.setBorder(Rectangle.NO_BORDER);
            cellt71.setBorder(Rectangle.NO_BORDER);
            cellt72.setBorder(Rectangle.NO_BORDER);
            table1.addCell(cellt40);
            table1.addCell(cellt401);
            table1.addCell(cellt402);
            table1.addCell(cell41);
            table1.addCell(cell42);
            table1.addCell(cell59);
            table1.addCell(cell60);
            table1.addCell(cell43);
            table1.addCell(cell44);
            table1.addCell(cell00);
            table1.addCell(cell01);
            table1.addCell(cell02);
            table1.addCell(cell03);
            table1.addCell(cell002);
            table1.addCell(cell003);
            table1.addCell(cellt71);
            table1.addCell(cellt72);
            table1.setSpacingAfter(20);
            // Set Column widths of table
            float[] columnWidthsa = {2.0f, 2.2f, 2.5f, 2.4f}; // Second column will be
            // twice as first and third
            table3.setWidths(columnWidthsa);
            //Font whiteFont = new FontFactory;
            Connection connection;
	        connection = Dbconn.conn();
	        String Email_ID=null;
            Statement statement = connection.createStatement();
            ResultSet result1 =statement.executeQuery("select * from tblpdfdata where Id='"+id+"' ") ; 
	        if(result1.next())
		     {
		       Email_ID=result1.getString("Email_ID");
		     }
	        int names=0;
	        Statement stat = connection.createStatement();
            ResultSet rs1 =stat.executeQuery("select * from tbltransation where Owner_Name='"+Email_ID+"' ") ; 
	        while(rs1.next())
		     {
	        	String OName="";
	        	names++;
	        	if(names==1)
	        	{
	        		OName=Ownernamelist.get(0);
	        	}
	        	else if(names==2)
	        	{
	        		OName=Ownernamelist.get(1);
	        	}
	        	else if(names==3)
	        	{
	        		OName=Ownernamelist.get(2);
	        		
	        	}
	        	else if(names==4)
	        	{
	        		OName=Ownernamelist.get(3);
	        	}
	        	else if(names==5)
	        	{
	        		OName=Ownernamelist.get(4);
	        	}
	        	else if(names==6)
	        	{
	        		OName=Ownernamelist.get(5);
	        	}
	        	else if(names==7)
	        	{
	        		OName=Ownernamelist.get(6);
	        	}
	        	else if(names==8)
	        	{
	        		OName=Ownernamelist.get(7);
	        		
	        	}
	        	else if(names==9)
	        	{
	        		OName=Ownernamelist.get(8);
	        	}
	        	else if(names==10)
	        	{
	        		OName=Ownernamelist.get(9);
	        	}
	        	 PdfPCell cellt1 = new PdfPCell(new Phrase(OName+" Owner Name", FontFactory.getFont(FontFactory.COURIER_BOLD, 8)));
	             PdfPCell cellt2 = new PdfPCell(new Phrase("Area Sale"+":"+"Directions_Data", FontFactory.getFont(FontFactory.COURIER_BOLD, 8)));
	             PdfPCell cellt4 = new PdfPCell(new Phrase("Current_Date", FontFactory.getFont(FontFactory.COURIER_BOLD, 8)));
	            	
            PdfPCell cell36 = new PdfPCell(new Phrase(rs1.getString("U_Name"), FontFactory.getFont(FontFactory.HELVETICA, 8)));
            PdfPCell cell37 = new PdfPCell(new Phrase(rs1.getString("Land_Area_N")+":"+rs1.getString("Directions_Data"), FontFactory.getFont(FontFactory.HELVETICA, 8)));
            PdfPCell cell96 = new PdfPCell(new Phrase(rs1.getString("Current_Date_N"), FontFactory.getFont(FontFactory.HELVETICA, 8)));
            cell37.setColspan(2);
            table3.addCell(cellt1);
            cellt2.setColspan(2);
            table3.addCell(cellt2);
            table3.addCell(cellt4);
            table3.addCell(cell36);
            table3.addCell(cell37);
            table3.addCell(cell96);
             }
			doc.add(table1);
            doc.add(table3);
        } catch (Exception e) {
        	System.out.println(e);
        } finally {
            doc.close();
        }

    }
    public static void main(String[] args)
    {
//    	createreport("1","String Village_Name","String Taluka","String District");
    }
}
