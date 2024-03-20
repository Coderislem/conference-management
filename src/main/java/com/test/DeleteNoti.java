package com.test;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/DeleteNoti")
public class DeleteNoti extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public DeleteNoti() {
        super();

    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int notiId= Integer.parseInt(request.getParameter("notificationId"));	
		Connection con;
		int sts=0;
		try {
			con = Connect.getData();
			PreparedStatement ps=con.prepareStatement("delete from notification where notiid=? ");
			ps.setInt(1, notiId);
			sts=ps.executeUpdate();
			if(sts==1) {
				response.sendRedirect("Login.jsp");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

}
