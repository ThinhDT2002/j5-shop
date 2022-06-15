package com.assignment.controller;


import javax.mail.MessagingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.assignment.model.Account;
import com.assignment.model.MailInformation;
import com.assignment.model.VerifyAccount;
import com.assignment.service.database.AccountRepository;
import com.assignment.service.database.VerifyAccountRepository;
import com.assignment.service.mail.MailServiceImplement;
import com.assignment.service.session.SessionService;
import com.assignment.service.shoppingCart.ShoppingCartServiceImplement;
import com.assignment.util.password.PasswordUtil;


@Controller
public class LoginController {
	@Autowired
	AccountRepository accountRepository;
	@Autowired
	SessionService sessionService;
	@Autowired
	VerifyAccountRepository verifyAccountRepository;
	@Autowired
	MailServiceImplement mailServiceImplement;
	@Autowired
	PasswordUtil passwordUtil;
	@Autowired
	ShoppingCartServiceImplement shoppingCart;
	
	@ModelAttribute("shoppingCart")
	public ShoppingCartServiceImplement getShoppingCart() {
		return shoppingCart;
	}
	
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
				if(account.getActivated()) {
					sessionService.setAttribute("user", account);
					return "redirect:/home/index";
				} else {
					model.addAttribute("message", "Account is not verify!");
					return "account/login";
				}
			} else {
				model.addAttribute("message","Username or password is incorrect!");
				return "account/login";
			}
		}
	}
	
	@RequestMapping("/account/doSignup")
	public String doSignUp(Model model, @RequestParam("sign-up-username") String username,
			@RequestParam("sign-up-email") String email,
			@RequestParam("sign-up-password") String password) {
		try {
			Account account = new Account();
			account.setUsername(username);
			account.setPassword(password);
			account.setEmail(email);
			account.setAdmin(false);
			accountRepository.save(account);
			String verifyCode = username + String.valueOf(passwordUtil.generatePassword(8));
			VerifyAccount verifyAccount = new VerifyAccount(username, account, verifyCode);
			verifyAccountRepository.save(verifyAccount);
			MailInformation mailInformation = new MailInformation();
			mailInformation.setTo(email);
			String verifyURL = "http://localhost:8080/account/verify?code=" + verifyCode;
			String subject = "Xác nhận tài khoản";
			String mailMessage = "Click vào đây để kích hoạt tài khoản của bạn: \r\n"+ verifyURL;
			mailInformation.setSubject(subject);
			mailInformation.setBody(mailMessage);
			mailServiceImplement.send(mailInformation);
			model.addAttribute("message","Đăng ký thành công, truy cập vào email để xác nhận tài khoản");
		} catch (Exception ex) {
			ex.printStackTrace();
			model.addAttribute("message","Đăng ký thất bại!");
		}
		return "account/login";
	}
	@RequestMapping("/account/verify")
	public String verifyAccount(Model model,@RequestParam("code") String verifyCode) {
		try {
			VerifyAccount verifyAccount = verifyAccountRepository.findVerifyAccountByVerifyCode(verifyCode);
			Account account = accountRepository.findAccountByUsername(verifyAccount.getUsername());
			account.setActivated(true);
			accountRepository.save(account);
			return "/account/verifySuccess";
		} catch (Exception ex) {
			ex.printStackTrace();
			return "/account/verifyError";
		}
	}
	
	@RequestMapping("/account/logout")
	public String logout() {
		sessionService.removeAttribute("user");
		return "redirect:/account/login";
	}
	
	@RequestMapping("/account/forgot-password")
	public String getForgotPassword() {
		return "/account/forgot-password";
	}
	
	private String retrievePasswordVerifycode = "";
	private String currentUsernameForgotPassword = "";
	
	@RequestMapping("/account/retrieve-password")
	public String retrievePasword(Model model,@RequestParam("username") String username){
		try {
			Account account = accountRepository.findAccountByUsername(username);
			currentUsernameForgotPassword = username;
			MailInformation mailInformation = new MailInformation();
			mailInformation.setTo(account.getEmail());
			mailInformation.setSubject("Quên mật khẩu");
			String verifyCode = String.valueOf(passwordUtil.generatePassword(6));
			retrievePasswordVerifycode = verifyCode;
			mailInformation.setBody("Mã xác nhận của bạn là: \r\n" + verifyCode);
			mailServiceImplement.send(mailInformation);
			model.addAttribute("message","Mã xác nhận đã được gửi đi, vuii lòng kiểm tra email của bạn!");
			return "account/retrieve-password";
		} catch (MessagingException e) {
			e.printStackTrace();
			model.addAttribute("message","Có lỗi xảy ra");
			return "account/forgot-password";
		}
	}
	
	@RequestMapping("/account/submit-retrieve-password")
	public String submitNewPassword(Model model, @RequestParam("verifyCode") String verifyCode,
			@RequestParam("password") String password,
			@RequestParam("confirm-password") String confirmPassword) {
		if(!verifyCode.equals(retrievePasswordVerifycode)) {
			model.addAttribute("message","Verify code incorrect!");
			return "account/retrieve-password";
		} else {
			if(!password.equals(confirmPassword)) {
				model.addAttribute("message","Confirm password is incorrect!");
				return "account/retrieve-password";
			} else {
				Account account = accountRepository.findAccountByUsername(currentUsernameForgotPassword);
				account.setPassword(password);
				accountRepository.save(account);
				model.addAttribute("message","Recovery password success!");
				return "account/retrieve-password";
			}
		}
	}
	
	@GetMapping("/account/changePassword")
	public String getChangePasswordView() {
		return "account/changePassword";
	}
	
	@PostMapping("/account/changePassword")
	public String doChangePassword(Model model, @RequestParam("oldPassword") String oldPassword,
			@RequestParam("newPassword") String newPassword,
			@RequestParam("confirmPassword") String confirmPassword) {
		Account account = sessionService.getAttribute("user");
		if(account != null) {
			if(!account.getPassword().equals(oldPassword)) {
				model.addAttribute("changePasswordMessage","Password is incorrect!");
				return "account/changePassword";
			} 
			else if(!newPassword.equals(confirmPassword)){
				model.addAttribute("changePasswordMessage","Confirm password is incorrect!");
				return "account/changePassword";
			}
			else {
				account.setPassword(newPassword);
				accountRepository.save(account);
				model.addAttribute("changePasswordMessage", "Change password success!");
				return "account/changePassword";
			}
		} else {
			model.addAttribute("changePasswordMessage", "No account found!");
			return "account/changePassword";
		}
	}
	
	@GetMapping("/account/profilecard")
	public String getProfileView() {
		return "account/profilecard";
	}
}
