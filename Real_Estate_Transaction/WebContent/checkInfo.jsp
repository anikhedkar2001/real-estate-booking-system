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
				 <li><a href="UserHome.jsp">Home</a></li>
  <li><a href="ShowInfo.jsp">Show Info</a></li>
  <li><a href="Searchingland.jsp">Searching Land</a></li>
     <li><a href="Login">Logout</a></li>
  			
			</ul>
		</div>
	</div>
	<!-- end #menu -->
	<div>
		<div>
			<div id="page-bgbtm" align="center">
				<div >
					<div >
						<div style="width: 100%">
						
						<table class="table table-responsive table-bordered"  border="1">
	       <tr>
			<td class="col-md-2"><h3>T-ID</h3> </td>
			<td class="col-md-2"><h3>7/12_Number</h3> </td>
			<td class="col-md-2"><h3>Owner_Name</h3> </td>
			<td class="col-md-2"><h3>User Name</h3> </td>
			<td class="col-md-2"><h3>Land_area</h3> </td>
			<td class="col-md-2"><h3>Current_Date</h3> </td>
			 </tr>
		   
		   <% 
		   int i=0;
        	Connection connection = Dbconn.conn();
            Statement statement = connection.createStatement();
        String id=request.getParameter("id");
            ResultSet resultset =statement.executeQuery("select * from tbltransation where Owner_id='"+id+"' ") ; 
			while(resultset.next())
             {
				i++;
       		 %>	
       		 <tr>
           
              <td> <%= i %> </td>
                <td> <%= resultset.getString("Number7") %> </td>
                 <td> <%= resultset.getString("Owner_Name") %> </td>
                   <td> <%= resultset.getString("U_Name") %> </td>
                    <td> <%= resultset.getString("Land_Area_N") %> </td>
                    <td> <%= resultset.getString("Current_Date_N") %> </td>
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