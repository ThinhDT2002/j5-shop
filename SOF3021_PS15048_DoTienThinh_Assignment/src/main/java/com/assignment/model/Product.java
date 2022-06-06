package com.assignment.model;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
@Entity
@Table(name = "Products")
public class Product implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Id
	@Column(name = "ProductId")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	@Column(name = "Name")
	private String name;
	@Column(name = "Image1")
	private String image1;
	@Column(name = "Image2")
	private String image2;
	@Column(name = "Image3")
	private String image3;
	@Column(name = "Image4")
	private String image4;
	@Column(name = "Color")
	private String color;
	@Column(name = "Price")
	private Double price;
	@Column(name = "Quantity")
	private Integer quantity;
	@Column(name = "Manufactor")
	private String manufactor;
	@Column(name = "Description")
	private String description;
	@Column(name = "Discount")
	private Integer discount;
	@ManyToOne
	@JoinColumn(name = "CategoryId")
	private Category category;
	@OneToMany(mappedBy = "product")
	private List<OrdersDetail> ordersDetails;
	
	public Product() {
		super();
	}
	
	public Product(Integer id, String name, String image1, String image2, String image3, String image4, String color,
			Double price, Integer quantity, String manufactor, String description, Integer discount,
			Category category, List<OrdersDetail> ordersDetails) {
		super();
		this.id = id;
		this.name = name;
		this.image1 = image1;
		this.image2 = image2;
		this.image3 = image3;
		this.image4 = image4;
		this.color = color;
		this.price = price;
		this.quantity = quantity;
		this.manufactor = manufactor;
		this.description = description;
		this.discount = discount;
		this.category = category;
		this.ordersDetails = ordersDetails;
	}

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

	public String getImage1() {
		return image1;
	}

	public void setImage1(String image1) {
		this.image1 = image1;
	}

	public String getImage2() {
		return image2;
	}

	public void setImage2(String image2) {
		this.image2 = image2;
	}

	public String getImage3() {
		return image3;
	}

	public void setImage3(String image3) {
		this.image3 = image3;
	}

	public String getImage4() {
		return image4;
	}

	public void setImage4(String image4) {
		this.image4 = image4;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	public String getManufactor() {
		return manufactor;
	}

	public void setManufactor(String manufactor) {
		this.manufactor = manufactor;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Integer getDiscount() {
		return discount;
	}

	public void setDiscount(Integer discount) {
		this.discount = discount;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public List<OrdersDetail> getOrdersDetails() {
		return ordersDetails;
	}

	public void setOrdersDetails(List<OrdersDetail> ordersDetails) {
		this.ordersDetails = ordersDetails;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
}
