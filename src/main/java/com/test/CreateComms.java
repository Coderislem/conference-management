package com.test;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import javax.sql.rowset.serial.SerialBlob;

import java.util.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Blob;
import java.sql.SQLException;

import javax.servlet.http.HttpServlet;

@WebServlet("/Createcomms")
@MultipartConfig
public class CreateComms extends HttpServlet {
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        response.setContentType("text/html");
        HttpSession session=request.getSession();
        PrintWriter out = response.getWriter();
        String confid= request.getParameter("confids");
        int managerid= Integer.parseInt(request.getParameter("managerid"));
         System.out.println(confid);
        RandomStringGenerator rsg = new RandomStringGenerator();
        String abstractc=request.getParameter("abstract");
        String title=request.getParameter("title");
        String noti;
        String location;
        
        LocalDateTime currentDateTime = LocalDateTime.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        String formattedDateTime = currentDateTime.format(formatter);
        String sysdate = formattedDateTime;
        
       try { 							
    	int authorid = Connect.RetrieveID((String)session.getAttribute("authorU"),(String) session.getAttribute("authorP"));
    	String commid=rsg.generateRandomString(8);      
        Part file = request.getPart("articles");

         if (file!=null){
             InputStream inputStream=file.getInputStream();
             //byte[] fileContent = Connect.getBytesFromInputStream(inputStream);
             //Blob pdffile=(Blob)inputStream;
        	  Communication comm=new Communication();
        	  comm.setCom_abstract(abstractc);
        	  comm.setTitle(title);
        	  comm.setCom_id(commid);
        	  comm.setArticle(inputStream);
        	  comm.setState("Proccessing");
        	  int test=Connect.save(comm); 	  
        	  if(test==1) {
      		   int sub= Connect.submitted(comm.getCom_id(),confid);
      		   if(sub==1) {
      			 int sen=Connect.sender(commid, authorid);
      			 if(sen==1) {
      				noti="new communication has been created by Author "+authorid+" to confernece: "+confid+"";
      				location="Communications.jsp?conferenceid="+confid;	
      				Notification not=new Notification();
      				not.setNoti(noti);
      				not.setLocation(location);
      				not.setLocaltimes(sysdate);
      				not.setUserid(managerid);
      				Connect.insertnotificationM(not);
      			 }
      		   }
        	  }
        	  file.delete();
        	  inputStream.close();
        	  }else {
        		  out.println("no file was submitted");
        	  }
         
         response.sendRedirect("Author.jsp");
        
        } catch (Exception e) {
        	response.sendRedirect("Author.jsp");
		}


}}
