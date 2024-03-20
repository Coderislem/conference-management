<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Login Page</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #ffffff;
            margin: 0;
            padding: 0;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
            color: #ecf0f1;
        }

        .login-container {
            background-color: #3498db;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
            width: 300px;
            text-align: center;
        }

        .login-container h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        .login-form {
            display: flex;
            flex-direction: column;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            font-weight: bold;
            display: inline-block;
            margin-bottom: 5px;
        }

        .form-group input {
            width: 100%;
            padding: 10px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
            margin-bottom: 10px;
        }

        .form-group input[type="submit"] {
            background-color: #66ade8;
            color: #fff;
            cursor: pointer;
            transition: background-color 0.3s ease-in-out;
        }

        .form-group input[type="submit"]:hover {
            background-color: #2b82c0;
        }

        .form-group input[type="submit"]:focus {
            outline: none;
        }
    </style>
</head>

<body>
<%
if ((session.getAttribute("managerU") != null && session.getAttribute("managerP") != null) ||
    (session.getAttribute("authorU") != null && session.getAttribute("authorP") != null) ||
    (session.getAttribute("reviewerU") != null && session.getAttribute("reviewerP") != null)) {
    // Retrieve the original target page
    String targetPage = (String) session.getAttribute("targetPage");

    if (targetPage != null && !targetPage.isEmpty()) {
        response.sendRedirect(targetPage);
    } else {
        if (session.getAttribute("managerU") != null && session.getAttribute("managerP") != null) {
            response.sendRedirect("Manager.jsp");
        } else if (session.getAttribute("authorU") != null && session.getAttribute("authorP") != null) {
            response.sendRedirect("Author.jsp");
        } else if (session.getAttribute("reviewerU") != null && session.getAttribute("reviewerP") != null) {
            response.sendRedirect("Reviewer.jsp");
        }
    }
}
%>


    <div class="login-container">
        <h2>Login</h2>
        <form action="Login" method="post">
            <div class="form-group">
                <label for="USERNAME">Username:</label>
                <input type="text" id="USERNAME" name="textname" required>
            </div>
            <div class="form-group">
                <label for="PASSWORD">Password:</label>
                <input type="PASSWORD" id="PASSWORD" name="textpw" required>
                <%if(session.getAttribute("fail")!=null){%>
                <h4 style="color:red; font-weight:600;"><%=(String)session.getAttribute("fail") %></h4>
                <% session.removeAttribute("fail");} %>
            </div>
            <div class="form-group">
                <input type="submit" value="Login">
            </div>
        </form>
    </div>

</body>