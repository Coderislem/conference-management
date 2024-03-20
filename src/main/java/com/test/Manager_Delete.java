package com.test;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/Manager_Delete")
public class Manager_Delete extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Manager_Delete() {
        super();
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {

			String cid=request.getParameter("conferenceId");
				int sts=Connect.Delete(cid);
				if(sts>0) {
					RequestDispatcher rds=request.getRequestDispatcher("/Manager.jsp");
					rds.forward(request, response);
				}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
