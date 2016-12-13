package com.spring.model;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table(name="customer")
public class Customer implements Serializable {
@Id
@GeneratedValue(strategy=GenerationType.AUTO)
private int customerId;
@NotEmpty(message="customer name is not null")
private String customerName;
@NotEmpty(message="Email is not null")
private String customerEmail;
private String customerPhone;

@OneToOne(cascade=CascadeType.ALL)
@JoinColumn(name="userid")
private UserDetail userDetail;

@OneToOne(cascade=CascadeType.ALL)
@JoinColumn(name="billingaddressid")
private BillingAddress billingAddress;

@OneToOne(cascade=CascadeType.ALL)
@JoinColumn(name="shippingaddressid")
private ShippingAddress shippingAddress;

@OneToOne(cascade=CascadeType.ALL)
@JoinColumn(name="cartid")
private Cart cart;


public int getCustomerId() {
	return customerId;
}

public void setCustomerId(int customerId) {
	this.customerId = customerId;
}

public String getCustomerName() {
	return customerName;
}

public void setCustomerName(String customerName) {
	this.customerName = customerName;
}

public String getCustomerEmail() {
	return customerEmail;
}

public void setCustomerEmail(String customerEmail) {
	this.customerEmail = customerEmail;
}

public String getCustomerPhone() {
	return customerPhone;
}

public void setCustomerPhone(String customerPhone) {
	this.customerPhone = customerPhone;
}

public UserDetail getUserDetail() {
	return userDetail;
}

public void setUserDetail(UserDetail userDetail) {
	this.userDetail = userDetail;
}

public BillingAddress getBillingAddress() {
	return billingAddress;
}

public void setBillingAddress(BillingAddress billingAddress) {
	this.billingAddress = billingAddress;
}

public ShippingAddress getShippingAddress() {
	return shippingAddress;
}

public void setShippingAddress(ShippingAddress shippingAddress) {
	this.shippingAddress = shippingAddress;
}

public Cart getCart() {
	return cart;
}

public void setCart(Cart cart) {
	this.cart = cart;
}

}
