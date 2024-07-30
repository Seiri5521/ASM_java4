package com.poly.Entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import java.util.Collection;
import java.util.Date;

@Entity
@Table(name = "Orders")
public class Order {

    @Id
    @Column(name = "Id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "Username", nullable = false)
    private Accounts accounts;

    @Column(name = "CreateDate", nullable = false)
    private Date createDate;

    @Column(name = "Address", nullable = false, length = 500)
    private String address;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Accounts getUser() {
        return accounts;
    }

    public void setUser(Accounts accounts) {
        this.accounts = accounts;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

	public Collection<? extends Product> getProducts() {
		// TODO Auto-generated method stub
		return null;
	}



}
