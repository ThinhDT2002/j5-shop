package com.assignment.model;

import java.io.Serializable;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

@Entity
@Table(name = "Accounts")
public class Account implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "Username")
	private String username;
	@Column(name = "Password")
	private String password;
	@Column(name = "Fullname")
	private String fullname;
	@Column(name = "Phonenumber")
	private String phonenumber;
	@Column(name = "Email")
	private String email;
	@Column(name = "Photo")
	private String photo;
	@Column(name = "Admin")
	private Boolean admin;
	@Column(name = "Activated")
	private Boolean activated = false;
	@OneToMany(mappedBy = "account")
	private List<Orders> orders;
	@OneToOne(mappedBy = "account", cascade = CascadeType.ALL)
	@PrimaryKeyJoinColumn
	private VerifyAccount verifyAccount;

	public VerifyAccount getVerifyAccount() {
		return verifyAccount;
	}

	public void setVerifyAccount(VerifyAccount verifyAccount) {
		this.verifyAccount = verifyAccount;
	}

	public Account(String username, String password, String fullname, String phonenumber, String email, String photo,
			Boolean admin, Boolean activated, List<Orders> orders, VerifyAccount verifyAccount) {
		super();
		this.username = username;
		this.password = password;
		this.fullname = fullname;
		this.phonenumber = phonenumber;
		this.email = email;
		this.photo = photo;
		this.admin = admin;
		this.activated = activated;
		this.orders = orders;
		this.verifyAccount = verifyAccount;
	}

	public Account() {
		super();
	}

	public Account(String username, String password, String fullname, String phonenumber, String email, String photo,
			Boolean admin,Boolean activated, List<Orders> orders) {
		super();
		this.username = username;
		this.password = password;
		this.fullname = fullname;
		this.phonenumber = phonenumber;
		this.email = email;
		this.photo = photo;
		this.admin = admin;
		this.activated = activated;
		this.orders = orders;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getFullname() {
		return fullname;
	}

	public void setFullname(String fullname) {
		this.fullname = fullname;
	}

	public String getPhonenumber() {
		return phonenumber;
	}

	public void setPhonenumber(String phonenumber) {
		this.phonenumber = phonenumber;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public Boolean getAdmin() {
		return admin;
	}

	public void setAdmin(Boolean admin) {
		this.admin = admin;
	}
	
	

	public Boolean getActivated() {
		return activated;
	}

	public void setActivated(Boolean activated) {
		this.activated = activated;
	}

	public List<Orders> getOrders() {
		return orders;
	}

	public void setOrders(List<Orders> orders) {
		this.orders = orders;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

}
