package com.assignment.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.assignment.model.Account;
import com.assignment.service.AccountRepository;
import com.assignment.service.SessionService;

@Controller
public class LoginController {
	@Autowired
	AccountRepository accountRepository;
	@Autowired
	SessionService sessionService;
	@RequestMapping("/account/login")
	public String getLogin() {
		return "account/login";
	}
	@RequestMapping("/account/doLogin")
	public String doLogin(Model model,@RequestParam("login-username") String username,
			@RequestParam("login-password") String password) {
		Account account = accountRepository.findAccountByUsername(username);
		if(account == null) {
			model.addAttribute("message","Username or password is incorrect!");
			return "account/login";
		} else {
			if(account.getPassword().equals(password)) {
				sessionService.setAttribute("user", account);
				return "redirect:/home/index";
			} else {
				model.addAttribute("message","Username or password is incorrect!");
				return "account/login";
			}
		}
	}
}
