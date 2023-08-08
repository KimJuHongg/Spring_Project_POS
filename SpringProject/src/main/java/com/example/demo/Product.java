package com.example.demo;
import java.time.LocalDateTime;

public class Product {
private String code;
private String productname;
private long quantity;
private long price;
private LocalDateTime date;

public Product(String code, String productname, long quantity, long price, LocalDateTime date) {
    this.code = code;
    this.productname = productname;
    this.quantity = quantity;
    this.price = price;
    this.date = date;
}

public String getCode() {
	return code;
}

public void setCode(String code) {
	this.code = code;
}

public String getProductname() {
	return productname;
}

public void setProductname(String productname) {
	this.productname = productname;
}

public long getQuantity() {
	return quantity;
}

public void setQuantity(long quantity) {
	this.quantity = quantity;
}

public long getPrice() {
	return price;
}

public void setPrice(long price) {
	this.price = price;
}

public LocalDateTime getDate() {
	return date;
}

public void setDate(LocalDateTime date) {
	this.date = date;
}


}