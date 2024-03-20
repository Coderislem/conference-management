package com.test;
public class Manager {
private int MANAGER_ID;
private String  NAME;
private String Email;
private String Phone_Number;
public Manager(int mANAGER_ID, String nAME, String email, String phone_Number) {
	super();
	MANAGER_ID = mANAGER_ID;
	NAME = nAME;
	Email = email;
	Phone_Number = phone_Number;
}
public Manager() {
	
}
public int getMANAGER_ID() {
	return MANAGER_ID;
}
public void setMANAGER_ID(int mANAGER_ID) {
	MANAGER_ID = mANAGER_ID;
}
public String getNAME() {
	return NAME;
}
public void setNAME(String nAME) {
	NAME = nAME;
}
public String getEmail() {
	return Email;
}
public void setEmail(String email) {
	Email = email;
}
public String getPhone_Number() {
	return Phone_Number;
}
public void setPhone_Number(String phone_Number) {
	Phone_Number = phone_Number;
}

}
