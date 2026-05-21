package vn.edu.nlu.fit.model;

public class Discounts {
    private int id;
    private String discountName;
    private double percentDiscount;
    private int quantity;
    private int discountStatus;

    public Discounts() {
    }

    public Discounts(int id, String discountName, double percentDiscount,int quantity, int discountStatus) {
        this.id = id;
        this.discountName = discountName;
        this.percentDiscount = percentDiscount;
        this.quantity = quantity;
        this.discountStatus = discountStatus;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDiscountName() {
        return discountName;
    }

    public void setDiscountName(String discountName) {
        this.discountName = discountName;
    }

    public double getPercentDiscount() {
        return percentDiscount;
    }

    public void setPercentDiscount(double percentDiscount) {
        this.percentDiscount = percentDiscount;
    }

    public int getDiscountStatus() {
        return discountStatus;
    }

    public void setDiscountStatus(int discountStatus) {
        this.discountStatus = discountStatus;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    @Override
    public String toString() {
        return "Discounts{" +
                "id=" + id +
                ", discountName='" + discountName + '\'' +
                ", percentDiscount=" + percentDiscount +
                ", quantity=" + quantity +
                ", discountStatus=" + discountStatus +
                '}';
    }
}
