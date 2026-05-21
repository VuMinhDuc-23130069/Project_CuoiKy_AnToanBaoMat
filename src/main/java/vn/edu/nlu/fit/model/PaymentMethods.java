package vn.edu.nlu.fit.model;

public class PaymentMethods {
    private int id;
    private String methodName;
    private int isActived;
    private String iconUrl;

    public PaymentMethods() {
    }


    public PaymentMethods(int id, String methodName, int isActived, String iconUrl) {
        this.id = id;
        this.methodName = methodName;
        this.isActived = isActived;
        this.iconUrl = iconUrl;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getMethodName() {
        return methodName;
    }

    public void setMethodName(String methodName) {
        this.methodName = methodName;
    }

    public int getIsActived() {
        return isActived;
    }

    public void setIsActived(int isActived) {
        this.isActived = isActived;
    }


    public String getIconUrl() {
        return iconUrl;
    }

    public void setIconUrl(String iconUrl) {
        this.iconUrl = iconUrl;
    }

    @Override
    public String toString() {
        return "PaymentMethods{" +
                "id=" + id +
                ", methodName='" + methodName + '\'' +
                ", isActived=" + isActived + '\'' +
                ", iconURL=" + iconUrl +
                '}';
    }
}