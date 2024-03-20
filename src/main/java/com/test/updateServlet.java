package com.test;

import java.io.IOException;
import java.security.SecureRandom;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
@WebServlet("/updateServlet")
public class updateServlet extends HttpServlet {
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html");

        // Hello
        PrintWriter out = response.getWriter();
        String studentid=request.getParameter("id");
        int id= Integer.parseInt(studentid);
        String name=request.getParameter("name");
        String password=request.getParameter("password");
        String email=request.getParameter("email");
        String username=request.getParameter("username");
        String phone=request.getParameter("phoneNumber");
        String role=request.getParameter("role");

        Users users = new Users();
        users.setId(id);
        users.setName(name);
        users.setPassword(password);
        users.setEmail(email);
        users.setUsername(username);
        users.setPhoneNumber(phone);
        users.setRole(role);
        System.out.println(phone);
        try {
            int donnSave=DBuser.update(users);
            switch (role){
                case "Author": donnSave=+DBuser.updateAuthor(users);
                    break;
                case "Manager":donnSave=+DBuser.updatemanager(users);
                    break;
                case "Reviewer":donnSave=+DBuser.updatereviewer(users);
                    break;
            }
            if (donnSave>0){
                out.write("the update is seccessd !");

            }else {
                out.write("sorry there is somthing wrong !");
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }
}
