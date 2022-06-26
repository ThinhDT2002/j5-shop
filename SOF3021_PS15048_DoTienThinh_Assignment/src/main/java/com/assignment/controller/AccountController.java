package com.assignment.controller;



import javax.servlet.ServletContext;
import javax.validation.Valid;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.assignment.model.Account;
import com.assignment.service.account.SignUpAccount;
import com.assignment.service.account.UpdateAccount;
import com.assignment.service.account.VerifySignUpAccount;
import com.assignment.service.account.ChangePassword;
import com.assignment.service.account.ForgotPassword;
import com.assignment.service.account.LoginAccount;
import com.assignment.service.database.AccountRepository;
import com.assignment.service.database.VerifyAccountRepository;
import com.assignment.service.mail.MailServiceImplement;
import com.assignment.service.session.SessionService;
import com.assignment.service.shoppingCart.ShoppingCartServiceImplement;
import com.assignment.util.password.PasswordUtil;


@Controller
public class AccountController {
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
	@Autowired
	ServletContext context;
	@Autowired
	LoginAccount loginAccount;
	@Autowired
	SignUpAccount signUpAccount;
	@Autowired
	VerifySignUpAccount verifySignUpAccount;
	@Autowired
	ForgotPassword forgotPassword;
	@Autowired
	ChangePassword changePassword;
	@Autowired
	UpdateAccount updateAccount;
	
	@ModelAttribute("shoppingCart")
	public ShoppingCartServiceImplement getShoppingCart() {
		return shoppingCart;
	}
	
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
	
	@RequestMapping("/account/logout")
	public String logout() {
		sessionService.removeAttribute("user");
		return "redirect:/account/login";
	}
	
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
	
	@GetMapping("/account/changePassword")
	public String getChangePasswordView() {
		return "account/changePassword";
	}
	
	@PostMapping("/account/changePassword")
	public String doChangePassword(Model model, @RequestParam("oldPassword") String oldPassword,
			@RequestParam("newPassword") String newPassword,
			@RequestParam("confirmPassword") String confirmPassword) {
		if(newPassword.length() < 5 || newPassword.length() > 30) {
			model.addAttribute("changePasswordMessage", "Mật khẩu mới phải từ 5 - 30 kí tự");
			return "account/changePassword";
		}
		String message = changePassword.changePassword(oldPassword, newPassword, confirmPassword);
		model.addAttribute("changePasswordMessage",message);
		return "account/changePassword";
	}
		
	@GetMapping("/account/profilecard")
	public String getProfileView(@ModelAttribute("account") Account account) {
		Account curUser = sessionService.getAttribute("user");
		account.setUsername(curUser.getUsername());
		account.setPassword(curUser.getPassword());
		account.setEmail(curUser.getEmail());
		account.setFullname(curUser.getFullname());
		account.setPhonenumber(curUser.getPhonenumber());
		return "account/profilecard";
	}
	
	@PostMapping("/account/profilecard")
	public String updateAccount(@ModelAttribute("account") Account account,
			@RequestParam("avatar") MultipartFile multipartFile, Model model) {
		String message = updateAccount.updateProfile(account, multipartFile);
		model.addAttribute("updateAccountMessage",message);
		return "account/profilecard";
	}
	
	@RequestMapping("/account/accessDeny")
	public String getAccessDenyPage(){
		return "account/accessDeny";
	}
}
