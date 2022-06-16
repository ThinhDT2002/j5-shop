package com.assignment.model;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedStoredProcedureQuery;
import javax.persistence.OneToMany;
import javax.persistence.ParameterMode;
import javax.persistence.StoredProcedureParameter;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@NamedStoredProcedureQuery(name = "CreateOrder", procedureName = "CreateOrder", parameters = {
	@StoredProcedureParameter(mode = ParameterMode.IN, name = "Username", type = String.class),
	@StoredProcedureParameter(mode = ParameterMode.IN, name = "Create_Date", type = Date.class),
	@StoredProcedureParameter(mode = ParameterMode.IN, name = "Address", type = String.class),
	@StoredProcedureParameter(mode = ParameterMode.IN, name = "Phonenumber", type = String.class),
	@StoredProcedureParameter(mode = ParameterMode.IN, name = "Order_Note", type = String.class),
	@StoredProcedureParameter(mode = ParameterMode.IN, name = "Order_Status", type = Integer.class),
	@StoredProcedureParameter(mode = ParameterMode.IN, name = "Price", type = Double.class),
	@StoredProcedureParameter(mode = ParameterMode.OUT, name = "Output", type = Integer.class)
})
@Table(name = "Orders")
public class Orders implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "OrderId")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	@Column(name = "CreateDate")
	@Temporal(TemporalType.DATE)
	private Date createDate = new Date();
	@Column(name = "Address")
	private String address;
	@Column(name = "Phonenumber")
	private String phonenumber;
	@Column(name = "OrderNote")
	private String note;
	@Column(name = "OrderStatus")
	private Integer status;
	//status: 1-Chờ xác nhận 2-Giao hàng 3-Hoàn thành
	@Column(name = "Price")
	private Double price;
	@ManyToOne
	@JoinColumn(name = "Username")
	private Account account;
	@OneToMany(mappedBy = "orders")
	private List<OrdersDetail> ordersDetails;
	
	public Orders() {
		super();
	}

	public Orders(Integer id, Date createDate, String address, String phonenumber, String note, Integer status,
			Double price, Account account, List<OrdersDetail> ordersDetails) {
		super();
		this.id = id;
		this.createDate = createDate;
		this.address = address;
		this.phonenumber = phonenumber;
		this.note = note;
		this.status = status;
		this.price = price;
		this.account = account;
		this.ordersDetails = ordersDetails;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
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

	public String getPhonenumber() {
		return phonenumber;
	}

	public void setPhonenumber(String phonenumber) {
		this.phonenumber = phonenumber;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public Account getAccount() {
		return account;
	}

	public void setAccount(Account account) {
		this.account = account;
	}

	public List<OrdersDetail> getOrdersDetails() {
		return ordersDetails;
	}

	public void setOrdersDetails(List<OrdersDetail> ordersDetails) {
		this.ordersDetails = ordersDetails;
	}

	

}
