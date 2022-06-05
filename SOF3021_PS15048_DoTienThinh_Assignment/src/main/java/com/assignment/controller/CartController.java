package com.assignment.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.assignment.model.Product;
import com.assignment.service.ProductRepository;
import com.assignment.service.ShoppingCartServiceImplement;

@Controller
public class CartController {
	@Autowired
	ProductRepository productRepository;
	@Autowired
	ShoppingCartServiceImplement shoppingCart;
	@Autowired
	HttpServletRequest req;
	
	private static double newPrice;
	
	@ModelAttribute("shoppingCart")
	public ShoppingCartServiceImplement getShoppingCart() {
		return shoppingCart;
	}
	
	@RequestMapping("/home/cart")
	public String getCart(Model model) {
//		model.addAttribute("shoppingCart", shoppingCart);
		model.addAttribute("newPrice", newPrice);
		return "home/cart";
	}

	@RequestMapping("/home/product-detail")
	public String getProductDetail(Model model,@RequestParam("id") Integer id) {
		Product product = productRepository.findProductById(id);
		newPrice = product.getPrice();
		if(product.getDiscount() > 0) {
			newPrice = product.getPrice() - (product.getPrice() * product.getDiscount() / 100);
		}
		model.addAttribute("newPrice", newPrice);
		model.addAttribute("product", product);
		return "home/product-detail";
	}
	
	@RequestMapping("/home/cart/add/{id}")
	public String addProductToCart(Model model,@PathVariable("id") Integer id) {
		int quantity = Integer.parseInt(req.getParameter("quantity"));
		shoppingCart.add(id, quantity);
		return "redirect:/home/cart";
	}
	
	@RequestMapping("/home/cart/remove/{id}")
	public String removeProductFromCart(@PathVariable("id") Integer id) {
		shoppingCart.remove(id);
		return "redirect:/home/cart";
	}
}
