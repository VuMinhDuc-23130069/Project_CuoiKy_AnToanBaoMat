package vn.edu.nlu.fit.model;

import java.sql.Timestamp;

public class Orders {
    private int id;
    private String fullName;
    private String phone;
    private String email;
    private double total;
    private Timestamp orderDate;
    private String orderAddress;
    private int  orderStatus;
    private int userID;
    private int deliveryMethodID;
    private String deliveryMethod;
    private int paymentMethodID;
    private int discountID;
    private double shippingFee;
    private String discountName;
    private String note;


    public Orders(int id, String fullName, String phone, String email, double total, Timestamp orderDate, String orderAddress, int orderStatus, int userID, int deliveryMethodID, String deliveryMethod, int paymentMethodID, int discountID, double shippingFee) {
        this.id = id;
        this.fullName = fullName;
        this.phone = phone;
        this.email = email;
        this.total = total;
        this.orderDate = orderDate;
        this.orderAddress = orderAddress;
        this.orderStatus = orderStatus;
        this.userID = userID;
        this.deliveryMethodID = deliveryMethodID;
        this.deliveryMethod = deliveryMethod;
        this.paymentMethodID = paymentMethodID;
        this.discountID = discountID;
        this.shippingFee = shippingFee;
    }

    public Orders() {
    }


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public Timestamp  getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Timestamp  orderDate) {
        this.orderDate = orderDate;
    }

    public String getOrderAddress() {
        return orderAddress;
    }

    public void setOrderAddress(String orderAddress) {
        this.orderAddress = orderAddress;
    }

    public int  getOrderStatus() {
        return orderStatus;
    }

    public void setOrderStatus(int  orderStatus) {
        this.orderStatus = orderStatus;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public int getDeliveryMethodID() {
        return deliveryMethodID;
    }

    public void setDeliveryMethodID(int deliveryMethodID) {
        this.deliveryMethodID = deliveryMethodID;
    }

    public int getDiscountID() {
        return discountID;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getPaymentMethodID() {
        return paymentMethodID;
    }

    public void setPaymentMethodID(int paymentMethodID) {
        this.paymentMethodID = paymentMethodID;
    }

    public void setDiscountID(int discountID) {
        this.discountID = discountID;
    }

    public String getDeliveryMethod() {
        return deliveryMethod;
    }

    public void setDeliveryMethod(String deliveryMethod) {
        this.deliveryMethod = deliveryMethod;
    }

    public double getShippingFee() {
        return shippingFee;
    }

    public void setShippingFee(double shippingFee) {
        this.shippingFee = shippingFee;
    }

    @Override
    public String toString() {
        return "Orders{" +
                "id=" + id +
                ", fullName='" + fullName + '\'' +
                ", phone='" + phone + '\'' +
                ", email='" + email + '\'' +
                ", total=" + total +
                ", orderDate=" + orderDate +
                ", orderAddress='" + orderAddress + '\'' +
                ", orderStatus=" + orderStatus +
                ", userID=" + userID +
                ", deliveryMethodID=" + deliveryMethodID +
                ", deliveryMethod='" + deliveryMethod + '\'' +
                ", paymentMethodID=" + paymentMethodID +
                ", discountID=" + discountID +
                '}';
    }

    public String getStatusDescription() {
        switch (this.orderStatus) {
            case 1: return "Chờ xác nhận";
            case 2: return "Đang vận chuyển";
            case 3: return "Đã giao hàng";
            case 4: return "Đã hủy";
            default: return "Đang xử lý";
        }
    }

    public Timestamp getOrderDateAsDate() {
        if (orderDate == null) return null;
        return Timestamp.valueOf(String.valueOf(orderDate));
    }

    public String getDiscountName() { return discountName; }
    public void setDiscountName(String discountName) { this.discountName = discountName; }

    public String getPaymentMethodName() {
        if (this.paymentMethodID == 1) return "Thanh toán khi giao hàng (COD)";
        if (this.paymentMethodID == 2) return "Chuyển khoản qua ngân hàng";
        return "Chưa xác nhận";
    }

    public String getDeliveryMethodName() {
        if (this.deliveryMethodID == 1) return "Giao hàng tận nơi";
        if (this.deliveryMethodID == 2) return "Hỏa tốc";
        return "Vận chuyển thường";
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }
}
