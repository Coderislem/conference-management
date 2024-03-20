package com.test;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;


@WebServlet("/Profiles")
@MultipartConfig
public class Profiles extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public Profiles() {
        super();
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		String password = request.getParameter("newPsd");
		String username=request.getParameter("username");
		int id=Integer.parseInt(request.getParameter("id"));	
		Part part = request.getPart("image");
		InputStream inputStream = part.getInputStream();

		try {
			if (inputStream != null && inputStream.available() > 0) {
		        Connect.saveImageToDatabase(id, inputStream);
		    }
		    Connect.savenewpsd(id, password);		    
		    request.getRequestDispatcher("Logout").forward(request, response);

		} catch (Exception e) {
		    e.printStackTrace();

		}

	}

}
