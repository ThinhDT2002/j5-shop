package com.assignment.service.account;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.assignment.model.Account;
import com.assignment.service.database.AccountRepository;
import com.assignment.service.session.SessionService;
@Service
public class LoginAccount{
	@Autowired
	AccountRepository accountRepository;
	@Autowired
	SessionService sessionService;
	public String login(String username, String password) {
		Account account = accountRepository.findAccountByUsername(username);
		if(account == null) {
			return "Tài khoản hoặc mật khẩu không chính xác";
		} else {
			if(account.getPassword().equals(password)) {
				if(account.getActivated()) {
					sessionService.setAttribute("user", account);
					return "Đăng nhập thành công";
				} else {
					return "Tài khoản chưa được kích hoạt";
				}
			} else {
				return "Tài khoản hoặc mật khẩu không chính xác";
			}
		}
	}
}
