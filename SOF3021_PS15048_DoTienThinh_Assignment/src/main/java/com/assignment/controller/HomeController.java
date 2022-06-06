package com.assignment.controller;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.assignment.model.Account;
import com.assignment.model.Product;
import com.assignment.service.ProductRepository;
import com.assignment.service.SessionService;
import com.assignment.service.ShoppingCartServiceImplement;

@Controller
public class HomeController {
	@Autowired
	ProductRepository productRepository;
	@Autowired
	ShoppingCartServiceImplement shoppingCart;
	@Autowired
	SessionService sessionService;
	
	@ModelAttribute("shoppingCart")
	public ShoppingCartServiceImplement getShoppingCart() {
		return shoppingCart;
	}
	
	@RequestMapping("/home/index")
	public String getIndex(Model model, @RequestParam("p") Optional<Integer> p,
			@RequestParam("category") Optional<String> category) {
		String ctegory = category.orElse("%");
		model.addAttribute("category",ctegory);
		Pageable pageable = PageRequest.of(p.orElse(0), 8);
		Page<Product> products = productRepository.findAllByCategoryIdLike(ctegory,pageable);
		model.addAttribute("products", products);
//		Account account = sessionService.getAttribute("user");
//		System.out.println(account.getFullname());
		return "home/index";
	}
}
