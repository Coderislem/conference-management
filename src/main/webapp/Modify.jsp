<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
    <%@ page import="com.test.Connect" %>
    <%@ page import="com.test.Conference" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        /* Your existing styles remain unchanged */

        /* Additional creative styles */
        body {
            background-image: linear-gradient(to bottom right, #3498db, #2980b9);
            color: #fff;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }

        form {
            background-color: rgba(255, 255, 255, 0.9);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
            border-radius: 10px;
            padding: 20px;
            width: 300px;
            text-align: center;
        }

        h2 {
            color: #2980b9;
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin-bottom: 8px;
            color: #333;
        }

        input,
        textarea,
        select {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #3498db;
            border-radius: 4px;
            box-sizing: border-box;
        }

        input[type="date"] {
            background-color: #fff;
            color: #333;
        }

        button {
            background-color: #2980b9;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s ease-in-out;
        }

        button:hover {
            background-color: #3498db;
        }
    </style>
    <title>Modify Conferences Page</title>
</head>

<body>
 <%if(session.getAttribute("managerU")==null || session.getAttribute("managerP")==null ){
	response.sendRedirect("Login.jsp");	
	}
	%> 
<% List<Conference> conf=Connect.RetrieveConf(request.getParameter("conferenceId")); %>
    <form id="modifyConferenceForm" action="Manager_Modify" method="post">
        <h2>Modify Conference</h2>
	<input type="hidden" name="confId" value="<%= request.getParameter("conferenceId") %>">
	
        <div class="form-content">
            <label for="conference-title">Title</label>
<%for(Conference conferences:conf){
		
 %>
            <a id="changet" style="color:red; cursor:pointer;">change title</a>
            <input type="text" id="conference-title" placeholder="<%=conferences.getName() %>" value="<%=conferences.getName() %>" name="conferencename"  disabled >

        </div>

        <div class="form-content">
            <label for="conference-description">Description</label>
            <a id="changed" style="color:red; cursor:pointer;">change description</a>
            <textarea id="conference-description" placeholder="<%=conferences.getDescription() %>"  name="description" disabled><%=conferences.getDescription()%></textarea>
        </div>

        <div class="form-content">
            <label for="conference-deadline">Deadline</label>
            <a id="changel" style="color:red; cursor:pointer;">change Deadline</a>
            <input type="date" id="conference-deadline" placeholder="<%=conferences.getAcceptance_deadline() %>" value="<%=conferences.getAcceptance_deadline() %>" disabled name="dates">
        </div>
        <%} %>
        <div class="buttons-container">
            <button type ="submit" id="modify-conference-btn">Update </button>
        </div>
    </form>
<script type="text/javascript">
	
	const link=document.getElementById("changet");
	const link1=document.getElementById("changed");
	const link2=document.getElementById("changel");
	const inp=document.getElementById("conference-title");
	const inp1=document.getElementById("conference-description");
	const inp2=document.getElementById("conference-deadline");
	link.addEventListener("click" ,()=>{
		inp.disabled=false;
	})
	link1.addEventListener("click" ,()=>{
		inp1.disabled=false;
	})
	link2.addEventListener("click" ,()=>{
		inp2.disabled=false;
	})
	    const update=document.getElementById("modify-conference-btn");
    update.addEventListener("click" ,()=>{
		inp.disabled=false;
		inp1.disabled=false;
		inp2.disabled=false;
	})

</script>

</body>

</html>
