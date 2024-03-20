<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*" %>
<%@ page import="com.test.Conference" %>
<%@ page import="com.test.Connect" %>
<%@ page import="com.test.Notification" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.OutputStream" %>
<html lang="en">

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
            justify-content: space-around;
            flex-direction: row;

            align-items: center;
            margin-bottom: 20px;
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

        #create-conference-link {
            display: inline-block;
            padding: 10px 15px;
            background-color: #3498db;
            color: white;
            text-decoration: none;
            border-radius: 4px;
            transition: background-color 0.3s ease-in-out;
        }

        #create-conference-link:hover {
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
         .conference-list {
            margin-top: 20px;
        }

        .conference-info {
            border: 1px solid #ccc;
            padding: 10px;
            margin-bottom: 15px;
            background-color: #f9f9f9;
            border-radius: 5px;
        }

        .conference-info h3 {
            margin-top: 0;
            color: #3498db;
            font-size: 18px;
        }

        .conference-info p {
            margin-bottom: 5px;
            color: #555;
            font-size: 14px;
        }

        .conference-info input[type="date"] {
            padding: 5px;
            border-radius: 3px;
            border: 1px solid #ccc;
        }

        .conference-info .description {
            font-size: 12px;
            color: #777;
        }
        
        .time{
            position: relative;
			right: -70%;    
        }
        .conference-info h3{
            text-align: center;
            padding: 0;
            margin: 0;
            margin-top: 15px;
        }
        .cid{
            position: relative;
            top: 0;
            font-size:18;
            margin-left: 5%;
        }
        .desc{
        font-size:17;
		margin-left: 15%;
        }
       
        .desc{
            margin-left: 15%;
        }
        .forms{
            opacity: 0;
            display: flex;
            pointer-events: none;
            height: 0;
            transition: all 0.3s ease-in-out;
        }
        .forms option{
            font-size: 20px;

        }
        .forms.open{
            opacity: 1;
            pointer-events: all;
            height:auto;
            transition: all 0.3s ease-in-out;
        }
        .forms select{
            border: 0;
            border-bottom: 1px solid #111;
            outline: none;
        }
        h2{
		margin-left: 15%;
		width:fit-content;
		text-shadow:0px 5px 10px #111;
        }
        .form-content label{
        margin-bottom:15px;
        }
     .notipage{
     z-index:1;
            opacity: 0;
            pointer-events: none;
            position: absolute;
            top: 0;
            margin-left: 50%;
            margin-top: 9%;
            width: fit-content;
            background-color: #D3D3D3;
        }
        .notipage.open{
            opacity: 1;
            pointer-events: auto;
        }
        .notipage p{
            margin: 20px;
        }.confclick{
      width: 100%;
      height: 100%;
      box-sizing: border-box; 
      background-color: #3498db;
      color: #fff;
      cursor: pointer;
      font-size: 16px;
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
        .closenoti{
        outline:none;
        border:0;
        width:100%;
        }
        .formnoti{
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
    </style>
    <title>Manager</title>
</head>
<body>
<%if(session.getAttribute("managerU")==null || session.getAttribute("managerP")==null || session.getAttribute("managerID")==null || session.getAttribute("nameM")==null){
response.sendRedirect("Login.jsp");	
}
%>
<%
int managerid=0;
Integer mid=(Integer)session.getAttribute("managerID");
if(mid!=null){
	managerid=(int)mid;
}
%>
<form id="editProfileForm" action="Profiles" method="post" enctype="multipart/form-data">
    <div class="profile-section">
    
       <%
Connection conn = null;
PreparedStatement statement = null;
int profileid = 0;
try {
    conn = Connect.getData();
    statement = conn.prepareStatement("SELECT PROFILEID, PFP FROM profile WHERE userc=?");
    statement.setInt(1, mid);
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
                <a id="notification-bell">&#128276;</a>
                <button id="modifyButton" type="button" onclick="openModifyModal()">Modify</button>
    </div>
    		    <input type="hidden" value="<%=mid %>" name="id" >
  	change image<input type="file" name="image" />
            <div class="form-content"> 
				<a href="#" id="modifybt" class="modifybt">Modify</a><br>
                <div id="modifying" class="modify">
                <br>
                <button id="sbm" >/</button>
                <a href="#" style="text-decoration: none;" id="namebtp">Change Password</a>      
                </div>          
            </div>
            <div>
                
                <a href="conferencecreate.jsp" id="create-conference-link">Create Conference</a>
            </div>
        </form>
         
        <div id="notipage" class="notipage">
        <% 
        List<Notification> list=Connect.notificationM(mid);     
        for(Notification not:list){ %>
            <a href="<%=not.getLocation()%>">
            <p><%=not.getNoti() %></p>
            <p><%=not.getLocaltimes() %></p>
            </a> 
            <form action="DeleteNoti" method="post" class="formnoti">
            <button type="submit" name="notificationId" value="<%=not.getNotiid() %>" class="closenoti">x</button>
            </form>
            <%} %>          
        </div>
            <div id="modifyModal" class="modal">
           <form action="Profiles" method="post" enctype="multipart/form-data">
        <div class="modal-content" >
            <span class="modal-close" onclick="closeModifyModal()">&times;</span>
            <h2>Modify profile</h2>

            <div class="form-content">
                <label for="conference-title">Photo</label>
                <input type="file" id="conference-title" name="image" placeholder="Enter new photo">
            </div>

            <div class="form-content">
                <label for="conference-description">Username</label>
                <input id="conference-description" type="text" name="Username"/>
                 
    		    <input type="hidden" value="<%=mid %>" name="id" >
            </div>

            <div class="form-content">
                <label for="conference-deadline">Password</label>
                <input type="text" id="changepsd" placeholder="password"  name="newPsd" value="<%=session.getAttribute("managerP") %>" style="background-color: transparent; border: 0; outline: none;font-weight: 600;padding-bottom: 10px;" disabled />           
           		 <a href="#" style="text-decoration: none;" id="namebtp">Change Password</a>      
           		
            </div>

            <div class="buttons-container">
                <button id="modify-conference-btn" id="sbm"  onclick="closeModifyModal()">Save</button>
            </div>
        </div>
        </form>
    </div>
         
    	<h2>Live Conference</h2>
<%
   List<Conference> conferences =Connect.Conferences(managerid);
   for (Conference conference : conferences) {
%>
    <div class="conference-info">
        <h3><%= conference.getName() %></h3>
        <p class="cid">Conference ID: <%=conference.getConferenceId() %></p>    
        <p class="desc"><%=conference.getDescription() %></p>
        <p class="time">Acceptance Deadline: <%=conference.getAcceptance_deadline() %></p>
        <button class="view-details" onclick="location.href='Communications.jsp?conferenceid=<%=conference.getConferenceId() %>'">Open</button>   
        
    	<button id="toggleform" class="toggleform">...</button>
        <div id="forms" class="forms">
            <form id="conferenceForm" class="conferenceForm" method="post">
            <input type="hidden" name="conferenceId" value="<%= conference.getConferenceId() %>">
                <select id="options" name="options" class="slc">
                    <option value="delete">Delete </option>
                    <option value="modify">Modify</option>
                </select>
                <button id="confirmButton" class="confirmButton">Confirm</button>
            </form>
        </div>
    </div>
<%
   }
%>
   	<form action="Logout" method="post">
        <button type="submit" name="action" value="buttonClick">Logout</button>
    </form>
    
    <script>
document.addEventListener("DOMContentLoaded", function() {
    const btntoggles = document.querySelectorAll(".toggleform");
    const pagetoggles = document.querySelectorAll(".forms");
    const notipg=document.getElementById("notipage");
    const notibtn=document.getElementById("notification-bell");
    const inpname=document.getElementById("changename");
    const inpchange=document.getElementById("namebt");
    const inpchangep=document.getElementById("namebtp");
    const inppsd=document.getElementById("");
    const modbt=document.getElementById("modifybt");
    const modpg=document.getElementById("modifying");
    var submitbt=document.getElementById("sbm");
    function handleBodyClick(event) {
        const isInsidenoti = event.target.closest("#notipage");
    if (!isInsidenoti){
        notipg.classList.remove("open");
    }
    if (event.target === notibtn) {
        notipg.classList.toggle("open");

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

    btntoggles.forEach((btntoggle, index) => {
        btntoggle.addEventListener("click", () => {
            pagetoggles[index].classList.toggle("open");
        });
    });  
    document.querySelectorAll(".confirmButton").forEach((confirmbtn, index) => {
        confirmbtn.addEventListener("click", function () {
            var selectedOption = document.querySelectorAll(".conferenceForm")[index].querySelector(".slc").value;
            var form = document.querySelectorAll(".conferenceForm")[index];

            if (selectedOption === "delete") {
                form.action = "Manager_Delete";
            } else if (selectedOption === "modify") {
                form.action = "Modify.jsp";
            }

            form.submit();
        });
    });
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
});

</script>
    </body>
    
</html>