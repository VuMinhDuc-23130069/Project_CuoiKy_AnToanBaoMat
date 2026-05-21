package vn.edu.nlu.fit.model;

public class Order_Trackings {
    private int id;
    private int orderID;
    private int orderTrackingStatus;
    private String note;
    private Date updateTime;


    public Order_Trackings() {
    }

    public Order_Trackings(int id, int orderID, int orderTrackingStatus, String note, Date updateTime) {
        this.id = id;
        this.orderID = orderID;
        this.orderTrackingStatus = orderTrackingStatus;
        this.note = note;
        this.updateTime = updateTime;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public int isOrderTrackingStatus() {
        return orderTrackingStatus;
    }

    public void setOrderTrackingStatus(int orderTrackingStatus) {
        this.orderTrackingStatus = orderTrackingStatus;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    @Override
    public String toString() {
        return "Order_Trackings{" +
                "id=" + id +
                ", orderID=" + orderID +
                ", orderTrackingStatus=" + orderTrackingStatus +
                ", note='" + note + '\'' +
                ", updateTime=" + updateTime +
                '}';
    }
}