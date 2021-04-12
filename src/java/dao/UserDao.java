package dao;

import entities.User;
import helper.ConnectionProvider;
import java.sql.*;

public class UserDao {
    private Connection con;

    public UserDao(Connection con) {
        this.con = con;
    }
    
    public boolean insert(User user){
        boolean flag=false;
        try{
            con = ConnectionProvider.getConnection();
            String query= "insert into user(name,email,password,gender) values(?,?,?,?)";
            PreparedStatement st=con.prepareStatement(query);
            st.setString(1, user.getName());
            st.setString(2, user.getEmail());
            st.setString(3, user.getPassword());
            st.setString(4, user.getGender());
            st.executeUpdate();
            
            flag=true;
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return flag;
    }
    
    public User getEmailandPassword(String email,String password){
        User user=null;
        try{
            con = ConnectionProvider.getConnection();
            String query= "select * from user where email=? and password=?";
            PreparedStatement st=con.prepareStatement(query);
            st.setString(1, email);
            st.setString(2, password);
            ResultSet rs=st.executeQuery();
            if(rs.next()){
                user = new User();
                user.setName(rs.getString("name"));
                user.setGender(rs.getString("gender"));
                user.setId(rs.getInt("id"));
                user.setEmail(email);
                user.setPassword(password);
                user.setDateTime(rs.getTimestamp("rDate"));
                user.setProfile(rs.getString("Profile"));
            }
            query="select about from aboutUser where id= "+user.getId();
            Statement stmt=con.createStatement();
            rs=stmt.executeQuery(query);
            if(rs.next())
                user.setAbout(rs.getString("about"));
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return user;
    }
    
    public boolean updateInformation(User user){
        boolean flag=false;
        try{
            con=ConnectionProvider.getConnection();
            String query="update user set name='"+user.getName()+"',password='"+user.getPassword()+"',profile='"+user.getProfile()+"' where id="+user.getId();
            Statement st=con.createStatement();
            st.executeUpdate(query);
            query="select * from aboutUser where id="+user.getId();
            st=con.createStatement();
            ResultSet rs=st.executeQuery(query);
            if(!rs.first()){
                query="insert into aboutUser values("+user.getId()+",'"+user.getAbout()+"')";
                st=con.createStatement();
                st.executeUpdate(query);
            }
            else if(rs.first()){
                query="update aboutUser set about='"+user.getAbout()+"' where id="+user.getId();
                st=con.createStatement();
                st.executeUpdate(query);
            }
            flag=true;
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return flag;
    }
    
    public User getUserById(int id){
        User user=new User();
        
        try {
            
            Statement st=con.createStatement();
            ResultSet rs=st.executeQuery("select * from user where id="+id);
            while(rs.next()){
                user.setName(rs.getString("Name"));
                user.setGender(rs.getString("gender"));
                user.setId(rs.getInt("id"));
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                user.setDateTime(rs.getTimestamp("rDate"));
                user.setProfile(rs.getString("Profile"));
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
       
        return user;
    }
    
}
