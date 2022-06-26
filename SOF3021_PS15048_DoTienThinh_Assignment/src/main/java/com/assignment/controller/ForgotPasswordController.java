package com.assignment.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.assignment.service.account.ForgotPassword;

@Controller
public class ForgotPasswordController {
	@Autowired
	ForgotPassword forgotPassword;
	@RequestMapping("/account/forgot-password")
	public String getForgotPassword() {
		return "account/forgot-password";
	}
	
	@RequestMapping("/account/retrieve-password")
	public String retrievePasword(Model model,@RequestParam("username") String username){
		String message = forgotPassword.retrievePassword(username);
		if(message.equals("Thành công")) {
			model.addAttribute("message","Mã xác nhận đã được gửi đi, vui lòng kiểm tra email của bạn!");
			return "account/retrieve-password";
		} else {
			model.addAttribute("message","Có lỗi xảy ra");
			return "account/forgot-password";
		}
	}
	
	@RequestMapping("/account/submit-retrieve-password")
	public String submitNewPassword(Model model, 
			@RequestParam("verifyCode") String verifyCode,	
			@RequestParam("confirm-password") String confirmPassword,
			@RequestParam("password") String password) {
		if(password.length() < 5 || password.length() > 30) {
			model.addAttribute("errorPassword", "Mật khẩu phải từ 5 - 30 kí tự");
			return "account/retrieve-password";
		} 
		else {
			String message = forgotPassword.submitNewPassword(verifyCode, password, confirmPassword);
			model.addAttribute("message", message);
			return "account/retrieve-password";
		}
	}
}
