package dao;


import entities.Category;
import entities.Post;
import java.sql.*;
import java.util.*;

public class PostDao {
    private Connection con;

    public PostDao(Connection con) {
        this.con = con;
    }
    
    public ArrayList<Category> getCategories(){
        ArrayList<Category> list=new ArrayList<>();
        
        try {
            String query="select * from categories";
            Statement st=con.createStatement();
            ResultSet rs=st.executeQuery(query);
            
            while(rs.next()){
                int id=rs.getInt("CID");
                String name=rs.getString("Name");
                String description=rs.getString("Description");
                
                Category c=new Category(id, name, description);
                list.add(c);
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return list;
    }
    
    public boolean savePost(Post p){
        boolean flag=false;
        
        try {
            String query = "insert into posts(PTitle,PContent,PCode,PImage,PLink,CID,UserID) values(?,?,?,?,?,?,?)";
            PreparedStatement st= con.prepareStatement(query);
            st.setString(1, p.getpTitle());
            st.setString(2, p.getpContent());
            st.setString(3, p.getpCode());
            st.setString(4, p.getpImage());
            st.setString(5, p.getpLink());
            st.setInt(6, p.getcID());
            st.setInt(7, p.getuID());
            st.executeUpdate();
            flag =true;
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return flag;
    }
    
    public List<Post> getAllPosts(){
        List<Post> list=new ArrayList<>();
        
        try {
            String query="select * from posts order by pDate desc";
            Statement st=con.createStatement();
            ResultSet rs=st.executeQuery(query);
            
            while(rs.next()){
                int pid=rs.getInt("PID");
                String ptitle=rs.getString("PTitle");
                String pcontent=rs.getString("PContent");
                String pcode=rs.getString("PCode");
                String image=rs.getString("PImage");
                String plink=rs.getString("PLink");
                Timestamp dateTime=rs.getTimestamp("pDate");
                int cid=rs.getInt("CID");
                int uid=rs.getInt("UserID");
                
                Post p=new Post(pid, ptitle, pcontent, pcode, image, plink, dateTime, cid, uid);
                
                list.add(p);
            }
            
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return list;
    }
    
    public List<Post> getPostsByCategoryID(int cid){
        List<Post> list=new ArrayList<>();
        
        try {
            String query="select * from posts where cid="+cid+" order by pDate desc";
            Statement st=con.createStatement();
            ResultSet rs=st.executeQuery(query);
            
            while(rs.next()){
                int pid=rs.getInt("PID");
                String ptitle=rs.getString("PTitle");
                String pcontent=rs.getString("PContent");
                String pcode=rs.getString("PCode");
                String image=rs.getString("PImage");
                String plink=rs.getString("PLink");
                Timestamp dateTime=rs.getTimestamp("pDate");
                int uid=rs.getInt("UserID");
                
                Post p=new Post(pid, ptitle, pcontent, pcode, image, plink, dateTime, cid, uid);
                
                list.add(p);
            }
            
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return list;
    }
    
    public Post getPostByPostId(int pid){
        Post post=null;
        
        try {
            
            Statement st=con.createStatement();
            ResultSet rs=st.executeQuery("select * from posts where pid="+pid);
            while(rs.next()){
                String ptitle=rs.getString("PTitle");
                String pcontent=rs.getString("PContent");
                String pcode=rs.getString("PCode");
                String image=rs.getString("PImage");
                String plink=rs.getString("PLink");
                Timestamp dateTime=rs.getTimestamp("pDate");
                int cid=rs.getInt("CID");
                int uid=rs.getInt("UserID");
                post=new Post(pid, ptitle, pcontent, pcode, image, plink, dateTime, cid, uid);
            }
            
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return post;
    }
    
    public List<Post> getPostByUserId(int uid,int cid){
        List<Post> list=new ArrayList<>();
        
        try {
            
            Statement st=con.createStatement();
            ResultSet rs=st.executeQuery("select * from posts where userid="+uid+" and cid="+cid+" order by pDate desc");
            while(rs.next()){
                String ptitle=rs.getString("PTitle");
                String pcontent=rs.getString("PContent");
                String pcode=rs.getString("PCode");
                String image=rs.getString("PImage");
                String plink=rs.getString("PLink");
                Timestamp dateTime=rs.getTimestamp("pDate");
                int pid=rs.getInt("PID");
                Post post=new Post(pid, ptitle, pcontent, pcode, image, plink, dateTime, cid, uid);
                list.add(post);
            }
            
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return list;
    }
    
    
    public int getPostCountByUserId(int uid){
        int count=0;
        try {
            
            Statement st=con.createStatement();
            ResultSet rs=st.executeQuery("select count(*) from posts where userid="+uid);
            if(rs.next()){
                count=rs.getInt(1);
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return count;
    }
    
    public boolean deletePost(int pid){
        boolean flag=false;
        
        try {
            
            Statement st =con.createStatement();
            st.executeUpdate("delete from posts where pid="+pid);
            flag=true;
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return flag;
    }
}
