<%@ page import="com.test.Users" %>
<%@ page import="com.test.DBuser" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Users Table</title>
    <style>
        <!-- يتم نقل جميع أنماط CSS هنا -->
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f7f7f7;
            color: #333;
        }

        .page {
            display: grid;
            height: 100vh;
            grid-template-columns: repeat(10, 1fr);
            grid-template-rows: 60px auto 60px;
            grid-template-areas:
                "logo logo nav nav nav nav nav nav nav nav"
                " content content content content content content content content content content"
                "foot foot foot foot foot foot foot foot foot foot";
        }

        .title {
            grid-area: logo;
            background-color: #3498db;

            color: #fff;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            text-align: center;
        }

        nav {
            display: flex;
            justify-content: flex-end;
            align-items: center;
            grid-area: nav;
            background-color: #3498db;
        }

        nav ul {
            list-style-type: none;
            margin: 0;
            padding: 0;
            display: flex;
        }

        nav li {
            margin-right: 20px;
        }

        nav a {
            text-decoration: none;
            color: #fff;
            font-weight: bold;
            font-size: 16px;
            transition: color 0.3s ease-in-out;
        }

        nav a:hover {
            color: #ecf0f1;
        }

        .page aside {
            grid-area: side;
            background-color: #ecf0f1;
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        section {
            grid-area: content;
            background-color: #fff;
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);

        }
        .container{
            width: 100%;
        }

        footer {
            grid-area: foot;
            background-color: #2c3e50;
            color: #ecf0f1;
            text-align: center;
            padding: 15px;
        }

        table {
            border-collapse: collapse;

        }

        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }

        th {
            background-color: #3498db;
            color: white;
        }

        a {
            text-decoration: none;
            color: #3498db;
        }

        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

<div class="page">
    <div class="title">
    <h3>THE WEBMASTER</h3>
    </div>
    <nav>
        <ul>
            <li><a href="usercreate.html">Add user</a></li>
        </ul>
    </nav>

    <section>
  <div style="display: flex;justify-content: space-between;align-items: center">
      <h4>Users Table</h4>
      <div>
          <form action="searchbyid">
          <input type="text" placeholder="Enter id " name="userid" >
          <input type="submit" value="search">
          </form>
      </div>


  </div>


            <table style="width: 100%">
                <tr>
                    <th>id</th>
                    <th>username</th>
                    <th>Password</th>
                    <th>phone</th>
                    <th>name</th>
                    <th>email</th>
                    <th>role</th>
                    <th>edit</th>
                    <th>delete</th>
                </tr>
                <%
                    List<Users> list = DBuser.getallusers();
                    for (Users users : list) {
                %>
                <tr>
                    <td><%= users.getId() %></td>
                    <td><%= users.getUsername() %></td>
                    <td><%= users.getPassword() %></td>
                    <td><%= users.getPhoneNumber() %></td>
                    <td><%= users.getName() %></td>
                    <td><%= users.getEmail() %></td>
                    <td><%= users.getRole() %></td>
                    <td><a href="deleteServlet?id=<%= users.getId() %>&role=<%= users.getRole() %>">delete</a></td>
                    <td><a href="editjsp.jsp?id=<%= users.getId() %>">edit</a></td>
                </tr>
                <%
                    }
                %>
            </table>

    </section>
</div>

<footer>&copy; 2023 User Registration</footer>
</body>
</html>