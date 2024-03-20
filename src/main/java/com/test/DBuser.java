package com.test;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DBuser {




public static int save(Users s)  {
    int st=0;
    try{
    	Connection con =Connect.getData();
        String sql="insert into userc(user_id,username,password,contact_number,name,email,role) values (?,?,?,?,?,?,?)";
        PreparedStatement preparedStatement=con.prepareStatement(sql);
        preparedStatement.setInt(1,s.getId());
        preparedStatement.setString(2,s.getUsername());
        preparedStatement.setString(3,s.getPassword());
        preparedStatement.setString(4,s.getPhoneNumber());
        preparedStatement.setString(5,s.getName());

        preparedStatement.setString(6,s.getEmail());
        preparedStatement.setString(7,s.getRole());


        st =preparedStatement.executeUpdate();

        con.close();
    } catch (SQLException e) {
        throw new RuntimeException(e);
    }

    return st;
}




    public static int update(Users s) throws SQLException {
        int st=0;
        Connection con=Connect.getData();
        String sql="update userc set user_id=?, name=?, password=?, email=?, username=?, contact_number=?, role=? where user_id=?";
        PreparedStatement preparedStatement=con.prepareStatement(sql);
        preparedStatement.setInt(1,s.getId());
        preparedStatement.setString(2,s.getName());
        preparedStatement.setString(3,s.getPassword());
        preparedStatement.setString(4,s.getEmail());
        preparedStatement.setString(5,s.getUsername());
        preparedStatement.setString(6,s.getPhoneNumber());
        preparedStatement.setString(7,s.getRole());
        preparedStatement.setInt(8,s.getId());
        st =preparedStatement.executeUpdate();
        con.close();
        return st;
    }
    public static int updateAuthor(Users s) throws SQLException{
    int st=0;
    Connection con=Connect.getData();
    String sql="update author set author_id=?,name=?,email=?,phone_number=? where author_id=?";
    PreparedStatement preparedStatement= con.prepareStatement(sql);
    preparedStatement.setInt(1,s.getId());
    preparedStatement.setString(2,s.getName());
    preparedStatement.setString(3,s.getEmail());
    preparedStatement.setString(4,s.getPhoneNumber());
    preparedStatement.setInt(5,s.getId());
    st=preparedStatement.executeUpdate();
    con.close();
    return st;

    }

    public static int updatemanager(Users s) throws SQLException{
        int st=0;
        Connection con=Connect.getData();
        String sql="update manager set manager_id=?,name=?,email=?,phone_number=? where manager_id=?";
        PreparedStatement preparedStatement= con.prepareStatement(sql);
        preparedStatement.setInt(1,s.getId());
        preparedStatement.setString(2,s.getName());
        preparedStatement.setString(3,s.getEmail());
        preparedStatement.setString(4,s.getPhoneNumber());
        preparedStatement.setInt(5,s.getId());
        st=preparedStatement.executeUpdate();
        con.close();
        return st;

    }

    public static int updatereviewer(Users s) throws SQLException{
        int st=0;
        Connection con=Connect.getData();
        String sql="update reviewer set reviewer_id=?,name=?,email=?,phone_number=? where reviewer_id=?";
        PreparedStatement preparedStatement= con.prepareStatement(sql);
        preparedStatement.setInt(1,s.getId());
        preparedStatement.setString(2,s.getName());
        preparedStatement.setString(3,s.getEmail());
        preparedStatement.setString(4,s.getPhoneNumber());
        preparedStatement.setInt(5,s.getId());
        st=preparedStatement.executeUpdate();
        con.close();
        return st;

    }
    public static int delete(int s) throws SQLException {
    int st=0;
    Connection con=Connect.getData();
    String sql="delete from userc where user_id=?";
    PreparedStatement preparedStatement=con.prepareStatement(sql);
   preparedStatement.setInt(1,s);

   st =preparedStatement.executeUpdate();

   return st;
    }
    public static int  deleteM(int s) throws SQLException {
        int st=0;
        Connection con=Connect.getData();
        String sql="delete from manager where manager_id=?";
        PreparedStatement preparedStatement=con.prepareStatement(sql);
        preparedStatement.setInt(1,s);

        st =preparedStatement.executeUpdate();

        return st;

    }


    public static int  deleteA(int s) throws SQLException {
        int st=0;
        Connection con=Connect.getData();
        String sql="delete from author where author_id=?";
        PreparedStatement preparedStatement=con.prepareStatement(sql);
        preparedStatement.setInt(1,s);

        st =preparedStatement.executeUpdate();

        return st;

    }
    public static int  deleteR(int s) throws SQLException {
        int st=0;
        Connection con=Connect.getData();
        String sql="delete from reviewer where reviewer_id=?";
        PreparedStatement preparedStatement=con.prepareStatement(sql);
        preparedStatement.setInt(1,s);

        st =preparedStatement.executeUpdate();

        return st;

    }



    public static Users getuserbyid(int id) throws SQLException {
        Users st=new Users();
        Connection con=Connect.getData();
        String sql="SELECT * FROM userc WHERE user_id=?";
        PreparedStatement preparedStatement=con.prepareStatement(sql);
        preparedStatement.setInt(1,id);
        ResultSet resultSet=preparedStatement.executeQuery();

        if (resultSet.next()){
            st.setUsername(resultSet.getString("USERNAME"));
            st.setPassword(resultSet.getString("PASSWORD"));

            st.setName(resultSet.getString("NAME"));
            st.setEmail(resultSet.getString("EMAIL"));
            st.setRole(resultSet.getString("ROLE"));
            st.setId(resultSet.getInt("USER_ID"));
            st.setPhoneNumber(resultSet.getString("CONTACT_NUMBER"));

        }





        con.close();
        return st;
    }


    public static List<Users> getallusers() throws SQLException {
    List<Users> list=new ArrayList<Users>();
	Connection con =Connect.getData();


        String sql="SELECT * FROM userc";

        PreparedStatement preparedStatement=con.prepareStatement(sql);
        ResultSet resultSet=preparedStatement.executeQuery();

        while (resultSet.next()){
            Users st=new Users();

            st.setUsername(resultSet.getString("USERNAME"));
            st.setPassword(resultSet.getString("PASSWORD"));

            st.setName(resultSet.getString("NAME"));
            st.setEmail(resultSet.getString("EMAIL"));
            st.setRole(resultSet.getString("ROLE"));
            st.setId(resultSet.getInt("user_id"));
            st.setPhoneNumber(resultSet.getString("CONTACT_NUMBER"));
            list.add(st);
        }
   con.close();
        return list;

    }


    public static int saveauthor(Users s){



    int done=0;
    try {
        Connection con=Connect.getData();
        String sql="insert into author(author_id,name,email,phone_number)values(?,?,?,?)";
        PreparedStatement preparedStatement=con.prepareStatement(sql);
        preparedStatement.setInt(1,s.getId());
        preparedStatement.setString(2,s.getName());
        preparedStatement.setString(3,s.getEmail());
        preparedStatement.setString(4,s.getPhoneNumber());
        done= preparedStatement.executeUpdate();
        con.close();
    } catch (SQLException e) {
        throw new RuntimeException(e);
    }

    return done;
    }

    public static int savemaager(Users s){
        int done=0;
        try {
            Connection con=Connect.getData();

            String sql="insert into manager(manager_id,name,email,phone_number)values(?,?,?,?)";
            PreparedStatement preparedStatement=con.prepareStatement(sql);
            preparedStatement.setInt(1,s.getId());
            preparedStatement.setString(2,s.getName());
            preparedStatement.setString(3,s.getEmail());
            preparedStatement.setString(4,s.getPhoneNumber());
            done = preparedStatement.executeUpdate();
            con.close();
            } catch (SQLException e) {
        throw new RuntimeException(e);
    }
        return done;
    }

    public static int savereviwer(Users s){
        int done=0;
        try {
            Connection con=Connect.getData();

            String sql="insert into reviewer(reviewer_id,name,email,phone_number) values(?,?,?,?)";
            PreparedStatement preparedStatement=con.prepareStatement(sql);
            preparedStatement.setInt(1,s.getId());
            preparedStatement.setString(2,s.getName());
            preparedStatement.setString(3,s.getEmail());
            preparedStatement.setString(4,s.getPhoneNumber());
            done= preparedStatement.executeUpdate();
            con.close();
          }catch (SQLException e) {
        throw new RuntimeException(e);
    }
        return done;
    }
    public static Users search(String id) throws SQLException{
        Users st=new Users();
        Connection con=Connect.getData();
        String sql="SELECT * FROM userc WHERE user_id=?";
        PreparedStatement preparedStatement= con.prepareStatement(sql);
        preparedStatement.setString(1,id);

    ResultSet resultSet= preparedStatement.executeQuery();
    if (resultSet.next()){
        st.setUsername(resultSet.getString("USERNAME"));
        st.setPassword(resultSet.getString("PASSWORD"));

        st.setName(resultSet.getString("NAME"));
        st.setEmail(resultSet.getString("EMAIL"));
        st.setRole(resultSet.getString("ROLE"));
        st.setId(resultSet.getInt("USER_ID"));
        st.setPhoneNumber(resultSet.getString("CONTACT_NUMBER"));
    }
       return st;
    }
}
