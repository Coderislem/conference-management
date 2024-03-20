
package com.test;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/Login")
public class Login extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public Login() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter Out = response.getWriter();
        HttpSession session = request.getSession();
        
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "conference", "12345");

            String n = request.getParameter("textname");
            String p = request.getParameter("textpw");
            PreparedStatement ps = con.prepareStatement("select * from userC where USERNAME=? and PASSWORD=?");
            ps.setString(1, n);
            ps.setString(2, p);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
            	String name=rs.getString("name");
                String role = rs.getString("role");       
                if ("Manager".equals(role)) {
                	session.setAttribute("managerU", n);
                	session.setAttribute("managerP", p); 
                	session.setAttribute("nameM", name);
                	session.setAttribute("managerID",Connect.RetrieveID(n,p));
                    RequestDispatcher rd = request.getRequestDispatcher("/Manager.jsp");
                    rd.forward(request, response);
                } else if ("Author".equals(role)) {
                	session.setAttribute("authorU", n);
                	session.setAttribute("authorP", p); 
                	session.setAttribute("nameA", name);
                    RequestDispatcher rd = request.getRequestDispatcher("/Author.jsp");
                    rd.forward(request, response);
                } else if ("Reviewer".equals(role)) {
                	session.setAttribute("reviewerU", n);
                	session.setAttribute("reviewerP", p); 
                	session.setAttribute("nameR", name);
                    RequestDispatcher rd = request.getRequestDispatcher("/reve.jsp");
                    rd.forward(request, response);
                }
            } 
            else {
            	session.setAttribute("fail","the info you entered doesnt exist");
            	response.sendRedirect("Login.jsp");
            }

        } catch (Exception e) {
            System.out.println(e);
        }
    }
}
