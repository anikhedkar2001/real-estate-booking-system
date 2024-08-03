<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add KeyWord</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f9;
        margin: 0;
        padding: 0;
    }
    .container {
        width: 50%;
        margin: 0 auto;
        padding: 20px;
        background-color: #ffffff;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        border-radius: 8px;
        margin-top: 50px;
    }
    h1 {
        text-align: center;
        color: #333;
    }
    form {
        display: flex;
        flex-direction: column;
    }
    label {
        margin-bottom: 10px;
        font-weight: bold;
    }
    input[type="text"] {
        padding: 10px;
        margin-bottom: 20px;
        border: 1px solid #ccc;
        border-radius: 4px;
        font-size: 16px;
    }
    select {
        padding: 10px;
        margin-bottom: 20px;
        border: 1px solid #ccc;
        border-radius: 4px;
        font-size: 16px;
    }
    input[type="submit"] {
        padding: 10px 20px;
        border: none;
        border-radius: 4px;
        background-color: #007bff;
        color: white;
        font-size: 16px;
        cursor: pointer;
        align-self: center;
    }
    input[type="submit"]:hover {
        background-color: #0056b3;
    }
</style>
</head>
<body>
    <div class="container">
        <h1>KEYWORD DASHBOARD</h1>
        <form action="addKey" method="post">
            <label for="keyid">KEYID:</label>
            <input type="text" id="keyid" name="keyid" required>
            <label for="keyname">KEYNAME:</label>
            <input type="text" id="keyname" name="keyname" required>
            <label for="scope">SCOPE:</label>
            <select id="scope" name="scope">
                <option value="Global">Global</option>
                <option value="Regional">Regional</option>
                <option value="Country">Country</option>
            </select>
            <label for="value">VALUE/VOLUME:</label>
			<input type="text" id="value" name="value" required>
            <input type="submit" value="Submit">
        </form>
    </div>
</body>
</html>