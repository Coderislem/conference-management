<%@ page import="com.test.Users" %>
<%@ page import="com.test.DBuser" %>
<%@ page import="java.sql.SQLException" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Update User Info</title>
    <link href="inputs.css" type="text/css" rel="stylesheet">
</head>
<body>

    <%
        String userid = request.getParameter("id");
        int id = Integer.parseInt(userid);

        try {
            Users user = DBuser.getuserbyid(id);

    %>

        <div class="page">
            <h3 >THE WEBMASTER</h3>
            <nav>
                <ul>
                    <li><a href="VueServlet"> Vue Users</a></li>
                </ul>
            </nav>
            <section >
                <h4>Update user info</h4><br>
                <div class="container">
                    <form action="updateServlet" method="post">
                        <div class="row">
                            <div class="col-25">
                                <label for="id">ID</label>
                            </div>
                            <div class="col-75">
                                <input type="text" name="id" id="id" value="<%=String.valueOf(id)%>" readonly>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-25">
                                <label for="name">Name</label>
                            </div>
                            <div class="col-75">
                                <input type="text" id="name" name="name" value="<%=user.getName()%>" required>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-25">
                                <label for="password">Password</label>
                            </div>
                            <div class="col-75">
                                <input type="text" id="password" name="password" value="<%=user.getPassword()%>" required>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-25">
                                <label for="email">Email</label>
                            </div>
                            <div class="col-75">
                                <input type="email" name="email" id="email" value="<%=user.getEmail()%>" required>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-25">
                                <label for="username">Username</label>
                            </div>
                            <div class="col-75">
                                <input type="text" name="username" id="username" value="<%=user.getUsername()%>" required>
                            </div>
                        </div>
                        <div class="row">

                            <div class="col-75">

                                <input type="text" id="role" name="role" value="<%=user.getRole()%>" readonly style="display: none">
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-25">
                                <label for="phoneNumber">Number Phone</label>
                            </div>
                            <div class="col-75">
                                <input type="tel" id="phoneNumber" name="phoneNumber" value="<%=user.getPhoneNumber()%>" required>
                            </div>
                        </div>
                        <br>
                        <div class="row">
                            <input type="submit" value="Submit">
                        </div>
                    </form>
                </div>
            </section>

            <footer>&copy; 2023 User edit</footer>
        </div>



    </div>

</div>
<%

}catch (SQLException e){
    throw new RuntimeException(e);
}%>
</body>
</html>