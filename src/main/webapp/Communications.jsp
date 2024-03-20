<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*"%>
<%@ page import="com.test.Communication" %>
<%@ page import="com.test.Connect" %>
<%@ page import="com.test.Conference" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Communication</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f5f5f5;
            color: #333;
            margin: 0;
            padding: 20px;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        h1 {
            color: #0066cc;
            margin-bottom: 20px;
        }

        p {
            margin: 10px 0;
        }

        a {
            color: #009933;
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }

        h3 {
            margin-top: 0;
        }

        form {
            margin-top: 10px;
        }

        input[type="radio"] {
            margin-right: 10px;
        }

        input[type="submit"] {
            background-color: #4caf50;
            color: white;
            border: none;
            padding: 10px 15px;
            border-radius: 4px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }

        .communication-container {
            max-width: 800px;
            width: 100%;
            background-color: #fff;
            box-shadow: 0 0 15px #aaa;
            padding: 15px;
            border-radius: 5px;
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <%

    
    if (session.getAttribute("managerU")==null || session.getAttribute("managerP")==null) {
        response.sendRedirect("Login.jsp");
    }
    List<Conference>conf=Connect.RetrieveConf(request.getParameter("conferenceid"));
    %>

    <h1>Communication submitted</h1>

    <% List<Communication> comms = Connect.communication(request.getParameter("conferenceid"));

    if (comms.isEmpty()) {
    %>
        <p>No Pending communications Available.</p>
    <% } else {
    	
    	 Connection conn = null;
    	    PreparedStatement statement = null;
    	    ResultSet result = null;
    	    boolean verified=false;
    	    String base64Article=null;
        for (Communication com : comms) {
        	for(Conference conference:conf){
        		if(conference.getManagerid()==Connect.RetrieveID((String)session.getAttribute("managerU") ,(String)session.getAttribute("managerP")) ){
        			verified=true;
        		}else{
        			response.sendRedirect("Login.jsp");
        		}
        	}
        	if(verified==true){
        	try {
        	   conn = Connect.getData();
        	    statement = conn.prepareStatement("SELECT  article FROM communication WHERE COMMUNICATION_ID=?");
        	    statement.setString(1, com.getCom_id());
        	    result = statement.executeQuery();
        	    if (result.next()) {
        	        Blob pdf = result.getBlob("article");
        	        byte[] pdfData = pdf.getBytes(1, (int) pdf.length());
                    base64Article = Base64.getEncoder().encodeToString(pdfData);
        	    }}catch(Exception e){
        	    	e.printStackTrace();
        	    	}
        	    
    %>
            <div class="communication-container">
                <h3><%= com.getTitle() %></h3>
                <p><%= com.getCom_abstract() %></p>
                <p><%= com.getAuthorname() %></p>
                <p>
                 <a href="data:application/pdf;base64,<%= base64Article %>" target="_blank">Open The Article</a><br/>
                 <a href="data:application/octet-stream;base64, <%= base64Article %>" download="<%=com.getTitle() %>.pdf">Download The Article</a>
            
                </p>
                <form action="ManagerReview" method="post">
                    <input type="hidden" name="commsid" value="<%=com.getCom_id() %>" />
                    <input type="radio" name="radios" value="Accept"/>Accept
                    <input type="radio" name="radios" value="Reject"/>Reject
                    <input type="radio" name="radios" value="Forward"/>Forward
                    <input type="submit"/>
                </form>
            </div>
    <% } }} %>
</body>
</html>
