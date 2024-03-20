<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Create Conference</title>
  <style>
    body {
      font-family: 'Arial', sans-serif;
      background: linear-gradient(to right, #3498db, #6ab0de);
      margin: 0;
      padding: 0;
      display: flex;
      align-items: center;
      justify-content: center;
      height: 100vh;
    }

    h1 {
      text-align: center;
      color: #fff;
      margin-bottom: 20px;
      font-size: 2.5em;
    }

    form {
      max-width: 600px;
      width: 100%;
      background: #ffffff;
      padding: 30px;
      border-radius: 8px;
      box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
    }

    table {
      width: 100%;
    }

    tr, td {
      padding: 15px;
    }

    input {
      width: calc(100% - 10px);
      padding: 12px;
      margin-bottom: 15px;
      box-sizing: border-box;
      border: 1px solid #ccc;
      border-radius: 5px;
      background-color: #f8f8f8;
      transition: border-color 0.3s ease-in-out;
    }

    input:focus {
      border-color: #3498db;
    }

    button {
      background: linear-gradient(to right, #2ecc71, #3498db);
      color: white;
      padding: 15px 20px;
      border: none;
      border-radius: 5px;
      cursor: pointer;
      font-size: 1em;
      transition: background 0.3s ease-in-out;
    }

    button:hover {
      background: linear-gradient(to right, #27ae60, #2980b9);
    }
  </style>
</head>
<body>
<% 
if(session.getAttribute("managerU")==null || session.getAttribute("managerP")==null){
response.sendRedirect("Login.jsp");	
}
%>
  <h1>Create Conference</h1>
  <form id="conference-form" action="Manager_Create" method="post">
    <table>
      <tr><td>Title Of Conference:</td><td><input type="text" id="conference-title" name="confname" required/></td></tr>
      <tr><td>Description:</td><td><input type="text" id="conference-description" name="confdesc" required/></td></tr>
      <tr><td>Conference Deadline:</td><td><input type="Date" id="conference-deadline" name="confsub" required/></td></tr>
      <tr><td colspan="2"><button type="submit" id="create-conference-btn">Create Conference</button></td></tr>
    </table>
  </form>

 

</body>
</html>