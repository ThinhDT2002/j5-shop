package com.assignment.service.account;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.assignment.model.Account;
import com.assignment.service.database.AccountRepository;
import com.assignment.service.session.SessionService;

@Service
public class ChangePassword {
	@Autowired
	SessionService sessionService;
	@Autowired
	AccountRepository accountRepository;
	public String changePassword(String oldPassword, String newPassword, String confirmPassword) {
		Account account = sessionService.getAttribute("user");
		if(account != null) {
			if(!account.getPassword().equals(oldPassword)) {
				return "Mật khẩu cũ không hợp lệ";
			} 
			else if(!newPassword.equals(confirmPassword)) {
				return "Xác nhận mật khẩu không hợp lệ";
			}
			else {
				account.setPassword(newPassword);
				accountRepository.save(account);
				return "Đổi mật khẩu thành công";
			}
		} else {
			return "Không tìm thấy tài khoản";
		}
	}
}
