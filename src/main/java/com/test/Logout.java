package com.test;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/Logout")
public class Logout extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Logout() {
        super();

    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
			session.setAttribute("managerU", null);
         	session.setAttribute("managerP", null); 
         	session.setAttribute("authorU", null);
         	session.setAttribute("authorP", null); 
         	session.setAttribute("reviewerU", null);
         	session.setAttribute("reviewerP", null);
         	RequestDispatcher rd=request.getRequestDispatcher("/Login.jsp");
         	rd.forward(request, response);
	      
	}

}
