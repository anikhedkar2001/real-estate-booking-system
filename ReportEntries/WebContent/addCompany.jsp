<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Companies</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f9;
        margin: 0;
        padding: 0;
    }
    .container {
        width: 60%;
        margin: 50px auto;
        padding: 20px;
        background-color: #ffffff;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        border-radius: 8px;
    }
    h1 {
        text-align: center;
        color: #333;
    }
    form {
        display: flex;
        flex-direction: column;
        align-items: center;
    }
    label {
        margin-bottom: 10px;
        font-weight: bold;
    }
    input[type="text"], input[type="button"], input[type="submit"] {
        padding: 10px;
        margin-bottom: 20px;
        border: 1px solid #ccc;
        border-radius: 4px;
        font-size: 16px;
        width: 100%;
        box-sizing: border-box;
    }
    input[type="button"], input[type="submit"] {
        background-color: #007bff;
        color: white;
        cursor: pointer;
    }
    input[type="button"]:hover, input[type="submit"]:hover {
        background-color: #0056b3;
    }
    .company-input {
        margin-bottom: 10px;
    }
    .btn-container {
        display: flex;
        justify-content: space-between;
        width: 100%;
    }
    .btn-container input[type="submit"] {
        flex-basis: 100%;
    }
</style>
<script>
function addInput() {
    var div = document.getElementById("companyInputs");
    var input = document.createElement("input");
    input.type = "text";
    input.name = "companyname";
    input.placeholder = "Company Name";
    input.className = "company-input";
    div.appendChild(input);
}
</script>
</head>
<body>
    <div class="container">
        <h1>Add Companies</h1>
        <form action="addCompany" method="post">  
        	<%
                String keyid = (String) session.getAttribute("keyid");
            %>
            <label for="segname">KEYWORD ID:</label>
            <input type="text" name="keyid" value="<%= keyid != null ? keyid : "" %>"><br>
                    
            <div id="companyInputs">
                <label for="companyname">COMPANY NAME:</label>
                <input type="text" name="companyname" placeholder="Company Name" class="company-input"><br>
            </div>
            <input type="button" value="Add Another Company" onclick="addInput()">
            <br>
            <div class="btn-container">
                <input type="submit" value="Submit">
            </div>
        </form>
    </div>
</body>
</html>
