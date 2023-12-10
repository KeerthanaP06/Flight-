<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home Page</title>
<style>
  body {
    background-image: url('FlightLogin.jpg');
    background-size: cover;
    background-repeat: no-repeat;
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
  }

  .container {
    background-color: rgba(255, 255, 255, 0.8);
    border-radius: 10px;
    padding: 20px;
    width: 300px;
    text-align: center;
  }

  .container h1 {
    margin-top: 0;
    color: #007BFF;
  }

  .form-group {
    text-align: left;
    margin: 15px 0;
  }

  .form-group label {
    display: block;
  }

  .form-group input {
    width: 100%;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 4px;
  }

  .form-group input[type="submit"] {
    background-color: #007BFF;
    color: #fff;
    border: none;
    padding: 12px 20px;
    border-radius: 4px;
    cursor: pointer;
  }

  .form-group input[type="submit"]:hover {
    background-color: #0056b3;
  }
</style>
</head>
<body>
<div class="container">
    <h1>Indian Airlines</h1>
    <form action="login" method="post">
        <div class="form-group">
            <label for="UserName">UserName:</label>
            <input type="text" id="UserName" name="UserName" required>
        </div>
        <div class="form-group">
            <label for="Password">Password:</label>
            <input type="password" id="Password" name="Password" required>
        </div>
        <div class="form-group">
            <input type="submit" value="Login">
        </div>
    </form>
</div>
</body>
</html>
