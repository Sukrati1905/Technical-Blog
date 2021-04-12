package helper;

import java.io.*;

public class ProfilePicture {
    
    public static boolean deletePicture(String path){
        boolean flag =false;
        try{
            File file=new File(path);
            flag=file.delete();
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return flag;
    } 
    
    public static boolean saveFile(FileInputStream s,String path){
        boolean flag=false;
        try{
            byte b[]=new byte[s.available()];
            s.read(b);
            FileOutputStream file=new FileOutputStream(path);
            file.write(b);
            file.flush();
            file.close();
            flag=true;
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return flag;
    }
    
}
