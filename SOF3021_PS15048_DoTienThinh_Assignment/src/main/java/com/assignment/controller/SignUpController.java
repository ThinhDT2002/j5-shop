package com.assignment.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.assignment.model.Account;
import com.assignment.service.account.SignUpAccount;
import com.assignment.service.account.VerifySignUpAccount;

@Controller
public class SignUpController {
	@Autowired
	SignUpAccount signUpAccount;
	@Autowired
	VerifySignUpAccount verifySignUpAccount;
	@RequestMapping("/account/doSignup")
	public String doSignUp(Model model,@Valid Account accountRegister,
			Errors errors) {
		if(errors.hasErrors()) {
			return "account/login";
		}
		else {
			String message = signUpAccount.signUp(accountRegister);
			model.addAttribute("message", message);
			return "account/login";
		}
	}
	@RequestMapping("/account/verify")
	public String verifyAccount(Model model,@RequestParam("code") String verifyCode) {
		String message = verifySignUpAccount.verifyAccount(verifyCode);
		if(message.equals("Thành công")) {
			return "/account/verifySuccess";
		} else {
			return "/account/verifyError";
		}
	}
}
