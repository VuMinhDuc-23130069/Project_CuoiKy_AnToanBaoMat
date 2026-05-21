package vn.edu.nlu.fit.model;

public class DeliveryMethods {
    private int id;
    private String methodName;
    private int isActived;
    private double price;


    public DeliveryMethods(int id, String methodName, int isActived, double price) {
        this.id = id;
        this.methodName = methodName;
        this.isActived = isActived;
        this.price = price;
    }
    public DeliveryMethods(){

    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int isActived() {
        return isActived;
    }

    public void setActived(int actived) {
        isActived = actived;
    }

    public String getMethodName() {
        return methodName;
    }

    public void setMethodName(String methodName) {
        this.methodName = methodName;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    @Override
    public String toString() {
        return "DeliveryMethods{" +
                "id=" + id +
                ", methodName=" + methodName +
                ", isActived=" + isActived +
                ", price=" + price +
                '}';
    }
}