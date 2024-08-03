<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta name="keywords" content="" />
<meta name="description" content="" />
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>Real Estate Application</title>
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
							<form role="form" action="Login" method="post">
			<div class="form-group">
			<table align="center" class="fileup"  cellspacing="5"
								cellpadding="2" 
								style="font-family: monotype corsiva; font-size: 22px; font-weight: bold">
								<thead>
									<tr bgcolor="#FAEBD7">
										<th colspan="2">User Login Page</th>

									</tr>
								</thead>
								<tr>

								<td>Select:</td>

					<td align=left style="font-size: 20px;"><input type="radio"
						name="rdo1" required value="UserInfo" id="User" />User<input
						type="radio" required name="rdo1" value="AdminInfo" id="admin" />Admin
						
						</td>
								
							<tr>

								<td>Email-Id</td>
								<td width="145" align="right"><input name="username" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$"
									id="userName" type="text" style="width: 180px;" value=''
									required  /></td>
							</tr>
							<tr>
								<td>Password</td>
								<td><input style="width: 180px;" type="password" name="password" required 
									value="" /></td>
							</tr>
							
							<tr>
								<td align="center" colspan="2">
								<input type="submit" value="Login"
									style="font-family: monotype corsiva; font-size: 20px; font-weight: bold"/></td>
							</tr>
<tr><td align="center" colspan="2"><a class="active" href="ForgetPassword.jsp">Forget?</a></td></tr>
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