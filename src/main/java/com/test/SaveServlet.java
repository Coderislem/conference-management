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

@WebServlet("/SaveServlet")
public class SaveServlet extends HttpServlet {

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
        System.out.println(role);
        int donnSave= 0;
        donnSave = DBuser.save(users);
   switch (role){
       case "Author": donnSave=+DBuser.saveauthor(users);
       break;
       case "Manager":donnSave=+DBuser.savemaager(users);
       break;
       case "Reviewer":donnSave=+DBuser.savereviwer(users);
       break;
   }



        if ( donnSave>0){
                out.write("<h2>the addition seccessd !</h2>");
                try {
                    request.getRequestDispatcher("usercreate.html").include(request,response);
                } catch (ServletException e) {
                    throw new RuntimeException(e);
                }
            }else {
                out.write("<h2>sorry there is somthing wrong !</h2>");
            }


    }

}
