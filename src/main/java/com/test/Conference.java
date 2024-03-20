
package com.test;

import java.sql.Date;
import java.util.*;
public class Conference {
private String conferenceId;
private String Name;
private Date acceptance_deadline;
private String description;
private int managerid;
public Conference(String conferenceId, String name, Date acceptance_deadline, String description, int managerid) {
	super();
	this.conferenceId = conferenceId;
	Name = name;
	this.acceptance_deadline = acceptance_deadline;
	this.description = description;
	this.managerid = managerid;
}
public Conference() {}
public String getConferenceId() {
	return conferenceId;
}
public void setConferenceId(String conferenceId) {
	this.conferenceId = conferenceId;
}
public String getName() {
	return Name;
}
public void setName(String name) {
	Name = name;
}
public Date getAcceptance_deadline() {
	return acceptance_deadline;
}
public void setAcceptance_deadline(Date acceptance_deadline) {
	this.acceptance_deadline = acceptance_deadline;
}
public String getDescription() {
	return description;
}
public void setDescription(String description) {
	this.description = description;
}
public int getManagerid() {
	return managerid;
}
public void setManagerid(int managerid) {
	this.managerid = managerid;
}

}
