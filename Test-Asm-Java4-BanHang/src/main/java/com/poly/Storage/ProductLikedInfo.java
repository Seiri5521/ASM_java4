package com.poly.Storage;

import java.util.Date;

public class ProductLikedInfo {
    // Các thuộc tính của sản phẩm quần áo

    private Integer id;
    private String name;
    private String image;
    private Double price;
    private Date createDate;
    private Boolean available;
    private String categoryId;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date object) {
        this.createDate = object;
    }

    public Boolean getAvailable() {
        return available;
    }

    public void setAvailable(Boolean object) {
        this.available = object;
    }

    public String getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(String categoryId) {
        this.categoryId = categoryId;
    }
}
