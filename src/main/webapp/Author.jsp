
<%@ page import="java.util.List" %>
<%@ page import="java.sql.SQLException" %>
    <%@ page import="java.util.*" %>
<%@ page import="com.test.Conference" %>
<%@ page import="com.test.Connect" %>
<%@ page import="com.test.Notification" %>
<%@ page import="java.sql.*" %>
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
            display: block;
            margin-top: 10px;
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
            opacity: 0;
            pointer-events: none;
            display: flex;
            position: fixed;
            top: 14%;
            right: 1%;
            width: fit-content;
            background-color: rgba(0, 0, 0, 0.5);
            justify-content: center;
            align-items: center;
            transition: all 0.3s ease-in-out;
        }.modal.open{
            opacity: 1;
            pointer-events: all;
            transition: all 0.3s ease-in-out;

        }

        .modal-content {
            background-color: #fefefe;
            padding: 20px;
            width: fit-content;
            height: 100px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            max-width: 500px;
            margin: auto;
            transition: all 0.3s ease-in-out;

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
        .profile-section ul li button {
            text-decoration: none;
            border: 0;
            background-color: transparent;
            font-size: 16px;
            font-weight: 600;
            color: black;
        }
        .fa-list {
            cursor: pointer;
            outline: none;
        }
        .modifybt{
            text-decoration: none;
            font-weight: 600;
        }
        .modify{
         opacity: 0;
         pointer-events: none;
        }
        .modify.open{
        opacity: 1;
        pointer-events: all;
        }

    </style>
    <title>Author</title>
</head>

<body>
<%if(session.getAttribute("authorU")==null || session.getAttribute("authorP")==null){
response.sendRedirect("Login.jsp");	
}
%>
<%int authorid=Connect.RetrieveID((String)session.getAttribute("authorU"), (String)session.getAttribute("authorP")); %>
<header style="display: flex;flex-direction: row ;justify-content: space-between">
    <div class="form-content">
           <%
Connection conn = null;
PreparedStatement statement = null;
int profileid = 0;
try {
    conn = Connect.getData();
    statement = conn.prepareStatement("SELECT PROFILEID, PFP FROM profile WHERE userc=?");
    statement.setInt(1, Connect.RetrieveID((String)session.getAttribute("authorU"), (String)session.getAttribute("authorP")));
    ResultSet result = statement.executeQuery();
    if (result.next()) {
        profileid = result.getInt("PROFILEID");
        Blob imageBlob = result.getBlob("PFP");
        byte[] imageData = imageBlob.getBytes(1, (int) imageBlob.length());

        String base64Image = Base64.getEncoder().encodeToString(imageData);
%>
        <img src="data:image/jpeg;base64,<%= base64Image %>" alt="Profile Photo" class="profile-photo">
<%
    } else {
%>
        <img src="defaultimg.webp" alt="Profile Photo" class="profile-photo">
<%
    }
} catch (Exception e) {
    e.printStackTrace();
} 
%>
    <form action="Profiles" method="post" enctype="multipart/form-data">
    				<input type="hidden" value="<%=authorid%>" name="id" />
	  	change image<input type="file" name="image" id="sbm"  />
				<input type="submit" />
				<br>
				<a href="#" id="modifybt" class="modifybt">Modify</a><br>
                <div id="modifying" class="modify">                    
                <br>
                <input type="text" id="changepsd" placeholder="password"  name="newPsd" value="<%=session.getAttribute("authorP") %>" style="background-color: transparent; border: 0; outline: none;font-weight: 600;padding-bottom: 10px;" disabled />           
                <button id="sbm" >/</button>
                <a href="#" style="text-decoration: none;" id="namebtp">Change Password</a>      
                </div>          

				</form>
        <label><%=(String)session.getAttribute("nameA")%></label>
    </div>
    <div class="profile-section">
            <ul  id="navbare">
                <li><a href="#">Edit profile</a></li>
                
                <li>
                <form action="Logout" method="post">
                <button>logout</button>
                </form>
                </li>
            </ul>

         <i class="fa-solid fa-list" onclick="openNav()"></i>
        <button id="notification-bell">&#128276;</button>
        <% List<Notification> list=Connect.notificationM(authorid);
        if(list.size()>=1){
        %>
        <div id="notificationModal" class="modal">
            <div class="modal-content">
                <span class="close">&times;</span>
                <%      
       			 for(Notification not:list){%>
                <a href="<%=not.getLocation()%>">
           		<p><%=not.getNoti() %></p>
            	<p><%=not.getLocaltimes() %></p>
           		 </a> 
			<form action="DeleteNoti" method="post" class="formnoti">
            <button type="submit" name="notificationId" value="<%=not.getNotiid() %>" class="closenoti">x</button>
            </form>
                <%}} %>
            </div>
        </div>
    </div>
</header>
<form id="editProfileForm" action="resultsearch.jsp">

    <div style="display: flex;flex-direction: row ; justify-content: space-between"  >
        <h2>Conferences</h2>
        <div>
        		<input type="hidden" value="<%=authorid %>" name="authorids"/>
                <input type="text" id="inputeSearch" placeholder="Enter title..." name="name">
                <input id="search"  type="submit" style="float: left" value="search"/>
</div>

    </div>
</form>

    <div>
        <%
            try {
                 List<Conference> conferences = Connect.allconferance(Connect.RetrieveID((String)session.getAttribute("authorU"), (String)session.getAttribute("authorP")));
                if (conferences.size() == 0) {
        %>
        <p>No Available Conference At The moment come back later.</p>
        <%
        } else {
        %>
<ul>
        <div class="conference-list">

            <%
            for (Conference conference : conferences) {
																				
        %>
                    <li>
                        <div class="conference">
                            <div style="display: flex;flex-direction: row;justify-content: space-between">
                                <form action="createcom.jsp" method="post">
                                    <h3>Title: <%= conference.getName() %></h3>
                                    <input type="hidden" name="conferenceids" value="<%= conference.getConferenceId() %>" />
                                    <input type="hidden" name="managerids" value="<%= conference.getManagerid() %>" />
                                    <input type="hidden"  name="authorids" value="<%=authorid %>"/>
                                    <button class="add-button">Add communication</button>
                                </form>
                            </div>
                            <p>ID: <%= conference.getConferenceId() %></p>
                            <p>Manager ID: <%= conference.getManagerid() %></p>
                            <p>Deadline: <input type="date" value="<%= conference.getAcceptance_deadline() %>" readonly></p>
                            <p class="description">Description: <%= conference.getDescription() %>.</p>
                        </div>
                    </li>
        <%
                }}
            
        %>
        </ul>

        </ul>
<%
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
    </div>



<script>
document.addEventListener("DOMContentLoaded", function() {
	
	const notibell=document.getElementById("notification-bell");
	const notipage=document.getElementById("notificationModal");
	const close=document.getElementById("leave");
	const icon = document.querySelector(".fa-list");
	const menu = document.querySelector(".profile-section ul");
    const inpname=document.getElementById("changename");
    const inpchange=document.getElementById("namebt");
    const inpchangep=document.getElementById("namebtp");
    const inppsd=document.getElementById("changepsd");
    const modbt=document.getElementById("modifybt");
    const modpg=document.getElementById("modifying");
    const submitbt=document.getElementById("sbm");
    
    function handleBodyClick(event) {
        const isInsidenoti = event.target.closest("#notificationModal");
    if (!isInsidenoti){
        notipage.classList.remove("open");
    }
    if (event.target === notibell) {
        notipage.classList.toggle("open");

    }else if(event.target===close){
        notipage.classList.remove("open");
    }else if (event.target === inpchange) {
    	  inpname.disabled = false;
    } else if (event.target === inpchangep) {
     inppsd.disabled = false;
  }else if(event.target===modbt){
      modpg.classList.toggle("open");
      inppsd.disabled=true;
      inpname.disabled=true;
  }else if(event.target===submitbt){
	  inppsd.disabled=false;
      inpname.disabled=false;
  }
    }   
    document.body.addEventListener("click", handleBodyClick);

    icon.addEventListener("click", function () {
        if (menu.style.display === "block") {
            menu.style.display = "none";
        } else {
            menu.style.display = "block";
        }
    });
    
    });
</script>

</body>
</html>
