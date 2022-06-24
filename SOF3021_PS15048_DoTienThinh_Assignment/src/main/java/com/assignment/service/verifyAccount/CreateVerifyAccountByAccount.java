package com.assignment.service.verifyAccount;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.assignment.model.Account;
import com.assignment.model.VerifyAccount;
import com.assignment.service.database.VerifyAccountRepository;
import com.assignment.util.password.PasswordUtil;

@Service
public class CreateVerifyAccountByAccount {
	@Autowired
	VerifyAccountRepository verifyAccountRepository;
	@Autowired
	PasswordUtil passwordUtil;
	public VerifyAccount createVerifyAccount(Account registerAccount) {
		String verifyCode = registerAccount.getUsername() + String.valueOf(passwordUtil.generatePassword(8));
		VerifyAccount verifyAccount = new VerifyAccount(registerAccount.getUsername(), registerAccount, verifyCode);
		verifyAccountRepository.save(verifyAccount);
		return verifyAccount;
	}
}
