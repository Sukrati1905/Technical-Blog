package dao;

import java.sql.*;

public class LikeDao {
    Connection con;

    public LikeDao(Connection con) {
        this.con = con;
    }
    
    public boolean insertLike(int pid,int uid){
        boolean flag=false;
        
        try {
            String query="insert into likes(pid,uid) values(?,?)";
            PreparedStatement st=con.prepareStatement(query);
            st.setInt(1, pid);
            st.setInt(2, uid);
            st.executeUpdate();
            flag=true;
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return flag;
    }
    
    public int countLikes(int pid){
        int count=0;
        
        try {
            String query ="select count(*) from likes where pid="+pid;
            Statement st= con.createStatement();
            ResultSet rs=st.executeQuery(query);
            if(rs.next())
                count=rs.getInt(1);
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return count;
    }
    
    public boolean isLiked(int pid,int uid){
        boolean flag=false;
        
        try {
            String query = "select * from likes where pid="+pid+" and uid="+uid;
            Statement st=con.createStatement();
            ResultSet rs= st.executeQuery(query);
            if(rs.next())
                flag=true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return flag;
    }
    
    public boolean deleteLike(int pid,int uid){
        boolean flag=false;
        
        try {
            
            String query="delete from likes where pid="+pid+"uid="+uid;
            Statement st=con.createStatement();
            st.executeUpdate(query);
            flag=true;
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return flag;
    }
}
