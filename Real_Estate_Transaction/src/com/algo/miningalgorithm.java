package com.algo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class miningalgorithm {
	 public static String block1, block2, block3, block4;
	 public static String T_id1, T_id2, T_id3, T_id4;
	    public static int Node2 = 0, Node3 = 0, FP = 0, Node4 = 0,Node1 = 0,num=0;
	public static int Recoverblockdata()
	{
		 Connection con1, con2, con3, con4;
		 Statement st1, st2, st3, st4;
         Statement stt1, stt2, stt3, stt4;
         ResultSet rs1, rs2, rs3, rs4;
         try {
        	 con1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/blockchain1", "root", "admin");
             con2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/blockchain2", "root", "admin");
             con3 = DriverManager.getConnection("jdbc:mysql://localhost:3306/blockchain3", "root", "admin");
             con4 = DriverManager.getConnection("jdbc:mysql://localhost:3306/blockchain4", "root", "admin");
             stt1 = con1.createStatement();
             stt2 = con2.createStatement();
             stt3 = con3.createStatement();
             stt4 = con4.createStatement();
             rs1 = stt1.executeQuery("select * from tblblockchain  order by  TransactionID desc");
             if (rs1.next()) {
            	 T_id1=rs1.getString(1);
                 block1 = rs1.getString(2);
                 System.out.println("Database=>" + rs1.getString(1) + "\tPreviousHash=>" + rs1.getString(2));
             }
             rs2 = stt2.executeQuery("select * from tblblockchain  order by  TransactionID desc");
             if (rs2.next()) {
            	 T_id2=rs2.getString(1);
                 block2 = rs2.getString(2);
                 System.out.println("Database=>" + rs2.getString(1) + "\tPreviousHash=>" + rs2.getString(2));
             }
             rs3 = stt3.executeQuery("select * from tblblockchain  order by  TransactionID desc");
             if (rs3.next()) {
            	 T_id3=rs3.getString(1);
                 block3 = rs3.getString(2);
                 System.out.println("Database=>" + rs3.getString(1) + "\tPreviousHash=>" + rs3.getString(2));
             }
             rs4 = stt4.executeQuery("select * from tblblockchain  order by  TransactionID desc");
             if (rs4.next()) {
            	 T_id4=rs4.getString(1);
                 block4 = rs4.getString(2);
                 System.out.println("Database=>" + rs4.getString(1) + "\tPreviousHash=>" + rs4.getString(2));
             }
 // check block 1 and block2
             if (block1.equals(block2)) {
             	Node3= 1;
                 // block 1 and block 3 
                 if (block1.equals(block3)) {
                 	Node4 = 1;
                 	Node3 = 0;
                 	Node1 = 0;
                     if (block1.equals(block4)) {
                         FP = 1;
                         Node4 = 0;
                         Node1 = 0;
                         Node2=0;
                         Node3=0;
                     }// block four
                     else
                     {
                     
                     	Node1 = 0;
                         Node2=0;
                         Node3=0;
                     
                     }
                 }// block three
                 else
                 {
                 
                 if (block1.equals(block4)) {
                         FP = 1;
                         Node4 = 0;
                         Node1 = 0;
                         Node2 = 0;
                     }// block four
                 
                 }
                 
                 
             }// Block two if end
             else {
             	Node2 = 1;
             	Node3 = 1;
             	Node1=1;
                 if (block2.equals(block3)) {
                 	Node3 = 0;
                 	Node4 = 1;
                 	Node2 = 0;
                     if (block2.equals(block4)) {
                         FP = 1;
                         Node4 = 0;
                         Node2 = 0;
                         Node3=0;
                     }// block four

                 }// block 3
                 else
                 {
                 
                 if (block2.equals(block4)) {
                         //FP = 1;
                 	Node4 = 0;
                         //TP1 = 0;
                     }// block four
                 else
                 {
                 if (block1.equals(block3)) {
                 	Node4 = 1;
                 	Node3 = 0;
                 	Node1 = 0;
                 	Node2=1;
                     if (block1.equals(block4)) {
                         FP = 1;
                         Node4 = 0;
                         Node1 = 0;
                         
                         Node3=0;
                     }// block four
                     else
                     {
                     
                     	Node1=0;
                     	Node2=0;
                     	Node3=0;
                     
                     }
                 }// block three
                 
                 }
                 
                 }
             }
             st1 = con1.createStatement();
             st2 = con2.createStatement();
             st3 = con3.createStatement();
             st4 = con4.createStatement();
             if((FP == 1 && Node2 == 0 && Node3==0 && Node4==0 && Node1 == 0)) {
                 System.out.println("All Block Valid");
             }else if (Node1 == 1) {
            	 st1.executeUpdate("update tblblockchain set PreviousHash='"+block2+"' where TransactionID='"+T_id1+"'");
                 System.out.println("Block One Not valid");

             }
             else if (Node2 == 1) {
            	 st2.executeUpdate("update tblblockchain set PreviousHash='"+block1+"' where TransactionID='"+T_id2+"'");
                 System.out.println("Block Two Not valid");

             } else if (Node3 == 1) {
            	 st3.executeUpdate("update tblblockchain set PreviousHash='"+block4+"' where TransactionID='"+T_id3+"'");
                 System.out.println("Block Three Not valid");
             } else if (Node4 == 1) {
            	 st4.executeUpdate("update tblblockchain set PreviousHash='"+block3+"' where TransactionID='"+T_id4+"'");
                 System.out.println("Block Four Not valid");
             }
             else
             {
             System.out.println("All Block Not Valid");
             }
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		
		return num;
		
	}
}
