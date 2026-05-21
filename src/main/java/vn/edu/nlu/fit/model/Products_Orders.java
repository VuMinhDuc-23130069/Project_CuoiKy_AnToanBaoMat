package vn.edu.nlu.fit.model;

public class Products_Orders {
    private int id;
    private int orderID;
    private int productID;
    private String productName;
    private int quantity;
    private double priceAtTime;
    private String productImg;

    public Products_Orders() {
    }

    public Products_Orders(int id, int orderID, int productID, String productName, int quantity, double priceAtTime, String productImg) {
        this.id = id;
        this.orderID = orderID;
        this.productID = productID;
        this.productName = productName;
        this.quantity = quantity;
        this.priceAtTime = priceAtTime;
        this.productImg = productImg;
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

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getPriceAtTime() {
        return priceAtTime;
    }

    public void setPriceAtTime(double priceAtTime) {
        this.priceAtTime = priceAtTime;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getProductImg() {
        return productImg;
    }

    public void setProductImg(String productImg) {
        this.productImg = productImg;
    }

    public double getTotalPrice() {
        return this.priceAtTime * this.quantity;
    }

    @Override
    public String toString() {
        return "Products_Orders{" +
                "id=" + id +
                ", orderID=" + orderID +
                ", productID=" + productID +
                ", productName='" + productName + '\'' +
                ", quantity=" + quantity +
                ", priceAtTime=" + priceAtTime +
                ", productImg='" + productImg + '\'' +
                '}';
    }
}
