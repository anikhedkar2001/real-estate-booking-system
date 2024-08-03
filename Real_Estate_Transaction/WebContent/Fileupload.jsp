<%@page import="java.sql.ResultSet"%>
<%@page import="com.connection.Dbconn"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.activity.*"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>

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
 <li><a href="AdminProfile.jsp">Home</a></li>
				 <li><a href="Fileupload.jsp">Upload</a></li>
				 <li><a href="Admin_ShowInfo.jsp">Show Transaction</a></li>
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
					<%

String candidateid=null;
Connection connection = Dbconn.conn();
Statement statement = connection.createStatement();
ResultSet resultset =statement.executeQuery("select count(*) from tbldata") ; 
if(resultset.next())
 {
	candidateid=resultset.getString(1);
 } 

int CountVoter=Integer.parseInt(candidateid);
int id=CountVoter+1;
String ids=String.valueOf(id);
 SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
 
	Date date = new Date();
	String strDate= formatter.format(date);
 String emailid=(String)session.getAttribute("emailid");
 %>
					
						<div class="post">
							<form enctype="multipart/form-data"  action="fileupload" method="post">
			<div class="form-group">
			<table align="center" class="fileup"  
								style="font-family: monotype corsiva; font-size: 22px; font-weight: bold">
								<thead>
									<tr bgcolor="#FAEBD7">
										<th colspan="2">Upload Information</th>

									</tr>
								</thead>
								<tr>
													<td>Transaction-ID</td>
													<td>
								<input type="text" name="transactionid" value=<%=ids %> style="font-family: monotype corsiva; font-size: 15px" readonly="readonly" ></td>
												</tr>
												<tr>
													<td>Current Date</td>
													<td><input type="text" name="currentdate" value=<%=strDate %>
														style="font-family: monotype corsiva; font-size: 15px" required></td>
												</tr>
								<tr>
													<td>7/12 Number</td>
													<td>
								<input type="number" name="number" style="font-family: monotype corsiva; font-size: 15px" required ></td>
												</tr>
												<tr>
													<td>Name</td>
													<td><input type="text" name="name" 
														style="font-family: monotype corsiva; font-size: 15px" required></td>
												</tr>
												<tr>
													<td>Village Name</td>
													<td><input type="text" name="Village_name" 
														style="font-family: monotype corsiva; font-size: 15px" required></td>
												</tr>
 <tr>
													<td>Taluka Name</td>
													<td><input type="text" name="Taluka_name" 
														style="font-family: monotype corsiva; font-size: 15px" required></td>
												</tr>
												<tr>
													<td>District Name</td>
													<td><input type="text" name="dist_name" 
														style="font-family: monotype corsiva; font-size: 15px" required></td>
												</tr>
		<tr>
													<td>Land Area</td>
													<td><input type="number" name="land_area" 
														style="font-family: monotype corsiva; font-size: 15px" required></td>
												</tr>
<tr>
									<td class="lable" >Email:</td>
									<td><input type="text" required  pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$"
													name="txtEmail" style="height: 25px; width: 250px;" /></td>
								</tr>

	       <tr>
			<td width="17%"><label for="txt_Uname">Select</label></td>
		    <td width="20%" ><input type="file" style="border-color: gray;"  name="txt_search" id="txt_search" /></td>
		</tr>
		<tr>
								<td align="center" colspan="2"><input type="submit" name="Submit"
									value="Upload" style="font-family: monotype corsiva; font-size: 20px; font-weight: bold" /> </td>
							</tr>
			</table>
		
			</div>
			</form> 
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