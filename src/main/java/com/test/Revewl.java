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
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;


@WebServlet("/Revewar")
public class Revewl extends HttpServlet {
    private static final long serialVersionUID = 1L;



    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        int rowsInserted=0;

        
        try {
        	Connection con=Connect.getData();

            String des=request.getParameter("des");
            String Astaet=request.getParameter("AStaet");
            String id = request.getParameter("ids");

            
            RandomStringGenerator rsg = new RandomStringGenerator();
            String  rev= rsg.generateRandomString(8);
            PreparedStatement ps = con.prepareStatement("INSERT INTO review VALUES (?, ?, ?, ?)");
           ps.setString(1,rev);
            ps.setString(2,des);
            ps.setString(3,Astaet);
            ps.setString(4,id);
            
            System.out.println(des);
            System.out.println(Astaet);
            System.out.println(id);
            
           rowsInserted = ps.executeUpdate();
            System.out.println(rowsInserted);
            if (rowsInserted > 0) {
                out.println("<h2>Review submitted successfully!</h2>");
            } else {
                out.println("<h2>Failed to submit review.</h2>");
            }
        } catch (Exception e) {
            out.println("<h2>Error: " + e.getMessage() + "</h2>");
        } 
    }

    

    }
