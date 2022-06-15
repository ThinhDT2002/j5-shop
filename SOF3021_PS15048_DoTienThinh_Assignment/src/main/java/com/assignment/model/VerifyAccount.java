package com.assignment.model;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.MapsId;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "Verify_Accounts")
public class VerifyAccount {
	@Id
	@Column(unique = true, name="Username")
	private String username;
	@OneToOne(cascade = CascadeType.ALL)
	@MapsId
	@JoinColumn(name = "Username")
	private Account account;
	@Column(name = "Verify_Code")
	private String verifyCode;
	public VerifyAccount() {
		super();
	}
	public VerifyAccount(String username, Account account, String verifyCode) {
		super();
		this.username = username;
		this.account = account;
		this.verifyCode = verifyCode;
	}
	public VerifyAccount(String username, String verifyCode) {
		super();
		this.username = username;
		this.verifyCode = verifyCode;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public Account getAccount() {
		return account;
	}
	public void setAccount(Account account) {
		this.account = account;
	}
	public String getVerifyCode() {
		return verifyCode;
	}
	public void setVerifyCode(String verifyCode) {
		this.verifyCode = verifyCode;
	}
	
}
