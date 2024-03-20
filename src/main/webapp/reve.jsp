<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*" %>
<%@page import="javax.security.auth.message.callback.PrivateKeyCallback.Request"%>
<%@ page import="com.test.Reviewer" %>
<%@ page import="com.test.Connect" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0px;
            padding: 0;
            background-color: #f4f4f4;
            color: #333;
        }

        h1 {
            text-align: center;
            background-color: #2c3e50;
            color: #ecf0f1;
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
            width: 80%;
            max-width: 600px;
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
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }

        .bell-and-modify {
            display: flex;
            align-items: center;
        }

        label {
            display: block;
            margin-top: 10px;
        }

        .profile-photo {
            width: 100px;
            height: 100px;
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
            background-color: #3498db;
            color: white;
            text-decoration: none;
            border-radius: 4px;
            transition: background-color 0.3s ease-in-out;
        }

        #search:hover {
            background-color: #2980b9;
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
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            padding: 20px;
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            z-index: 999;
            width: 20%;
        }

        .modal-content {
            text-align: center;
        }

        .modal-close {
            cursor: pointer;
            position: absolute;
            top: 10px;
            right: 10px;
            font-size: 18px;
        }
        #id{
        display:none;
        }
    </style>
    <title>Reviewers</title>
</head>

<body>
<%if(session.getAttribute("reviewerU")==null || session.getAttribute("reviewerP")==null){
response.sendRedirect("Login.jsp");	
}
%>
 <%  List<Reviewer> list = null;

 
    if(Connect.retrievereviews(Connect.RetrieveID((String)session.getAttribute("reviewerU"), (String)session.getAttribute("reviewerP")))!=null){	
  
    	%>
        <p>WORKED</p>
<% 
    	
    }else {
    	
    		%>
    	<p>NOT</p>
    <%	
    }
%>
<form action="Logout" method="post">
        <button type="submit" name="action" value="buttonClick">Logout</button>
    </form>
    <h1>Welcome Reviewer</h1>
    <form id="editProfileForm" action="edite" method="get">
        <div class="profile-section">
            <img src="profile-photo.jpg" alt="Profile Photo" class="profile-photo">
            <div class="bell-and-modify">
                <button id="notification-bell" onclick="openNotificationModal()">&#128276;</button>
                <button id="modifyButton" type="button" onclick="openModifyModal()">Modify</button>
                
            </div>
        </div>

        <div class="form-content">
            <label for="name" ><%=(String)session.getAttribute("nameR") %></label>
            
            <!-- Include your form content here -->
        </div>

     
    <!-- Modification Modal -->
    <div id="modifyModal" class="modal">
        <div class="modal-content">
            <span class="modal-close" onclick="closeModifyModal()">&times;</span>
            <h2>Modify profile</h2>

            <div class="form-content">
                <label for="conference-title">Photo</label>
                <input type="file" id="conference-title" placeholder="Enter new photo">
            </div>

            <div class="form-content">
                <label for="conference-description">Username</label>
                <input id="conference-description" type="text" name="Username"/>
                 
                <input value="<%=Connect.RetrieveID((String) session.getAttribute("reviewerU"),(String) session.getAttribute("reviewerP")) %>" name="id" id="id" readonly />
            </div>

            <div class="form-content">
                <label for="conference-deadline">Password</label>
                <input type="text" id="conference-deadline" type="password" name="Password">
            </div>

            <div class="buttons-container">
                <button id="modify-conference-btn" onclick="closeModifyModal()">Save</button>
            </div>
        </div>
    </div>
</form>
    <script>
        function openNotificationModal() {
            document.getElementById('notificationModal').style.display = 'block';
        }

        function closeNotificationModal() {
            document.getElementById('notificationModal').style.display = 'none';
        }

        function openModifyModal() {
            document.getElementById('modifyModal').style.display = 'block';
        }

        function closeModifyModal() {
            document.getElementById('modifyModal').style.display = 'none';
        }

        document.getElementById('modifyButton').addEventListener('click', function (event) {
            event.preventDefault();
            openModifyModal();
        });
    </script>
</body>

</html>
