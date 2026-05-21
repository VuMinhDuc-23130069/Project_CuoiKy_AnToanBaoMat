package vn.edu.nlu.fit.model;

public class Categories {
    private int id;
    private String categoryName;
    private int isActived;
    private int totalProducts;

    public Categories() {
    }

    public Categories(int id, String categoryName, int isActived) {
        this.id = id;
        this.categoryName = categoryName;
        this.isActived = isActived;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public int getIsActived() {
        return isActived;
    }

    public void setIsActived(int isActived) {
        this.isActived = isActived;
    }

    public int getTotalProducts() {
        return totalProducts;
    }

    public void setTotalProducts(int totalProducts) {
        this.totalProducts = totalProducts;
    }

    @Override
    public String toString() {
        return "Categories{" +
                "id=" + id +
                ", categoryName='" + categoryName + '\'' +
                ", isActived=" + isActived +
                '}';
    }

    public String getStatus() {
        return this.isActived == 1 ? "Hiển thị" : "Ẩn";
    }
}
