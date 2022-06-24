package com.assignment.service.account;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.assignment.model.Account;
import com.assignment.service.database.AccountRepository;
import com.assignment.service.session.SessionService;
import com.assignment.util.mail.MailUtil;
import com.assignment.util.password.PasswordUtil;

@Service
public class ForgotPassword {
	@Autowired
	AccountRepository accountRepository;
	@Autowired 
	SessionService sessionService;
	@Autowired
	MailUtil mailUtil;
	@Autowired
	PasswordUtil passwordUtil;
	public String retrievePassword(String username) {
		try {
			Account account = accountRepository.findAccountByUsername(username);
			sessionService.setAttribute("currentUserForgotPassword", username);
			String subject = "Quên mật khẩu";
			String verifyCode = String.valueOf(passwordUtil.generatePassword(6));
			sessionService.setAttribute("forgotPasswordVerifyCode", verifyCode);
			String mailMessage = "Mã xác nhận của bạn là: \r\n" + verifyCode;
			mailUtil.sendVerifyCode(account.getEmail(), verifyCode, subject, mailMessage);
			return "Thành công";
		} catch(Exception ex) {
			ex.printStackTrace();
			return "Thất bại";
		}	
	}
	
	public String submitNewPassword(String verifyCode,String password, String confirmPassword) {
		String forgotPasswordVerifyCode = sessionService.getAttribute("forgotPasswordVerifyCode");
		if(!verifyCode.endsWith(forgotPasswordVerifyCode)) {
			return "Mã xác nhận không đúng!";
		} else {
			if(!password.equals(confirmPassword)) {
				return "Xác nhận mật khẩu không hợp lệ";
			} else {
				String currentUserForgotPassword = sessionService.getAttribute("currentUserForgotPassword");
				Account account = accountRepository.findAccountByUsername(currentUserForgotPassword);
				account.setPassword(password);
				accountRepository.save(account);
				sessionService.removeAttribute("forgotPasswordVerifyCode");
				sessionService.removeAttribute("currentUserForgotPassword");
				return "Đặt lại mật khẩu thành công";
			}
		}
	}
}
