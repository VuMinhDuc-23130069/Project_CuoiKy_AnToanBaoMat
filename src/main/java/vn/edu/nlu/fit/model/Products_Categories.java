package vn.edu.nlu.fit.model;

public class Products_Categories {
    private int id;
    private int productID;
    private int categoryID;

    public Products_Categories() {
    }

    public Products_Categories(int id, int productID, int categoryID) {
        this.id = id;
        this.productID = productID;
        this.categoryID = categoryID;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public int getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(int categoryID) {
        this.categoryID = categoryID;
    }

    @Override
    public String toString() {
        return "Products_Categories{" +
                "id=" + id +
                ", productId=" + productID +
                ", categoryId=" + categoryID +
                '}';
    }
}
