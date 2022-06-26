package com.assignment.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.assignment.model.Account;
import com.assignment.service.account.UpdateAccount;
import com.assignment.service.account.ChangePassword;
import com.assignment.service.session.SessionService;
import com.assignment.service.shoppingCart.ShoppingCartServiceImplement;


@Controller
public class ModifyAccountController {
	@Autowired
	ShoppingCartServiceImplement shoppingCart;
	@Autowired
	ChangePassword changePassword;
	@Autowired
	SessionService sessionService;
	@Autowired
	UpdateAccount updateAccount;
	@ModelAttribute("shoppingCart")
	public ShoppingCartServiceImplement getShoppingCart() {
		return shoppingCart;
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
