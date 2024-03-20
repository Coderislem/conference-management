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
@WebServlet("/deleteServlet")
public class DeleteServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException{
        response.setContentType("text/html");

        // Hello
        PrintWriter out = response.getWriter();
        String userid=request.getParameter("id");
        int id=Integer.parseInt(userid);
       String role=request.getParameter("role");
        try {
            switch (role){
            case "author": DBuser.deleteA(id);
                break;
            case "manager":DBuser.deleteM(id);
                break;
            case "reviewer":DBuser.deleteR(id);
                break;
        }

            DBuser.delete(id);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        response.sendRedirect("VueServlet");



    }
}
