package com.poly.Entity;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity
@Table(name = "OrderDetails")
public class OrderDetails {

    @Id
    @Column(name = "Id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id; // Đổi từ Integer thành Long để phù hợp với BIGINT

    @ManyToOne(cascade = CascadeType.MERGE)
    @JoinColumn(name = "OrderId", referencedColumnName = "Id")
    @JsonIgnoreProperties(value = {"applications", "hibernateLazyInitializer"})
    private Order order; // Thay đổi tên thành Order để phù hợp với thực tế

    @ManyToOne(cascade = CascadeType.MERGE)
    @JoinColumn(name = "ProductId", referencedColumnName = "Id")
    @JsonIgnoreProperties(value = {"applications", "hibernateLazyInitializer"})
    private Product product;

    @Column(name = "Price", nullable = false)
    private Float price; // Đổi từ Double thành Float để phù hợp với FLOAT trong bảng

    @Column(name = "Quantity", nullable = false)
    private Integer quantity;

    // Getters and setters

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Order getOrder() {
        return order;
    }

    public void setOrder(Order order) {
        this.order = order;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public Float getPrice() {
        return price;
    }

    public void setPrice(Float price) {
        this.price = price;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }
}
