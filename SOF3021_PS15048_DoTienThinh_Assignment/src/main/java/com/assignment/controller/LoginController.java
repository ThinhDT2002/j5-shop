package com.assignment.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.assignment.model.Account;
import com.assignment.service.account.LoginAccount;
import com.assignment.service.session.SessionService;

@Controller
public class LoginController {
	@Autowired
	SessionService sessionService;
	@Autowired
	LoginAccount loginAccount;
	
	@RequestMapping("/account/login")
	public String getLogin(Account account) {
		account = sessionService.getAttribute("user");
		if(account != null) {
			return "redirect:/home/index";
		} else {
			account = new Account();
		}
		return "account/login";
	}
	
	@RequestMapping("/account/doLogin")
	public String doLogin(Model model,@RequestParam("login-username") String username,
			@RequestParam("login-password") String password,
			@ModelAttribute("account") Account accountRegister) {
		accountRegister = new Account();
		String message = loginAccount.login(username, password);
		switch(message) {
			case "Tài khoản hoặc mật khẩu không chính xác":
				model.addAttribute("message", message);
				return "account/login";
			case "Đăng nhập thành công":
				return "redirect:/home/index";
			case "Tài khoản chưa được kích hoạt":
				model.addAttribute("message", message);
				return "account/login";
			default:
				return "account/login";
		}
	}
	
	@RequestMapping("/account/logout")
	public String logout() {
		sessionService.removeAttribute("user");
		return "redirect:/account/login";
	}
}
