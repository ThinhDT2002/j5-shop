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
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
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
	@Column(name = "OrderNote")
	private String note;
	@ManyToOne
	@JoinColumn(name = "Username")
	private Account account;
	@OneToMany(mappedBy = "orders")
	private List<OrdersDetail> ordersDetails;

	public Orders() {
		super();
	}

	public Orders(Integer id, Date createDate, String address, String note, Account account,
			List<OrdersDetail> ordersDetails) {
		super();
		this.id = id;
		this.createDate = createDate;
		this.address = address;
		this.note = note;
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

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
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

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

}
