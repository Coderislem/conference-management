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

@WebServlet("/ManagerReview")
public class ManagerReview extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public ManagerReview() {
        super();
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		String result=request.getParameter("radios");
		String commsid=request.getParameter("commsid");
		Random random = new Random();
		LocalDateTime currentDateTime = LocalDateTime.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        String formattedDateTime = currentDateTime.format(formatter);
        String sysdate = formattedDateTime;
		List<Reviewer> selectedReviewers = new ArrayList<>();

		if("Accept".equals(result) || "Reject".equals(result)) {
			try {
				int sts = Connect.status(result,commsid);
				if(sts==1) {
					String noti="The manager has "+result+"ed your communication : "+commsid;
					String location="#";
					
					Notification not=new Notification();
      				not.setNoti(noti);
      				not.setLocation(location);
      				not.setLocaltimes(sysdate);
      				not.setUserid(Connect.retrieveAID(commsid));
      				Connect.insertnotificationM(not);
					session.setAttribute("rslt", "The manager has "+result+"ed your communication : "+commsid);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
		}
		else if ("Forward".equals(result)) {
			try {
			    Connect.fstatus(result,commsid);
			    List<Reviewer> reviewers = Connect.allReviewers();
			    
			    int numberOfReviewers = reviewers.size();
			    int reviewersToSelect = 3;

			    if (numberOfReviewers <= reviewersToSelect) {
			        selectedReviewers.addAll(reviewers);

			    } else {			        
			        Set<Integer> selectedIndices = new HashSet<>();

			        while (selectedIndices.size() < reviewersToSelect) {
			            int randomIndex = random.nextInt(numberOfReviewers);
			            selectedIndices.add(randomIndex);
			        }

			        for (int index : selectedIndices) {
			            selectedReviewers.add(reviewers.get(index));
			        }
			        	
			        
			    }
			} catch (SQLException e) {
			    e.printStackTrace();
			}

		}

		try {
			
			int sts=Connect.reviews(commsid, selectedReviewers);
			session.setAttribute("com", commsid);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		response.sendRedirect("Manager.jsp");

}
}