<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
      body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
            color: #333;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }

        h1 {
            text-align: center;
            background-color: #3498db;
            color: white;
            padding: 20px;
            margin: 0;
            font-size: 3em;
            border-radius: 8px 8px 0 0;
        }

        form {
            display: flex;
            flex-direction: column;
            padding: 30px;
            background-color: #ecf0f1;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            width: 80%;
            max-width: 600px;
            animation: fadeIn 0.8s ease-in-out;
        }

        .profile-section {
            text-align: center;
            margin-bottom: 20px;
        }

        .profile-photo {
            width: 120px;
            height: 120px;
            border-radius: 50%;
            object-fit: cover;
            border: 4px solid #3498db;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .form-content {
            margin-bottom: 20px;
        }

        label {
            font-size: 1.2em;
            margin-bottom: 8px;
        }

        h2 {
            text-align: center;
            font-size: 1.8em;
            margin-bottom: 15px;
        }
        h3{
            text-align: center;
            font-size: 1.8em;
            margin-bottom: 15px; 
        }

        ul {
            list-style-type: none;
            padding: 0;
            margin: 0;
        }

        li {
            background-color: #ecf0f1;
            padding: 15px;
            margin-bottom: 10px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease-in-out;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        li:hover {
            transform: scale(1.02);
        }

        .buttons-container {
            display: flex;
            justify-content: space-between;
        }

        button {
            background-color: #3498db;
            color: white;
            padding: 8px 12px;
            font-size: 1em;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s ease-in-out;
        }

        button:hover {
            background-color: #2980b9;
        }

        table {
            width: 100%;
            margin-top: 20px;
        }

        td {
            padding: 12px;
        }

        input,
        select {
            width: calc(100% - 10px);
            padding: 10px;
            margin-bottom: 15px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 5px;
            background-color: #f8f8f8;
            transition: border-color 0.3s ease-in-out;
        }

        input:focus,
        select:focus {
            border-color: #3498db;
        }

        h4 {
            text-align: center;
            margin-top: 30px;
            font-size: 2em;
            color: #3498db;
        }
    </style>
    <title>Combined Page</title>
</head>

<body>
<%
String comId=request.getParameter("id");
    System.out.println(comId);
%>

    <form id="editProfileForm" action="Revewar" method="post">
        <div class="profile-section">
            <img src="profile-photo.jpg" alt="Profile Photo" class="profile-photo">
        </div>

        <div class="form-content">
            <label >Name</label>
        
        </div>
        <h3>Conferences</h3>
        <ul id="conference-list"></ul>


    <h4>Add comment</h4>
    
        <table>
            <tr>
                <td>Description:</td>
                <td><input type="text" id="comment-description" name="des" placeholder="Enter description"/></td>
            </tr>
            <tr>
                <td>Status:</td>
                <td>
                   
                      Accept
 <input type="text" name="AStaet" value="Accept"/>
                </td>

            </tr>
            
        </table>

        <div class="buttons-container">
        <input type="hidden" value="<%=comId%> "name="ids" style="display: none" />
            <input type="submit" value="sand">
           
        </div>

    </form>
    <script>
       

        
        function sendComment() {
            const description = document.getElementById('comment-description').value;
            const status = document.getElementById('comment-status').value;

          
            const data = {
                description: description,
                status: status
            };

            
            const endpoint = 'YOUR_SERVER_ENDPOINT';


        }
    </script>

</body>

</html>
