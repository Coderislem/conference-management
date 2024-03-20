package com.test;

public class Users {

private int id;
private String username;
private String name;
private String password;
private String email;
private String role;
private String phoneNumber;


  /*  public com.example.personproject.Student(int id ,String name,String password,String email,String country,String subject) {
        this.id = id;
        this.name=name;
        this.password=password;
        this.email=email;
        this.country=country;
        this.subject=subject;
    }
*/
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }


    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }
}
