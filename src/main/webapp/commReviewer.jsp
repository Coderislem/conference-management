<%@ page import="java.sql.Blob" %>

<%@ page import="com.test.Communication" %>
<%@ page import="com.test.DatabaseUtility" %>
<%@ page import="com.test.Connect" %>
<%@ page import="java.util.List" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.util.UUID" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Communication Display</title>
</head>
<body>

<h1>Communication List</h1>

<%
try {

        List<Communication> communications = DatabaseUtility.getAllCommunications();

%>

    <% for (Communication communication : communications) { %>

<div style="border: 1px solid skyblue;background-color: #eee;display: flex;justify-content: space-between">

    <div>
    <h2>Commnication Id:<%=communication.getCom_id()%></h2>
    <h3>Communication title:<%=communication.getTitle()%></h3>
    <p>Abstract:<%=communication.getCom_abstract()%></p>
    <p>submite date: <input type="text" readonly value="<%=communication.getSubmitteddate()%>"></p>
    </div>
    <div>
    <button class="view-details" onclick="location.href='revew.jsp?id=<%=communication.getCom_id() %>'">Open</button>   

    </div>

</div>




    <% } %>



<%
    }catch (SQLException e){
        System.out.println(e);
    }
%>
</body>
</html>
