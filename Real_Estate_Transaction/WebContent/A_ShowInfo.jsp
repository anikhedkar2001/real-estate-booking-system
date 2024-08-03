<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.connection.Dbconn"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta name="keywords" content="" />
<meta name="description" content="" />
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title></title>
<link href="http://fonts.googleapis.com/css?family=Oswald" rel="stylesheet" type="text/css" />
<link href='http://fonts.googleapis.com/css?family=Arvo' rel='stylesheet' type='text/css'>
<link href="style.css" rel="stylesheet" type="text/css" media="screen" />
</head>
<body>
<div id="wrapper" style="width: 100%">
	<div id="header-wrapper">
		<div id="header">
			<div id="logo">
				<jsp:include page="titlepage.jsp"></jsp:include><p></p>
			</div>
		</div>
	</div>
	<!-- end #header -->
	<div id="menu-wrapper">
		<div id="menu">
			<ul>
				 <li><a href="AdminProfile.jsp">Home</a></li>
				 <li><a href="Fileupload.jsp">Upload</a></li>
				 <li><a href="Admin_ShowInfo.jsp">Show Transaction</a></li>
     <li><a href="Login">Logout</a></li>
			</ul>
		</div>
	</div>
	<!-- end #menu -->
	<div id="page-bgtop">
			<div id="page-bgbtm">
				<div id="page-content">
					<div id="content">
						<div style="width: 100%">
						<table width="100%"  border="1">
	       
		   
		   <% 
		   String id=request.getParameter("candidateid");
			
        	Connection connection = Dbconn.conn();
            Statement statement = connection.createStatement();
        
            ResultSet resultset =statement.executeQuery("select * from tbltransation where id='"+id+"'") ; 
			if(resultset.next())
             {
       		 %>	
       		 <tr>
			<td class="col-md-2"><h3>T-ID</h3> </td>
           
              <td> <%= resultset.getString("id") %> </td>
              </tr>
              <tr>
			
			<td class="col-md-2"><h3>Owner_Name</h3> </td>
                <td> <%= resultset.getString("Owner_Name") %> </td>
                </tr>
                <tr>
			
			<td class="col-md-2"><h3>Village_Name</h3> </td>
                   <td> <%= resultset.getString("Village_name") %> </td>
                   </tr>
                   <tr>
			
			<td class="col-md-2"><h3>Taluka_Name</h3> </td>
                <td> <%= resultset.getString("Taluka_name") %> </td>
                </tr>
                <tr>
			
			<td class="col-md-2"><h3>Dist_name</h3> </td>
                 <td> <%= resultset.getString("Dist_name") %> </td>
                 </tr>
                 <tr>
			
			<td class="col-md-2"><h3>Land_area</h3> </td>
                  <td><%=resultset.getString("Land_area") %></td>
                  </tr>
                  <tr>
			
			<td class="col-md-2" width="45%"><h3>Second Owner_Name</h3> </td>
                   <td> <%= resultset.getString("User_Name") %> </td>
                   </tr>
                   <tr>
			
			<td class="col-md-2"><h3>Second Owner Land_Area</h3> </td>
                 <td> <%= resultset.getString("Land_Area_N") %> </td>
                 </tr>
                 <tr>
			
			<td class="col-md-2"><h3>Current_Date</h3> </td>
                  <td><%=resultset.getString("Current_Date_N") %></td>
                  </tr>
                  <tr>
			
			      <td class="col-md-2"><h3>Current_BlockData</h3> </td>
                  <td><%=resultset.getString("Current_BlockData") %></td>

</tr>
       		  <% 
             } 
              %>
 
			</table>
							
						</div>
						
					<!-- end #content -->
					
				<div style="clear: both;">&nbsp;</div>
			</div>
		</div>
	</div>
	<!-- end #page -->
</div>
</div>
<div id="footer">
	<p></p>
</div>
</div>
<!-- end #footer -->
</body>
</html>