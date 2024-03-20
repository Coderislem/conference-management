package com.test;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;


public class Connect {
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
	public static int Create(Conference e){
		int status=0;
		try{
			Connection con=Connect.getData();
			PreparedStatement ps=con.prepareStatement("INSERT INTO conference(CONFERENCE_ID,name, acceptance_deadline, description,manager_id) VALUES (?,?,?,?,?)");
			ps.setString(1, e.getConferenceId());
            ps.setString(2, e.getName());
            ps.setDate(3,e.getAcceptance_deadline()); 
            ps.setString(4,e.getDescription());
            ps.setInt(5,e.getManagerid());
            status=ps.executeUpdate();
			
			con.close();
		}catch(Exception ex){ex.printStackTrace();}
		
		return status;
	}
	public static int RetrieveID(String username,String password) throws SQLException {
		int id=0;
		Connection con = Connect.getData();
        PreparedStatement ps = con.prepareStatement("select * from userC where USERNAME=? and PASSWORD=?");
        ps.setString(1, username);
        ps.setString(2, password);
        ResultSet rs = ps.executeQuery();
        if(rs.next()) {
        	id=rs.getInt("user_id");
        }
        con.close();
        return id ;
        }
	public static List<Conference> Conferences(int id){
		List<Conference> list=new ArrayList<Conference>();
		try{
			Connection con=Connect.getData();
			PreparedStatement ps=con.prepareStatement("select * from conference where manager_id=? and  ACCEPTANCE_DEADLINE>= SYSDATE");
			ps.setInt(1,id);

			ResultSet rs=ps.executeQuery();
			while(rs.next()){
				Conference conf=new Conference();
				conf.setConferenceId(rs.getString(1));
				conf.setName(rs.getString(2));
				conf.setAcceptance_deadline(rs.getDate(3));
				conf.setManagerid(rs.getInt(4));
				conf.setDescription(rs.getString(5));
				list.add(conf);
			}
			con.close();
		}catch(Exception e){e.printStackTrace();}
		
		return list;
	}
	public static List<Conference> RetrieveConf(String confid){
		List<Conference> list=new ArrayList<Conference>();
		try{
			Connection con=Connect.getData();
			PreparedStatement ps=con.prepareStatement("select * from conference where conference_id=? and  ACCEPTANCE_DEADLINE>= SYSDATE");
			ps.setString(1,confid);

			ResultSet rs=ps.executeQuery();
			while(rs.next()){
				Conference conf=new Conference();
				conf.setConferenceId(rs.getString(1));
				conf.setName(rs.getString(2));
				conf.setAcceptance_deadline(rs.getDate(3));
				conf.setManagerid(rs.getInt(4));
				conf.setDescription(rs.getString(5));
				list.add(conf);
			}
			con.close();
		}catch(Exception e){e.printStackTrace();}
		
		return list;
	}
	public static List<Conference> allConferences(){
		List<Conference> list=new ArrayList<Conference>();
		try{
			Connection con=Connect.getData();
			PreparedStatement ps=con.prepareStatement("select * from conference where  ACCEPTANCE_DEADLINE>= SYSDATE");
			ResultSet rs=ps.executeQuery();
			while(rs.next()){
				Conference conf=new Conference();
				conf.setConferenceId(rs.getString(1));
				conf.setName(rs.getString(2));
				conf.setAcceptance_deadline(rs.getDate(3));
				conf.setManagerid(rs.getInt(4));
				conf.setDescription(rs.getString(5));
				list.add(conf);
			}
			con.close();
		}catch(Exception e){e.printStackTrace();}
		
		return list;
	}
	public static List<Notification> notificationM(int id) throws SQLException {
		List<Notification> noti=new ArrayList<Notification>();
		Connection con=Connect.getData();
		PreparedStatement ps=con.prepareStatement("select * from notification where userid=?");
		ps.setInt(1, id);
		ResultSet rs=ps.executeQuery();
		while(rs.next()){
		Notification not=new Notification();
		not.setNotiid(rs.getInt(1));
		not.setNoti(rs.getString(2));
		not.setLocation(rs.getString(3));
		not.setUserid(rs.getInt(4));
		not.setLocaltimes(rs.getString(5));
		noti.add(not);	
		}
		return noti;
	}
	public static int insertnotificationM(Notification notis) throws SQLException {
int sts=0;
		Connection con=Connect.getData();
		PreparedStatement ps=con.prepareStatement("insert into notification values(noti_seq.nextval,?,?,?,?)");
		ps.setString(1,notis.getNoti());
		ps.setString(2,notis.getLocation());
		ps.setInt(3, notis.getUserid());
		ps.setString(4, notis.getLocaltimes());
		sts=ps.executeUpdate();
		return sts;
	}
		public static int retrieveAID(String communicationID) throws SQLException {
			int aid=0;
			Connection con=Connect.getData();
			PreparedStatement ps=con.prepareStatement("select AUTHOR_ID from sender where COMMUNICATION_ID =?");
			ps.setString(1, communicationID);
			ResultSet rs=ps.executeQuery();
			while(rs.next()){
				aid=rs.getInt("Author_id");
			}
			return aid;
		}
		public static List<String> retrievecom(int Authorid) throws SQLException {
			List<String> com= new ArrayList<>();;
			Connection con=Connect.getData();
			PreparedStatement ps=con.prepareStatement("select COMMUNICATION_ID  from sender where AUTHOR_ID=?");
			ps.setInt(1, Authorid);
			ResultSet rs=ps.executeQuery();
			while(rs.next()){
				com.add(rs.getString("COMMUNICATION_ID"));
			}
			return com;
		}
		public static String retrieveConf(String communicationID) throws SQLException {
			String cf = null;
			Connection con=Connect.getData();
			PreparedStatement ps=con.prepareStatement("select CONFERENCE_ID from submitted where COMMUNICATION_ID =?");
			ps.setString(1, communicationID);
			ResultSet rs=ps.executeQuery();
			while(rs.next()){
				cf=rs.getString("CONFERENCE_ID");
			}
			return cf;
		}
	
	public static int Delete(String Confid) throws SQLException {
		int sts=0;
		Connection con=Connect.getData();
		PreparedStatement ps=con.prepareStatement("delete conference where conference_id=?");
		ps.setString(1,Confid);
		sts=ps.executeUpdate();
		con.close();

		return sts;
	}
	
	public static int Modify(Conference e)
	{
		int sts=0;
		try{
			Connection con=Connect.getData();
			PreparedStatement ps=con.prepareStatement("update Conference set NAME=? , ACCEPTANCE_DEADLINE=? , DESCRIPTION=? where manager_id=? and conference_id=?");
			ps.setString(1,e.getName());
			ps.setDate(2,e.getAcceptance_deadline());
			ps.setString(3,e.getDescription());
			ps.setInt(4, e.getManagerid());
			ps.setString(5, e.getConferenceId());
		
			
			sts=ps.executeUpdate();
			
			con.close();
		}catch(Exception ex){ex.printStackTrace();}
		
		return sts;
	}

	public static void saveImageToDatabase(int userid, InputStream inputStream) throws SQLException {
			Connection con = getData();
			PreparedStatement psss = con.prepareStatement("select * from profile where userc=?");
			psss.setInt(1, userid);
			ResultSet rs=psss.executeQuery();
			if(rs.next()) {
			PreparedStatement pss = con.prepareStatement("delete profile where userc=?");
			pss.setInt(1, userid);
			pss.executeUpdate();		
			}	
	        PreparedStatement ps = con.prepareStatement("INSERT INTO Profile (PROFILEID, PFP, userc) VALUES (profile_seq.NEXTVAL, ?, ?)"); {
	        ps.setBinaryStream(1, inputStream);
	        ps.setInt(2, userid);
	        ps.executeUpdate();

	}}
	public static void savenewpsd(int userid, String password) throws SQLException {
		Connection con = getData();
        PreparedStatement ps = con.prepareStatement("update userc set password=? where user_id=?"); {
        ps.setInt(2, userid);
        ps.setString(1, password);
        ps.executeUpdate();

}}

public static int save(Communication s) throws SQLException{
    	int st=0;
        Connection connection= Connect.getData();
        String sql="insert into communication (" +
                "COMMUNICATION_ID,ACCEPTANCE_STATUS,ARTICLE,ABSTRACT,STATUS,TITLE" +
                ")values(?,?,?,?,?,?) ";
        PreparedStatement preparedStatement= connection.prepareStatement(sql);

        preparedStatement.setString(1, s.getCom_id());

        preparedStatement.setString(2, s.getAcsp_state());

        if (s.getArticle()!=null){
            preparedStatement.setBinaryStream(3,s.getArticle());
        }else {
            preparedStatement.setNull(3, Types.BLOB);
        }
        preparedStatement.setString(4, s.getCom_abstract());
        preparedStatement.setString(5, s.getState());
        preparedStatement.setString(6, s.getTitle());

        st = preparedStatement.executeUpdate();
        connection.close();

    
    return st;
}
public static int submitted(String Communicationid ,String conferenceid) throws SQLException {
	int sts=0;
	Connection con=Connect.getData();
	PreparedStatement ps=con.prepareStatement("insert into submitted(COMMUNICATION_ID,CONFERENCE_ID) values(?,?)");
	ps.setString(1, Communicationid);
	ps.setString(2, conferenceid);
	sts=ps.executeUpdate();
	return sts;
}
public static int sender(String Communicationid ,int authorid) throws SQLException {
	int sts=0;
	Connection con=Connect.getData();
	PreparedStatement ps=con.prepareStatement("insert into sender values(?,?)");
	ps.setString(1, Communicationid);
	ps.setInt(2, authorid);
	sts=ps.executeUpdate();
	return sts;
}
public static List<Communication> communication(String confid){
	List<Communication> list=new ArrayList<Communication>();
	try{
		Connection con=Connect.getData();
		PreparedStatement ps=con.prepareStatement("SELECT c.* FROM communication c JOIN submitted s ON c.communication_id = s.communication_id join sender a on a.communication_id=c.communication_id  WHERE c.STATUS!='Closed'  and s.conference_id = ?");
		ps.setString(1,confid);
		ResultSet rs=ps.executeQuery();
		while(rs.next()){
			Communication comm=new Communication();
			comm.setCom_id(rs.getString(1));
			comm.setSubmitteddate(rs.getDate(2));
			comm.setAcsp_state(rs.getString(3));
			Blob blob = rs.getBlob(4);
			if (blob != null) {
			    InputStream inputStream = blob.getBinaryStream();
			    comm.setArticle(inputStream);
			}
			comm.setCom_abstract(rs.getString(5));
			comm.setState(rs.getString(6));
			comm.setTitle(rs.getString(7));
			PreparedStatement pss=con.prepareStatement("SELECT author_id from sender where communication_id=?");
			pss.setString(1,comm.getCom_id());
			ResultSet rss=pss.executeQuery();
			if(rss.next()) {
				PreparedStatement psss=con.prepareStatement("SELECT name from author where author_id=?");
				psss.setInt(1,rss.getInt("author_id"));
				ResultSet rsss=psss.executeQuery();
				if(rsss.next()) {
				comm.setAuthorname(rsss.getString("name"));	
				}
			
			}
			list.add(comm);
		
		}
		con.close();
	}catch(Exception e){e.printStackTrace();}
	
	return list;
}
public static Communication getCommunicationById(String comId) {
    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    try {
        con = getData();
        ps = con.prepareStatement("SELECT * FROM communication WHERE communication_id = ?");
        ps.setString(1, comId);
        rs = ps.executeQuery();

        if (rs.next()) {
            Communication comm = new Communication();
            comm.setCom_id(rs.getString("communication_id"));
            comm.setSubmitteddate(rs.getDate("SUBMISSION_DATE"));
            comm.setAcsp_state(rs.getString("ACCEPTANCE_STATUS"));
            Blob blob = rs.getBlob("ARTICLE");
			if (blob != null) {
			    InputStream inputStream = blob.getBinaryStream();
			    comm.setArticle(inputStream);
			}
            comm.setCom_abstract(rs.getString("ABSTRACT"));
            comm.setState(rs.getString("STATUS"));
            comm.setTitle(rs.getString("TITLE"));
            return comm;
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return null; 
}
public static int status(String result,String commid) throws SQLException {
    int sts = 0;
    Connection con = getData();
    try {
        PreparedStatement ps = con.prepareStatement("UPDATE communication SET STATUS='Closed', ACCEPTANCE_STATUS=? WHERE communication_id=?");
        ps.setString(1, result);
        ps.setString(2, commid);
        sts = ps.executeUpdate();
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return sts;
}
public static int fstatus(String result,String commid) throws SQLException {
    int sts = 0;
    Connection con = getData();
    try {
        PreparedStatement ps = con.prepareStatement("UPDATE communication ACCEPTANCE_STATUS=? WHERE communication_id=?");
        ps.setString(1, result);
        ps.setString(2, commid);
        sts = ps.executeUpdate();
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return sts;
}
public static List<Reviewer> allReviewers() throws SQLException {
	List<Reviewer> list=new ArrayList<>();
	Connection conn=Connect.getData();
    PreparedStatement ps= conn.prepareStatement("select * from reviewer ");
	ResultSet rs=ps.executeQuery();
	if(rs.next()) {
		Reviewer rev=new Reviewer();
		rev.setReviewerId(rs.getInt(1));
		rev.setName(rs.getString(2));
		rev.setEmail(rs.getString(3));
		rev.setPhone(rs.getString(4));
		list.add(rev);
	}	
	return list;
}
public static int reviews(String comm,List<Reviewer> rev) throws SQLException {
	int sts=0;
	Connection conn=Connect.getData();
	for(Reviewer rv:rev) {
    PreparedStatement ps= conn.prepareStatement("insert into reviews values(?,?)");
    ps.setString(1, comm);
    ps.setInt(2, rv.getReviewerId());
    sts=ps.executeUpdate();
	}
	return sts;
}
public static List<String> retrievereviews(int reviewerid) throws SQLException {
	List<String> reviewer=new ArrayList<>();
	Connection conn=Connect.getData();

    PreparedStatement ps= conn.prepareStatement("select COMMUNICATION_ID from reviews where REVIEWER_ID=?");
    ps.setInt(1, reviewerid);

    ResultSet rs=ps.executeQuery();
    if(rs.next()) {
    	
    	reviewer.add(rs.getString("COMMUNICATION_ID"));
    }
	return reviewer;
}
public static List<Communication> resultcom(String author_id) throws SQLException {
    Connection connection=Connect.getData();
    String sql="select com.COMMUNICATION_ID,com.TITLE,com.ACCEPTANCE_STATUS,com.STATUS from COMMUNICATION com,SENDER send" +
            " ,AUTHOR auth  where com.COMMUNICATION_ID=send.COMMUNICATION_ID and send.AUTHOR_ID = auth.AUTHOR_ID and " +
            "send.AUTHOR_ID =? and com.ACCEPTANCE_STATUS is not null";
    PreparedStatement preparedStatement= connection.prepareStatement(sql);
    preparedStatement.setString(1,author_id);
    ResultSet resultSet= preparedStatement.executeQuery();
    List<Communication> list=new ArrayList<>();
    while (resultSet.next()){
        Communication cominication=new Communication();
        cominication.setCom_id(resultSet.getString("COMMUNICATION_ID"));
        cominication.setTitle(resultSet.getString("TITLE"));
        cominication.setAcsp_state(resultSet.getString("ACCEPTANCE_STATUS"));
        cominication.setState(resultSet.getString("STATUS"));
        list.add(cominication);

    }
    return list;
}
public static List<Communication> theComSender(String author_id) throws SQLException {

    Connection connection=Connect.getData();
   String sql="SELECT com.COMMUNICATION_ID, com.TITLE,com.SUBMISSION_DATE \n" +
           "FROM COMMUNICATION com, SENDER send, AUTHOR auth\n" +
           "WHERE com.COMMUNICATION_ID = send.COMMUNICATION_ID\n" +
           "  AND send.AUTHOR_ID = auth.AUTHOR_ID\n" +
           "  AND send.AUTHOR_ID = ?\n" +
           "  AND com.ACCEPTANCE_STATUS IS NULL\n";

    PreparedStatement preparedStatement = connection.prepareStatement(sql);
    preparedStatement.setString(1, author_id);


    ResultSet resultSet= preparedStatement.executeQuery();
    List<Communication> list=new ArrayList<>();
    while (resultSet.next()){
        Communication cominication =new Communication();
        cominication.setTitle(resultSet.getString("TITLE"));
        cominication.setCom_id(resultSet.getString("COMMUNICATION_ID"));
        cominication.setSubmitteddate(resultSet.getDate("SUBMISSION_DATE"));
        list.add(cominication);
    }
    return list;
}
public static List<Conference> allconferance(int id) throws SQLException{

    List<Conference> list=new ArrayList<Conference>();
    Connection connection=Connect.getData();
    String sql="SELECT DISTINCT cnf.CONFERENCE_ID, cnf.name, cnf.ACCEPTANCE_DEADLINE, cnf.MANAGER_ID, cnf.DESCRIPTION\n" +
            "FROM conference cnf\n" +
            "WHERE NOT EXISTS (\n" +
            "    SELECT 1\n" +
            "    FROM Author auth\n" +
            "             JOIN sender send ON auth.author_id = send.author_id\n" +
            "             JOIN communication com ON send.communication_id = com.communication_id\n" +
            "             JOIN submitted subm ON com.COMMUNICATION_ID = subm.COMMUNICATION_ID\n" +
            "    WHERE subm.CONFERENCE_ID = cnf.CONFERENCE_ID AND send.AUTHOR_ID = ?\n" +
            ")";
    PreparedStatement preparedStatement=connection.prepareStatement(sql);
    preparedStatement.setInt(1,id);
    ResultSet resultSet=preparedStatement.executeQuery();
    while (resultSet.next()){
        Conference conferenece=new Conference();
        conferenece.setConferenceId(resultSet.getString(1));
        conferenece.setName(resultSet.getString(2));
        conferenece.setAcceptance_deadline(resultSet.getDate(3));
        conferenece.setManagerid(resultSet.getInt(4));
        conferenece.setDescription(resultSet.getString(5));
        list.add(conferenece);
    }
    connection.close();
    return list;
}

public static List<Conference> searchc(String name,int id) throws SQLException {
List<Conference> list=new ArrayList<>();


    Connection conn=Connect.getData();
    String sql="SELECT DISTINCT cnf.CONFERENCE_ID, cnf.name, cnf.ACCEPTANCE_DEADLINE, cnf.MANAGER_ID, cnf.DESCRIPTION\n" +
            "FROM conference cnf\n" +
            "WHERE NOT EXISTS (\n" +
            "    SELECT 1\n" +
            "    FROM Author auth\n" +
            "             JOIN sender send ON auth.author_id = send.author_id\n" +
            "             JOIN communication com ON send.communication_id = com.communication_id\n" +
            "             JOIN submitted subm ON com.COMMUNICATION_ID = subm.COMMUNICATION_ID\n" +
            "    WHERE subm.CONFERENCE_ID = cnf.CONFERENCE_ID AND send.AUTHOR_ID = ?\n" +
            ") And cnf.name like ?";
    PreparedStatement preparedStatement= conn.prepareStatement(sql);
    preparedStatement.setInt(1,id);
    preparedStatement.setString(2,"%"+name+"%");
    ResultSet resultSet= preparedStatement.executeQuery();
    while (resultSet.next()){
        Conference conferenece=new Conference();
   conferenece.setConferenceId(resultSet.getString(1));
        conferenece.setName(resultSet.getString(2));
        conferenece.setAcceptance_deadline(resultSet.getDate(3));
        conferenece.setManagerid(resultSet.getInt(4));
        conferenece.setDescription(resultSet.getString(5));
        list.add(conferenece);


}
conn.close();
return list;

}


}
