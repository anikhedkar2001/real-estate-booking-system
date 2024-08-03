<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
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
			<div id="logo"><jsp:include page="titlepage.jsp"></jsp:include>	<p></p>
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
	<div id="page">
		<div id="page-bgtop">
			<div id="page-bgbtm">
				<div id="page-content">
					<div id="content">
						<div class="post">
							
							<form role="form" action="ForgetPass" method="post">
			<div class="form-group">
		<table align="center" class="fileup"  cellspacing="5"
								cellpadding="2" 
								style="font-family: monotype corsiva; font-size: 22px; font-weight: bold">
								<thead>
									<tr bgcolor="#FAEBD7">
										<th colspan="2">Forget Password Page</th>

									</tr>
								</thead>
	       <tr>
			<td class="col-md-2"><label for="txt_Uname">User Name:</label></td>
		    <td class="col-md-6"><input type="text" style="width: 180px;" class="form-control" name="txt_Uname"  required id="txt_Uname" placeholder="Enter Name"></td>
		    </tr>
		
		    <tr>
			<td class="col-md-2"><label for="txt_Email">Email Id:</label></td>
			<td class="col-md-6"><input type="text" style="width: 180px;" class="form-control" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$"  name="txt_Email" required id="txt_Email" placeholder="Enter your Email Id"></td>
			</tr>
			<tr>
			<td class="col-md-6" colspan="2" align="center" ><input type="submit" class="btn-primary" name="btn_Submit" id="btn_Submit" Value="Send"><br>
			<a class="active" href="Registration.jsp">Create New User</a>|<a class="active" href="LoginPage.jsp">Login User</a></td>
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