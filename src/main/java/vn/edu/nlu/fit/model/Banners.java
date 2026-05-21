package vn.edu.nlu.fit.model;

public class Banners {
    private int id;
    private String imageURL;
    private int bannerStatus;

    public Banners() {
    }

    public Banners(int id, String imageURL, int bannerStatus) {
        this.id = id;
        this.imageURL = imageURL;
        this.bannerStatus = bannerStatus;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getImageURL() {
        return imageURL;
    }

    public void setImageURL(String imageURL) {
        this.imageURL = imageURL;
    }

    public int getBannerStatus() {
        return bannerStatus;
    }

    public void setBannerStatus(int bannerStatus) {
        this.bannerStatus = bannerStatus;
    }

    @Override
    public String toString() {
        return "Banners{" +
                "id=" + id +
                ", imageURL='" + imageURL + '\'' +
                ", bannerStatus=" + bannerStatus +
                '}';
    }
}
