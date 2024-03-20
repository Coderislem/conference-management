package com.test;// DatabaseUtility.java
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DatabaseUtility {

    private static String url = "jdbc:oracle:thin:@localhost:1521:XE";
    private static String username = "conference";
    private static String password = "12345";

    static {
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public static Connection getData() throws SQLException {
        return DriverManager.getConnection(url, username, password);

    }

    public static List<Communication> getAllCommunications() throws SQLException {



            List<Communication> communications = new ArrayList<>();
            try {
            Connection connection = getData();
            String query = "SELECT * FROM communication";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Communication communication = new Communication();
                communication.setTitle(resultSet.getString("title"));

                communication.setCom_id(resultSet.getString("COMMUNICATION_ID"));
                communication.setCom_abstract(resultSet.getString("ABSTRACT"));
                communication.setSubmitteddate(resultSet.getDate("SUBMISSION_DATE"));
                communications.add(communication);

            }


        } catch (SQLException e) {
            System.out.println(e);
        }

        return communications;

    }}
