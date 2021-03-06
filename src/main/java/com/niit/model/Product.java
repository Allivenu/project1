package com.niit.model;


import java.io.Serializable;
import java.util.Date;

import javax.persistence.Basic;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.Min;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.web.multipart.MultipartFile;

@Entity
@Table(name = "Product")
public class Product implements Serializable {

	@Id
	@GeneratedValue
	private int id;

	@NotEmpty(message = "product name is mandatory")
	private String name;
	@NotEmpty(message = "description is mandatory")
	private String description;
	@Min(value = 3)
	private double price;
	private int quantity;
	
	private Date dtg;
	@ManyToOne
	@JoinColumn(name = "cid")
	private Category category;
	@Transient
	  private MultipartFile image;
	
	@Lob
	@Basic(fetch=FetchType.LAZY)
	private byte[] picture;

	public byte[] getPicture() {
	return picture;
}
public void setPicture(byte[] picture) {
	this.picture = picture;
}
	public MultipartFile getImage() {
		return image;
	}
	public void setImage(MultipartFile image) {
		this.image = image;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public Date getDtg() {
		return dtg;
	}

	public void setDtg(Date dtg) {
		this.dtg = dtg;
	}
}
