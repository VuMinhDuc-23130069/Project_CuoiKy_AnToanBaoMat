package vn.edu.nlu.fit.model;

import java.sql.Timestamp;

public class News {
    private int id;
    private String title;
    private String content;
    private String shortDescription;
    private String imageURL;
    private int userID;
    private Timestamp datePost;
    private int isPublished;

    public News() {
    }

    public News(int id, String content, String title, String imageURL, String shortDescription, int userID, int isPublished, Timestamp datePost) {
        this.id = id;
        this.content = content;
        this.title = title;
        this.imageURL = imageURL;
        this.shortDescription = shortDescription;
        this.userID = userID;
        this.isPublished = isPublished;
        this.datePost = datePost;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getImageURL() {
        return imageURL;
    }

    public void setImageURL(String imageURL) {
        this.imageURL = imageURL;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public Timestamp getDatePost() {
        return datePost;
    }

    public void setDatePost(Timestamp datePost) {
        this.datePost = datePost;
    }

    public int isPublished() {
        return isPublished;
    }

    public void setPublished(int published) {
        isPublished = published;
    }


    public String getShortDescription() {
        return shortDescription;
    }

    public void setShortDescription(String shortDescription) {
        this.shortDescription = shortDescription;
    }

    @Override
    public String toString() {
        return "News{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", content='" + content + '\'' +
                ", shortDescription='" + shortDescription + '\'' +
                ", imageURL='" + imageURL + '\'' +
                ", userID=" + userID +
                ", datePost=" + datePost +
                ", isPublished=" + isPublished +
                '}';
    }

    public String getStatusText() {
        return this.isPublished == 1 ? "Hiển thị" : "Ẩn";
    }

    public int getIsPublished() {
        return isPublished;
    }

    public void setIsPublished(int isPublished) {
        this.isPublished = isPublished;
    }
}