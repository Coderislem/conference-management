package com.test;

import java.io.InputStream;
import java.sql.Blob;
import java.sql.Date;

public class Communication {
	private String  com_id;
	  private   String acsp_state;
	   private InputStream article;
	   private String com_abstract;
	   private String state;
	   private String title;
	   private Date submitteddate;
	   private String Authorname;
	    public String getAuthorname() {
		return Authorname;
	}

	public void setAuthorname(String authorname) {
		Authorname = authorname;
	}

		public Date getSubmitteddate() {
		return submitteddate;
	}

	public void setSubmitteddate(Date submitteddate) {
		this.submitteddate = submitteddate;
	}

		public String getCom_id() {
	        return com_id;
	    }

	    public void setCom_id(String com_id) {
	        this.com_id = com_id;
	    }

	    public String getAcsp_state() {
	        return acsp_state;
	    }

	    public void setAcsp_state(String acsp_state) {
	        this.acsp_state = acsp_state;
	    }

	    public String getCom_abstract() {
	        return com_abstract;
	    }

	    public void setCom_abstract(String com_abstract) {
	        this.com_abstract = com_abstract;
	    }

	    public String getState() {
	        return state;
	    }

	    public void setState(String state) {
	        this.state = state;
	    }

	    public String getTitle() {
	        return title;
	    }

	    public void setTitle(String title) {
	        this.title = title;
	    }

	    public InputStream getArticle() {
	        return article;
	    }

	    public void setArticle(InputStream fileContent) {
	        this.article = fileContent;
	    }
	}

