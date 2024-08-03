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
						<%
						Connection con = Dbconn.conn();
						String candidateid=request.getParameter("candidateid");
						String uploadDates=null,number=null,Owner_Name=null,FileName=null;
						String Village_name=null,Taluka_name=null,Dist_name=null,Land_area=null,emailid=null;
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
							emailid=result1.getString("Email_ID");
							  }
						
						
						
						%>
						<form action="trasancationinfo" method="post">
		
			<table align="center" class="fileup"   cellspacing="10"
								cellpadding="15"
								style="font-family: monotype corsiva; font-size: 22px; font-weight: bold">
								<thead>
									<tr bgcolor="#FAEBD7">
										<th colspan="2">Upload Information</th>

									</tr>
								</thead>
								<tr>
													<td>Transaction-ID</td>
													<td>
								<input type="text" name="candidateid" value=<%=candidateid %> readonly style="font-family: monotype corsiva; font-size: 15px" readonly="readonly" ></td>
												</tr>
												<tr>
													<td>7/12 Number</td>
													<td>
								<input type="text" name="number" readonly style="font-family: monotype corsiva; font-size: 15px" value="<%=number %>" ></td>
												</tr>
												<tr>
													<td>Name</td>
													<td><input type="text" readonly name="name" 
														style="font-family: monotype corsiva; font-size: 15px" value="<%=Owner_Name%>"></td>
												</tr>
												<tr>
													<td>Village Name</td>
													<td><input type="text" readonly name="Village_name" 
														style="font-family: monotype corsiva; font-size: 15px" value="<%=Village_name%>"></td>
												</tr>
 <tr>
													<td>Taluka Name</td>
													<td><input type="text" readonly name="Taluka_name" 
														style="font-family: monotype corsiva; font-size: 15px" value="<%=Taluka_name%>"></td>
												</tr>
												<tr>
													<td>District Name</td>
													<td><input type="text" readonly name="dist_name" 
														style="font-family: monotype corsiva; font-size: 15px" value="<%=Dist_name%>"></td>
												</tr>
		<tr>
													<td>Land Area</td>
													<td><input type="text"  readonly name="land_area" 
														style="font-family: monotype corsiva; font-size: 15px" value="<%=Land_area%>"></td>
												</tr>

<tr>
													<td>Land Sale</td>
													<td><input type="number" name="land_sale" 
														style="font-family: monotype corsiva; font-size: 15px" required>
														<a href="checkInfo.jsp?id=<%=candidateid%>">Check Land Sale</a>
														</td>
												</tr>
<tr>
													<td>Email ID</td>
													<td><input type="text"  readonly name="email_id" 
														style="font-family: monotype corsiva; font-size: 15px" value="<%=emailid%>"></td>
												</tr>
												<tr>
              <td><div align="left">Select Directions</div></td>
              <td><div align="left">
                <select name="directions" required>
                <option value="">Select Directions</option>
                  <option value="West">West</option>
                  <option value="South">South</option>
                  <option value="East">East</option>
                  <option value="North">North</option>
                </select>
              </div></td>
            </tr>
												
												
												
												
		<tr>
								<td align="center" colspan="2"><input type="submit" name="Submit"
									value="Transation" style="font-family: monotype corsiva; font-size: 20px; font-weight: bold" /> </td>
							</tr>
			</table>
		
			</form> 
							
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