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



/*
 Servlet implementation class rev
 */
@WebServlet("/reve")
public class rev extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public rev() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        
    response.setContentType("text/html;charset=UTF-8");
    response.setContentType("text/html");
    PrintWriter out = response.getWriter();
    Connection con = null;
    PreparedStatement pstmt = null;
    
    try {
        Class.forName("oracle.jdbc.driver.OracleDriver");
        con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "conference", "12345");
        System.out.println("Connection");


       String id=request.getParameter("id");
       
        String username = request.getParameter("Username");
        String password = request.getParameter("Password");

       
        String query = "UPDATE userC SET password = ? , username = ? where user_id =?";
        PreparedStatement pst = con.prepareStatement(query);
        pst.setString(1, password);
        pst.setString(2, username);
        pst.setString(3, id);

        int rowsAffected = pst.executeUpdate();
                  
        
        if (rowsAffected > 0) {
            out.println("('User modified successfully");
        } else {
            out.println("('Failed to modify user')");
        }

        
        pst.close();
        con.close();
    } catch (Exception e) {
        out.println("<script> alert('Error: " + e.getMessage() + "');</script>");
    }
}
}
	






























