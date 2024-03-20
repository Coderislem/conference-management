    <%@ page import="java.util.*" %>
<%@ page import="com.test.Conference" %>
<%@ page import="com.test.Connect" %>
<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
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
    </style>
</head>
<body>
<%
String authorid=request.getParameter("authorids");
int authorId=0;
if(authorid!=null){
	  authorId=Integer.parseInt(authorid);
}
if(authorId!=Connect.RetrieveID((String)session.getAttribute("authorU"),(String)session.getAttribute("authorP"))){
response.sendRedirect("Login.jsp");	
}
%>
<h1>Result Conference</h1>
<div class="container">
    <%
        String name = request.getParameter("name");
    List<Conference> list = Connect.allconferance(Connect.RetrieveID((String)session.getAttribute("authorU"), (String)session.getAttribute("authorP")));

        if (list.size() == 0) {
    %>
    <p>NO Result.....</p>
    <% } else { %>
    <div class="conference-list">
        <h4> Result for:<%=name%></h4>
        <ul>
         <%
         
            for (Conference conference : list) {

                	%>
        <li>
            <div class="conference">

                <div style="display: flex;flex-direction: row;justify-content: space-between">
                <form action="createcom.jsp" method="post">
                    <h3>Title: <%= conference.getName() %></h3>
                    <input type="hidden" value="<%=conference.getConferenceId()%>" name="conferenceids" />   
                    <input type="hidden" value="<%=conference.getManagerid() %>" name="managerids" />           
                    <button class="add-button">Add communication</button>
                </form>
                </div>

                <p>ID: <%= conference.getConferenceId() %></p>
                <p>Manager ID:<%= conference.getManagerid() %></p>
                <p>Deadline: <input type="date" value="<%= conference.getAcceptance_deadline() %>" readonly></p>
                <p class="description">Description:<%=  conference.getDescription()%>.</p>
            </div>
        </li>
        <% }} %>
            </ul>
    </div>


</div>
</body>
</html>
