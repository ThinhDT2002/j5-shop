package com.assignment.service.account;

import javax.mail.MessagingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.assignment.model.Account;
import com.assignment.model.VerifyAccount;
import com.assignment.service.database.AccountRepository;
import com.assignment.service.database.VerifyAccountRepository;
import com.assignment.service.verifyAccount.CreateVerifyAccountByAccount;
import com.assignment.util.mail.MailUtil;

@Service
public class SignUpAccount {
	@Autowired
	AccountRepository accountRepository;
	@Autowired
	VerifyAccountRepository verifyAccountRepository;
	@Autowired
	CreateVerifyAccountByAccount createVerifyAccount;
	@Autowired
	MailUtil mailUtil;
	public String signUp(Account account) {
		String accountStatus = checkAccountStatus(account.getUsername());
		switch (accountStatus) {
		case "Tồn tại":
			return "Tài khoản đã tồn tại!";
		case "Đã tồn tại nhưng chưa nhận":
			VerifyAccount verifyAccountExist = verifyAccountRepository.findVerifyAccountByUsername(account.getUsername());
			verifyAccountRepository.delete(verifyAccountExist);
			Account registerAccount = createRegisterAccount(account);
			VerifyAccount verifyAccount = createVerifyAccount.createVerifyAccount(registerAccount);
			try {
				String subject = "Xác nhận tài khoản";
				String verifyURL = "http://localhost:8080/account/verify?code=" + verifyAccount.getVerifyCode();
				String mailMessage = "Click vào đây để kích hoạt tài khoản của bạn: \r\n"+ verifyURL;
				mailUtil.sendVerifyCode(registerAccount.getEmail(), verifyAccount.getVerifyCode(), subject, mailMessage);
			} catch (MessagingException e) {
				e.printStackTrace();
				return "Đăng ký thất bại";
			}
			return "Đăng ký thành công, truy cập vào email để xác nhận tài khoản";
		case "Chưa tồn tại":
			Account registerAccount2 = createRegisterAccount(account);
			VerifyAccount verifyAccount2 = createVerifyAccount.createVerifyAccount(registerAccount2);
			try {
				String subject = "Xác nhận tài khoản";
				String verifyURL = "http://localhost:8080/account/verify?code=" + verifyAccount2.getVerifyCode();
				String mailMessage = "Click vào đây để kích hoạt tài khoản của bạn: \r\n"+ verifyURL;
				mailUtil.sendVerifyCode(registerAccount2.getEmail(), verifyAccount2.getVerifyCode(), subject, mailMessage);
			} catch (MessagingException e) {
				e.printStackTrace();
				return "Đăng ký thất bại";
			}
			return "Đăng ký thành công, truy cập vào email để xác nhận tài khoản";
		default:
			throw new IllegalArgumentException("Unexpected value: " + accountStatus);
		}
	}
	
	private String checkAccountStatus(String username) {
		Account account = accountRepository.findAccountByUsername(username);
		if(account != null) {
			if(account.getActivated()) {
				return "Tồn tại";
			} else {
				return "Đã tồn tại nhưng chưa nhận";
			}
		} else {
			return "Chưa tồn tại";
		}
	}
	
	private Account createRegisterAccount(Account account) {
		Account registerAccount = new Account();
		registerAccount.setUsername(account.getUsername());
		registerAccount.setPassword(account.getPassword());
		registerAccount.setEmail(account.getEmail());
		registerAccount.setAdmin(false);
		registerAccount.setActivated(false);
		accountRepository.save(registerAccount);
		return registerAccount;
	}
}
