package vn.edu.nlu.fit.model;

import java.io.Serializable;
import java.text.NumberFormat;
import java.util.Locale;

public class Products implements Serializable { //dung javaBean

    private int id;
    private String productName;
    private double price;
    private String imageURL;
    private int productStatus;
    private int quantity;
    private String productDescription;
    private String productExpiryDate;
    private String ingredient;
    private String instruction;
    private String attention;
    private String uses;
    private String categoryName;

    public Products() {
    }

    public Products(int id, String productName, double price, String imageURL, int productStatus, int quantity, String productDescription, String productExpiryDate, String ingredient, String instruction, String attention, String uses) {
        this.id = id;
        this.productName = productName;
        this.price = price;
        this.imageURL = imageURL;
        this.productStatus = productStatus;
        this.quantity = quantity;
        this.productDescription = productDescription;
        this.productExpiryDate = productExpiryDate;
        this.ingredient = ingredient;
        this.instruction = instruction;
        this.attention = attention;
        this.uses = uses;
    }

    public Products(int id, String productName, double price, String imageURL, int quantity, String categoryName) {
        this.id = id;
        this.productName = productName;
        this.price = price;
        this.imageURL = imageURL;
        this.quantity = quantity;
        this.categoryName = categoryName;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public double getPrice() {
        return this.price;
    }

    public String getPriceFormat() {
        Locale localeVN = new Locale("vi", "VN");
        NumberFormat currencyVN = NumberFormat.getCurrencyInstance(localeVN);
        return currencyVN.format(this.price);
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getImageURL() {
        return imageURL;
    }

    public void setImageURL(String imageURL) {
        this.imageURL = imageURL;
    }

    public int getProductStatus() {
        return productStatus;
    }

    public void setProductStatus(int productStatus) {
        this.productStatus = productStatus;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getProductDescription() {
        return productDescription;
    }

    public void setProductDescription(String productDescription) {
        this.productDescription = productDescription;
    }

    public String getProductExpiryDate() {
        return productExpiryDate;
    }

    public void setProductExpiryDate(String productExpiryDate) {
        this.productExpiryDate = productExpiryDate;
    }

    public String getIngredient() {
        return ingredient;
    }

    public void setIngredient(String ingredient) {
        this.ingredient = ingredient;
    }

    public String getInstruction() {
        return instruction;
    }

    public void setInstruction(String instruction) {
        this.instruction = instruction;
    }

    public String getAttention() {
        return attention;
    }

    public void setAttention(String attention) {
        this.attention = attention;
    }

    public String getUses() {
        return uses;
    }

    public void setUses(String uses) {
        this.uses = uses;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    @Override
    public String toString() {
        return "Products{" +
                "id=" + id +
                ", productName='" + productName + '\'' +
                ", price=" + price +
                ", imageURL='" + imageURL + '\'' +
                ", productStatus=" + productStatus +
                ", quantity=" + quantity +
                ", productDescription='" + productDescription + '\'' +
                ", productExpiryDate='" + productExpiryDate + '\'' +
                ", ingredient='" + ingredient + '\'' +
                ", instruction='" + instruction + '\'' +
                ", attention='" + attention + '\'' +
                ", uses='" + uses + '\'' +
                '}';
    }
}
