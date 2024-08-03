package com.algo;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author JP
 */
public class consensus {

    public static String block1, block2, block3, block4;
    public static int Node2 = 0, Node3 = 0, FP = 0, Node4 = 0,Node1 = 0;
    public static String T_id1, T_id2, T_id3, T_id4;
    public static void consensusdata(String BlocKData,String HashBlock )
    {
    	try {
        	
        	
        	
        	
    	       miningalgorithm.Recoverblockdata();
    	            Class.forName("com.mysql.jdbc.Driver");

    	            Connection con1, con2, con3, con4;
    	            Statement st1, st2, st3, st4;
    	            Statement stt1, stt2, stt3, stt4;
    	            ResultSet rs1, rs2, rs3, rs4;
    	           
					con1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/blockchain1", "root", "admin");
					con2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/blockchain2", "root", "admin");
    	            con3 = DriverManager.getConnection("jdbc:mysql://localhost:3306/blockchain3", "root", "admin");
    	            con4 = DriverManager.getConnection("jdbc:mysql://localhost:3306/blockchain4", "root", "admin");
    	            con1.setAutoCommit(false);
    	            con2.setAutoCommit(false);
    	            con3.setAutoCommit(false);
    	            con4.setAutoCommit(false);
    	// insert query
    	            st1 = con1.createStatement();
    	            st2 = con2.createStatement();
    	            st3 = con3.createStatement();
    	            st4 = con4.createStatement();
    	            
    	            stt1 = con1.createStatement();
    	            stt2 = con2.createStatement();
    	            stt3 = con3.createStatement();
    	            stt4 = con4.createStatement();
    	            rs1 = stt1.executeQuery("select * from tblblockchain  order by  TransactionID desc");
    	            if (rs1.next()) {
    	           	 T_id1=rs1.getString(1);
    	                block1 = rs1.getString(3);
    	                System.out.println("Database=>" + rs1.getString(1) + "\tPreviousHash=>" + rs1.getString(2));
    	            }
    	            rs2 = stt2.executeQuery("select * from tblblockchain  order by  TransactionID desc");
    	            if (rs2.next()) {
    	           	 T_id2=rs2.getString(1);
    	                block2 = rs2.getString(3);
    	                System.out.println("Database=>" + rs2.getString(1) + "\tPreviousHash=>" + rs2.getString(2));
    	            }
    	            rs3 = stt3.executeQuery("select * from tblblockchain  order by  TransactionID desc");
    	            if (rs3.next()) {
    	           	 T_id3=rs3.getString(1);
    	                block3 = rs3.getString(3);
    	                System.out.println("Database=>" + rs3.getString(1) + "\tPreviousHash=>" + rs3.getString(2));
    	            }
    	            rs4 = stt4.executeQuery("select * from tblblockchain  order by  TransactionID desc");
    	            if (rs4.next()) {
    	           	 T_id4=rs4.getString(1);
    	                block4 = rs4.getString(3);
    	                System.out.println("Database=>" + rs4.getString(1) + "\tPreviousHash=>" + rs4.getString(2));
    	            }
    	           // String id = "3", PreviousHash = "263222139f9fd731edba7f8723cd0ce4d25f6fcbc3fb21105995aadaf8ce2989", BlocKData = "263222139f9fd731edba7f8723cd0ce4d25f6fcbc3fb21105995aadaf8ce2984", HashBlock = "msc";
    	        st1.executeUpdate("insert into tblblockchain (PreviousHash,BlocKData,HashBlock) values('"+block1+"','"+BlocKData+"','"+HashBlock+"')");
    	        
    	        st2.executeUpdate("insert into tblblockchain (PreviousHash,BlocKData,HashBlock) values('"+block2+"','"+BlocKData+"','"+HashBlock+"')");
    	        
    	        st3.executeUpdate("insert into tblblockchain (PreviousHash,BlocKData,HashBlock) values('"+block3+"','"+BlocKData+"','"+HashBlock+"')");
    	        
    	        st4.executeUpdate("insert into tblblockchain (PreviousHash,BlocKData,HashBlock) values('"+block4+"','"+BlocKData+"','"+HashBlock+"')");
    	            con1.commit();
    	            con2.commit();
    	            con3.commit();
    	            con4.commit();
    	            con1.close();
    	            con2.close();
    	            con3.close();
    	            con4.close();
    	           
    	        } catch (ClassNotFoundException ex) {
    	            System.out.println(ex);
    	        }
     catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
    	
    }
    public static void main(String[] args) throws SQLException {
        
    	HashGeneratorUtils generatorUtils=new HashGeneratorUtils();
		String sha="Uname+Umobno+uploadDates+number+Owner_Name+FileName";
		String shadata;
		try {
			shadata = generatorUtils.generateSHA256(sha);
			consensus.consensusdata(shadata,sha);
		} catch (HashGenerationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
    }
}
