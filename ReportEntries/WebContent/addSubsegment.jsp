<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Subsegment</title>
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

.subsegment-input {
    margin-bottom: 10px;
}

.btn-container {
    display: flex;
    justify-content: space-between;
    width: 100%;
}

.btn-container input[type="submit"] {
    flex-basis: 48%;
}

.add-btn {
    flex-basis: 48%;
    background-color: #28a745;
}

.add-btn:hover {
    background-color: #218838;
}
</style>
<script>
function addInput() {
    var div = document.getElementById("subsegmentInputs");
    var input = document.createElement("input");
    input.type = "text";
    input.name = "subsegname";
    input.placeholder = "Subsegment Name";
    input.className = "subsegment-input";
    div.appendChild(input);
}
</script>
</head>
<body>
    <div class="container">
        <h1>Add Subsegment</h1>
        <form action="addSubseg" method="post">  
        	<%
                String keyid = (String) session.getAttribute("keyid");
            %>          
            <%
                String segname = (String) session.getAttribute("segname");
            %>
           
            <label for="keyid">KEYWORD ID:</label>
            <input type="text" name="keyid" value="<%= keyid != null ? keyid : "" %>" required><br>
            <label for="segname">SEGNAME:</label>
            <input type="text" name="segname" value="<%= segname != null ? segname : "" %>" required><br>
            
            <div id="subsegmentInputs">
                <label for="subsegname">SUBSEGNAME:</label>
                <input type="text" name="subsegname" placeholder="Subsegment Name" class="subsegment-input" required><br>
            </div>
            <input type="button" value="Add Another Subsegment" onclick="addInput()">
            <br>
            <input type="submit" name="submitType" value="Add Segment">
            <input type="submit" name="submitType" value="Add Company">
            <input type="submit" name="submitType" value="Submit">
        </form>
    </div>
</body>
</html>
