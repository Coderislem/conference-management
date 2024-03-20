<%@ page import="java.util.*" %>
<%@ page import="com.test.Communication" %>
<%@ page import="com.test.Connect" %>
<%@ page import="java.sql.SQLException" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="result.css">
</head>
<body>
<div class="contianer" style="width: 80%;">
    <div class="header">
        <div class="optimyze"  onclick="showList('communication-list', 'communication-list2')">
            The communication send
        </div>
        <div class="result" onclick="showList('communication-list2', 'communication-list')">
            The communication result
        </div>
    </div>
<% try {

List<Communication>result=Connect.resultcom("7");
List<Communication> list=Connect.theComSender("7");

%>
    <div class="communication-list" id="communication-list">
        <%
            for (Communication cominication : list) {
        %>
        <div class="communication-item">

            <h4>ID: <%=cominication.getCom_id()%></h4>

            <p>title: <%=cominication.getTitle()%></p>
            <p>Date: <input type="text" value="<%=cominication.getSubmitteddate()%>"></p>
        </div>
        <%
            }
        %>

    </div>

    <div class="communication-list2" id="communication-list2">
        <%
            for (Communication com : result) {
        %>
        <div class="communication-item">
            <h4>ID: <%=com.getCom_id()%></h4>
            <p>title: <%=com.getTitle()%></p>
            <p>acspt state : <%=com.getAcsp_state()%></p>
        </div>
        <%
            }
        %>


    </div>

    <%
    } catch (SQLException e) {
    %>
    <div style="color: red;">
        <p>An error occurred while fetching communication data. Please try again later.</p>
        <p>Error details: <%= e.getMessage() %></p>
    </div>
    <%
            e.printStackTrace(); // This will print the exception stack trace to the console
        }
    %>
    </div>


<script>
    function showList(showId, hideId) {
        document.getElementById(showId).style.display = 'block';
        document.getElementById(hideId).style.display = 'none';
    }
</script>
</body>
</html>