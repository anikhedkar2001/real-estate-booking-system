<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta name="keywords" content="" />
<meta name="description" content="" />
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>Registration</title>
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
				<li><a href="LoginPage.jsp">Login</a></li>
				<li><a href="Registration.jsp">Register</a></li>
				
  			
			</ul>
		</div>
	</div>
	<!-- end #menu -->
	
		<div id="page-bgtop">
			<div id="page-bgbtm">
				<div id="page-content">
					<div id="content" >
						<div class="post">
								<form role="form" action="Registration" method="post">

							<table align="center" class="fileup"  cellspacing="5"
								cellpadding="2" 
								style="font-family: monotype corsiva; font-size: 22px; font-weight: bold">
								<thead>
									<tr bgcolor="#FAEBD7">
										<th colspan="2">User Register Page</th>

									</tr>
								</thead>
								
								<tr>
									<td class="lable"  >User Name:</td>
									<td><input type="text" required 
										name="txtName" style="height: 25px; width: 250px;" /></td>
								</tr>
								<tr>
									<td class="lable">Address:</td>
									<td ><input type="text"
										name="txtAddress" style="height: 70px; width: 250px;" required  /></td>
								</tr>
								<tr>
									<td class="lable" >Gender:</td>

									<td align=left ><input
										type="radio" name="rdoGender" value="Male" id="male" required  />Male <input
										type="radio" name="rdoGender" value="FeMale" id="female" required  />Female</td>
								</tr>
								<tr>
									<td class="lable" >Email:</td>
									<td><input type="text" required  pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$"
													name="txtEmail" style="height: 25px; width: 250px;" /></td>
								</tr>
								<tr>
									<td class="lable" >Contact No:</td>
									<td ><input type="text" required pattern="[7-9]{1}[0-9]{9}"  maxlength="10" title="Not a valid Phone Number"
										name="txtContact" style="height: 25px; width: 250px;" /></td>
								</tr>
								<tr>
									<td class="lable" >Password:</td>
									<td ><input type="password" required 
										name="passPassword" style="width: 250px;  height: 25px;" /></td>
								</tr>
								<tr>

									<td colspan="2"  align="center"><input
										type="submit" value="Save Details" style="font-family: monotype corsiva; font-size: 20px; font-weight: bold" /></td>
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
<div id="footer">
	<p></p>
</div>
<!-- end #footer -->
</body>
</html>