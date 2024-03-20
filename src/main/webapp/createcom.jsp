
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.test.Connect" %>
<html>
<head>
    <title>Conference Form</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0px;
            padding: 0;
            background-color: #f4f4f4;
            color: #333;
        }
        .container{
            display: flex;
            flex-direction: column;

            padding: 30px;
            margin: 50px auto;
            background-color: #ecf0f1;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            width: 80%;

            animation: fadeIn 0.8s ease-in-out;
        }
        h1 {
            text-align: center;
            background-color: #2c3e50;
            color: #ecf0f1;
            padding: 20px;
            margin: 0;
        }

        form {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        label {
            display: block;
            margin-bottom: 5px;
        }

        input[type="text"],
        input[type="file"],
        input[type="submit"] {
            width: 100%;
            padding: 8px;
            margin-bottom: 10px;
            border-radius: 5px;
            border: 1px solid #ccc;
        }

        input[type="radio"] {
            margin-right: 5px;
        }

        input[type="submit"] {
            background-color: #3498db;
            color: #fff;
            border: none;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #2980b9;
        }
        .sucssesd{
            width: 200px;
            height: 80px;
            background-color: #4caf50;
            color: white;
            text-align: center;
            line-height: 80px;
            border-radius: 5px;
            display: none;
        }
    </style>
</head>
<body>
<% 
String authorid=request.getParameter("authorids");
int authorId=0;
if(authorid!=null){
	  authorId=Integer.parseInt(authorid);
}
if(authorId!=Connect.RetrieveID((String)session.getAttribute("authorU"),(String)session.getAttribute("authorP"))||session.getAttribute("authorP")==null || session.getAttribute("authorU")==null){
response.sendRedirect("Login.jsp");	
}
%>
<h1>Add communication </h1>

<div class="container">

<form action="Createcomms" method="post" enctype="multipart/form-data">
    <h2>Add communication</h2>
    <input type="hidden" name="confids" value="<%=request.getParameter("conferenceids") %>"/>
    <input type="hidden" name="managerid" value="<%=request.getParameter("managerids") %>"/>
    <label for="article">Article:</label>
    <input type="file" id="article" name="articles">

    <label for="abstract">Abstract:</label>
    <input type="text" id="abstract" name="abstract">

    <label for="title">Title:</label>
    <input type="text" id="title" name="title">

    <input type="submit" value="Submit">
</form>

</div>
<script>
    function done(){
        var s=document.getElementById("secc");
        s.style.display="block";
    }
</script>
</body>
</html>
