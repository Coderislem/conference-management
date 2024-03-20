package com.test;

import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/Manager_Modify")
public class Manager_Modify extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public Manager_Modify() {
        super();
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			HttpSession session=request.getSession();
			int id=(int)session.getAttribute("managerID");
			String conferenceid=request.getParameter("confId");
			String coname=request.getParameter("conferencename");
			String desc=request.getParameter("description");
			String conferenceSubmission=request.getParameter("dates");
			DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            LocalDate parsedDate = LocalDate.parse(conferenceSubmission, dateFormatter);
           
			List<Conference> conferences =Connect.Conferences(id);	
			 for (Conference conference : conferences) {
				 
					if(conference.getConferenceId().equals(conferenceid)){
						conference.setAcceptance_deadline(java.sql.Date.valueOf(parsedDate));
						conference.setDescription(desc);
						conference.setName(coname);
						Connect.Modify(conference);
					}

			 } 
	
			 
		response.sendRedirect("Manager.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
