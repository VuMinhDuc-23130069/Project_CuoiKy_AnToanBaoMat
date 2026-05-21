package vn.edu.nlu.fit.model;

import java.time.LocalDate;
import java.time.LocalDateTime;

public class Users {
    private int id;
    private String fullName;
    private String userAddress;
    private LocalDate birthday;
    private String email;
    private String phoneNumber;
    private String imageURL;
    private String username;
    private String password_hash;
    private String userRole;
    private boolean active;
    private String resetToken;
    private LocalDateTime resetExpired;
    public Users() {
    }

    public Users(int id, String fullName, String userAddress, LocalDate birthday, String email, String phoneNumber, String imageURL, String username, String password_hash, String userRole, boolean active) {
        this.id = id;
        this.fullName = fullName;
        this.userAddress = userAddress;
        this.birthday = birthday;
        this.email = email;
        this.phoneNumber = phoneNumber;
        this.imageURL = imageURL;
        this.username = username;
        this.password_hash = password_hash;
        this.userRole = userRole;
        this.active = active;
    }
    public String getResetToken() {
        return resetToken;
    }

    public void setResetToken(String resetToken) {
        this.resetToken = resetToken;
    }

    public LocalDateTime getResetExpired() {
        return resetExpired;
    }

    public void setResetExpired(LocalDateTime resetExpired) {
        this.resetExpired = resetExpired;
    }
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getUserAddress() {
        return userAddress;
    }

    public void setUserAddress(String userAddress) {
        this.userAddress = userAddress;
    }

    public LocalDate getBirthday() {
        return birthday;
    }

    public void setBirthday(LocalDate birthday) {
        this.birthday = birthday;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getImageURL() {
        return imageURL;
    }

    public void setImageURL(String imageURL) {
        this.imageURL = imageURL;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword_hash() {
        return password_hash;
    }

    public boolean isActive() {
        return active;
    }

    public void setActive(boolean active) {
        this.active = active;
    }

    public void setPassword_hash(String password_hash) {
        this.password_hash = password_hash;
    }

    public String getUserRole() {
        return userRole;
    }

    public void setUserRole(String userRole) {
        this.userRole = userRole;
    }

    @Override
    public String toString() {
        return "Users{" +
                "id=" + id +
                ", fullName='" + fullName + '\'' +
                ", userAddress='" + userAddress + '\'' +
                ", birthday='" + birthday + '\'' +
                ", email='" + email + '\'' +
                ", phoneNumber='" + phoneNumber + '\'' +
                ", imageURL='" + imageURL + '\'' +
                ", username='" + username + '\'' +
                ", password_hash='" + password_hash + '\'' +
                ", userRole='" + userRole + '\'' +
                '}';
    }
}
