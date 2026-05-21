package vn.edu.nlu.fit.model;

public  class Payments {
    private int id;
    private int orderID;
    private int paymentMethodID;
    private double amount;
    private boolean paymentStatus;
    private Date paymentDate;


    public Payments() {
    }

    public Payments(int id, int orderID, int paymentMethodID, double amount, boolean paymentStatus, Date paymentDate) {
        this.id = id;
        this.orderID = orderID;
        this.paymentMethodID = paymentMethodID;
        this.amount = amount;
        this.paymentStatus = paymentStatus;
        this.paymentDate = paymentDate;
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

    public int getPaymentMethodID() {
        return paymentMethodID;
    }

    public void setPaymentMethodID(int paymentMethodID) {
        this.paymentMethodID = paymentMethodID;
    }

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }

    public boolean isPaymentStatus() {
        return paymentStatus;
    }

    public void setPaymentStatus(boolean paymentStatus) {
        this.paymentStatus = paymentStatus;
    }

    public Date getPaymentDate() {
        return paymentDate;
    }

    public void setPaymentDate(Date paymentDate) {
        this.paymentDate = paymentDate;
    }

    @Override
    public String toString() {
        return "Payments{" +
                "id=" + id +
                ", orderID=" + orderID +
                ", paymentMethodID=" + paymentMethodID +
                ", amount=" + amount +
                ", paymentStatus=" + paymentStatus +
                ", paymentDate=" + paymentDate +
                '}';
    }
}