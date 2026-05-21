package vn.edu.nlu.fit.model;

public class Address {
    private int id;
    private int userId;
    private String recipientName;
    private String phoneNumber;
    private String province;
    private String district;
    private String ward;
    private String street;
    private int isDefault;

    public Address() {
    }

    public Address(int id, int userId, String recipientName, String phoneNumber, String province, String district, String ward, String street, int isDefault) {
        this.id = id;
        this.userId = userId;
        this.recipientName = recipientName;
        this.phoneNumber = phoneNumber;
        this.province = province;
        this.district = district;
        this.ward = ward;
        this.street = street;
        this.isDefault = isDefault;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getRecipientName() {
        return recipientName;
    }

    public void setRecipientName(String recipientName) {
        this.recipientName = recipientName;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province;
    }

    public String getDistrict() {
        return district;
    }

    public void setDistrict(String district) {
        this.district = district;
    }

    public String getWard() {
        return ward;
    }

    public void setWard(String ward) {
        this.ward = ward;
    }

    public String getStreet() {
        return street;
    }

    public void setStreet(String street) {
        this.street = street;
    }

    public int getIsDefault() {
        return isDefault;
    }

    public void setIsDefault(int isDefault) {
        this.isDefault = isDefault;
    }

    @Override
    public String toString() {
        return "Address{" +
                "id=" + id +
                ", userId=" + userId +
                ", recipientName='" + recipientName + '\'' +
                ", phoneNumber='" + phoneNumber + '\'' +
                ", province='" + province + '\'' +
                ", district='" + district + '\'' +
                ", ward='" + ward + '\'' +
                ", street='" + street + '\'' +
                ", isDefault=" + isDefault +
                '}';
    }
}
