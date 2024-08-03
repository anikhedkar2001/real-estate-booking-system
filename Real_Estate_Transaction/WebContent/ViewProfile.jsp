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
<div id="wrapper">
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
     <li><a href="Login">Logout</a></li>
  			
			</ul>
		</div>
	</div>
	<!-- end #menu -->
	<div id="page">
		<div id="page-bgtop">
			<div id="page-bgbtm">
				<div id="page-content">
					<div id="content">
						<div class="post">
						<table class="table table-responsive table-bordered" style="width: 100%">
	       
		   <% 
		   String candidateid=request.getParameter("candidateid");
        	Connection connection = Dbconn.conn();
            Statement statement = connection.createStatement();
            ResultSet resultset =statement.executeQuery("select * from tbldata where D_id='"+candidateid+"' ") ; 
			if(resultset.next())
             {
				System.out.println(resultset.getString("FilePath_photo"));
       		 %>	
       		 <tr>
           
              <td> <img src="<%=resultset.getString("FilePath_photo") %>" width="50%" /></td>
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
<div id="footer">
	<p></p>
</div>
<!-- end #footer -->
</body>
</html>