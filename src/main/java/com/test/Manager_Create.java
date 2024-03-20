package com.test;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.util.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
@WebServlet("/Manager_Create")
public class Manager_Create extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public Manager_Create() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       doPost(request,response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	PrintWriter out=response.getWriter();
        String conferenceName = request.getParameter("confname");
        String conferenceDescription = request.getParameter("confdesc");
        String conferenceSubmission = request.getParameter("confsub");
        HttpSession session = request.getSession();

        try {
        	
            RandomStringGenerator rsg = new RandomStringGenerator();
            // Retrieve managerId from the session
            
           String manageruser =(String)session.getAttribute("managerU");
           String managerpsd =(String)session.getAttribute("managerP");
           Integer managerId= Connect.RetrieveID(manageruser,managerpsd);
           if(managerId==0) {
        	   response.sendRedirect("Login.jsp");
           }
            if (managerId != null) {

            	Conference func = new Conference();
            	String userId = rsg.generateRandomString(8);
            	DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
                LocalDate parsedDate = LocalDate.parse(conferenceSubmission, dateFormatter);
                func.setName(conferenceName);
                func.setDescription(conferenceDescription);
                func.setConferenceId(userId);
                func.setManagerid(managerId); 
                func.setAcceptance_deadline(java.sql.Date.valueOf(parsedDate));
            	
            	int sts=Connect.Create(func);
            	if(sts>0){
        			out.print("<p>Record saved successfully!</p>");
        			response.sendRedirect("Manager.jsp");
        		}else{
        			out.println("Sorry! unable to save record");
        		}  
            } else {
                response.getWriter().println("Manager not logged in.");
                }
        } catch (SQLException e) {
			e.printStackTrace();
		}
    }
}
