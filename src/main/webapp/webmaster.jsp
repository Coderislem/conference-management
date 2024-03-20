
<%@ page import="java.util.List" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="com.test.DBuser" %>
<%@ page import="com.test.Users" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/all.min.css">
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0px;
            padding: 0;
            background-color: #f4f4f4;
            color: #333;
        }

        header {

            background-color: #ecf0f1;
            color: black;
            padding: 20px;
            margin: 0;
        }

        form {
            display: flex;
            flex-direction: column;

            padding: 30px;
            margin: 50px auto;
            background-color: #ecf0f1;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            width: 90%;

            animation: fadeIn 0.8s ease-in-out;
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(-20px);
            }

            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .profile-section {
            display: flex;
            justify-content: space-around;
            flex-direction: row;

            align-items: center;
            margin-bottom: 20px;
        }

        label {

            margin:0px 10px;
        }
        .form-content{
            display: flex;
            align-items: center;
        }

        .profile-photo {
            width: 70px;
            height: 70px;
            border-radius: 50%;
            object-fit: cover;
            margin-bottom: 10px;
            border: 4px solid #3498db;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        button {
            background-color: #3498db;
            color: white;
            padding: 10px 15px;
            font-size: 14px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s ease-in-out;
        }

        button:hover {
            background-color: #2980b9;
        }

        #search {
            display: inline-block;
            padding: 10px 15px;
            margin: 10px;
            background-color: #3498db;
            color: white;
            text-decoration: none;
            border-radius: 4px;
            transition: background-color 0.3s ease-in-out;
        }

        #search:hover {
            background-color: #2980b9;
        }
        #inputeSearch{
            display: inline-block;
            padding: 10px 15px;
            margin: 10px;
            border-color: rgb(128, 128, 128);
            border-radius: 1.2px;

        }

        #conference-list {
            list-style-type: none;
            padding: 0;
        }

        #conference-list li {
            background-color: #ecf0f1;
            padding: 15px;
            margin-bottom: 10px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease-in-out;
        }

        #conference-list li:hover {
            transform: scale(1.02);
        }

        #notification-bell {
            background-color: #ecf0f1;
            color: #3498db;
            border: none;
            cursor: pointer;
            font-size: 24px;
            transition: color 0.3s ease-in-out;
        }

        #notification-bell:hover {
            color: #2980b9;
        }

        .modal {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            justify-content: center;
            align-items: center;
        }

        .modal-content {
            background-color: #fefefe;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            max-width: 400px;
            margin: auto;
        }

        .close {
            float: right;
            cursor: pointer;
        }
        .conference-list {
            margin-top: 20px;
        }

        .conference {
            border: 1px solid #ccc;
            padding: 10px;
            margin-bottom: 15px;
            background-color: #f9f9f9;
            border-radius: 5px;
        }

        .conference h3 {
            margin-top: 0;
            color: #3498db;
            font-size: 18px;
        }

        .conference p {
            margin-bottom: 5px;
            color: #555;
            font-size: 14px;
        }

        .conference input[type="date"] {
            padding: 5px;
            border-radius: 3px;
            border: 1px solid #ccc;
        }

        .conference .description {
            font-size: 12px;
            color: #777;
        }
        .add-button {

            top: 10px;
            right: 10px;
            padding: 8px 12px;
            background-color: #3498db;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .add-button:hover {
            background-color: #2980b9;
        }

        .nav{

            background-color: #eee;
        }
        .profile-section ul {
            display: none;
            list-style: none;

            padding: 0;
            position: absolute;
            background-color: #eee;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            z-index: 1;
            text-align: center;
            width: 150px;
            top: 70px;
            right: 40px;
        }

        .profile-section ul li {
            padding: 10px;
            border-bottom: 1px solid #ccc;
            width: 100%;
        }

        .profile-section ul li a {
            text-decoration: none;
            font-size: 16px;
            color: black;
        }

        .fa-list {
            cursor: pointer;
            outline: none;
        }
        section {
            grid-area: content;
            background-color: #fff;
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);

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
    <title>Autor</title>
</head>

<body>

<header style="display: flex;flex-direction: row ;justify-content: space-between">
    <div class="form-content">
        <img src="profile-photo.jpg" alt="Profile Photo" class="profile-photo">

        <label ><%=(String)request.getAttribute("nameA")%></label>
    </div>
    <div class="profile-section">

        <ul  id="navbare">
            <li><a href="usercreate.html">add user</a></li>
            <li><a href="#">edit profil</a></li>
            <li><a href="#">logout</a></li>

        </ul>

        <i class="fa-solid fa-list" onclick="openNav()"></i>
        <button id="notification-bell">&#128276;</button>
        <div id="notificationModal" class="modal">
            <div class="modal-content">
                <span class="close" onclick="closeNotificationModal()">&times;</span>
                <p>Notification  Here</p>
            </div>
        </div>
    </div>
</header>
<form id="editProfileForm" action="resultsearch.jsp">

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

</form>

<script>
    function openNotificationModal() {
        document.getElementById('notificationModal').style.display = 'flex';
    }

    function closeNotificationModal() {
        document.getElementById('notificationModal').style.display = 'none';
    }

    document.getElementById('notification-bell').addEventListener('click', openNotificationModal);
    document.addEventListener("DOMContentLoaded", function () {
        var icon = document.querySelector(".fa-list");
        var menu = document.querySelector(".profile-section ul");

        icon.addEventListener("click", function () {
            if (menu.style.display === "block") {
                menu.style.display = "none";
            } else {
                menu.style.display = "block";
            }
        });
    });
</script>
</script>
</body>
</html>
