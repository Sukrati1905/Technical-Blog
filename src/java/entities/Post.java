package entities;

import java.sql.Timestamp;

public class Post {
    
    private int pID;
    private String pTitle;
    private String pContent;
    private String pCode;
    private String pImage;
    private String pLink;
    private Timestamp dateTime;
    private int cID;
    private int uID;

    public Post() {
    }

    public Post(int pID, String pTitle, String pContent, String pCode, String pImage, String pLink, Timestamp dateTime, int cID, int uID) {
        this.pID = pID;
        this.pTitle = pTitle;
        this.pContent = pContent;
        this.pCode = pCode;
        this.pImage = pImage;
        this.pLink = pLink;
        this.dateTime = dateTime;
        this.cID = cID;
        this.uID=uID;
    }

    public Post(String pTitle, String pContent, String pCode, String pImage, String pLink, int cID, int uID) {
        this.pTitle = pTitle;
        this.pContent = pContent;
        this.pCode = pCode;
        this.pImage = pImage;
        this.pLink = pLink;
        this.dateTime = dateTime;
        this.cID = cID;
        this.uID=uID;
    }
    
    

    public String getpLink() {
        return pLink;
    }

    public void setpLink(String pLink) {
        this.pLink = pLink;
    }

    public int getpID() {
        return pID;
    }

    public void setpID(int pID) {
        this.pID = pID;
    }

    public String getpTitle() {
        return pTitle;
    }

    public void setpTitle(String pTitle) {
        this.pTitle = pTitle;
    }

    public String getpContent() {
        return pContent;
    }

    public void setpContent(String pContent) {
        this.pContent = pContent;
    }

    public String getpCode() {
        return pCode;
    }

    public void setpCode(String pCode) {
        this.pCode = pCode;
    }

    public String getpImage() {
        return pImage;
    }

    public void setpImage(String pImage) {
        this.pImage = pImage;
    }

    public Timestamp getDateTime() {
        return dateTime;
    }

    public void setDateTime(Timestamp dateTime) {
        this.dateTime = dateTime;
    }

    public int getcID() {
        return cID;
    }

    public void setcID(int cID) {
        this.cID = cID;
    }

    public int getuID() {
        return uID;
    }

    public void setuID(int uID) {
        this.uID = uID;
    }
    
}
