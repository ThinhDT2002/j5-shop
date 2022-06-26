package com.assignment.controller;

import java.util.List;
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
import com.assignment.model.Category;
import com.assignment.model.Orders;
import com.assignment.model.OrdersDetail;
import com.assignment.model.Product;
import com.assignment.service.database.AccountRepository;
import com.assignment.service.database.CategoryRepository;
import com.assignment.service.database.OrdersDetailRepository;
import com.assignment.service.database.OrdersRepository;
import com.assignment.service.database.ProductRepository;
import com.assignment.service.session.SessionService;
import com.assignment.service.shoppingCart.ShoppingCartServiceImplement;

@Controller
public class HomeController {
	@Autowired
	ShoppingCartServiceImplement shoppingCart;
	@Autowired
	ProductRepository productRepository;
	@Autowired
	SessionService sessionService;
	@Autowired
	CategoryRepository categoryRepository;
	@Autowired
	AccountRepository accountRepository;
	@Autowired
	OrdersRepository ordersRepository;
	@Autowired
	OrdersDetailRepository ordersDetailRepository;
	@ModelAttribute("shoppingCart")
	public ShoppingCartServiceImplement getShoppingCart() {
		return shoppingCart;
	}
	
	@RequestMapping("/home/index")
	public String getHomePage(Model model, @RequestParam("p") Optional<Integer> pageNumber,
			@RequestParam("category") Optional<String> category) {
		model.addAttribute("category",category.orElse("%"));
		Pageable pageable = PageRequest.of(pageNumber.orElse(0), 8);
		Page<Product> products = productRepository.findAllByCategoryIdLike(category.orElse("%"),pageable);
		model.addAttribute("products", products);
		return "home/index";
	}
	
	@ModelAttribute("user")
	public Account getCurrentUser() {
		Account account = sessionService.getAttribute("user");
		return account;
	}
	
	@RequestMapping("/home/admin")
	public String getAccount(Model model) {
		Product product = new Product();
		model.addAttribute("product", product);
		return "home/admin";
	}
	
	@ModelAttribute("adminProducts")
	public Page<Product> getAdminProductView(@RequestParam("p") Optional<Integer> p) {
		Pageable pageable = PageRequest.of(p.orElse(0), 10);
		Page<Product> products = productRepository.findAll(pageable);
		return products;
	}
	
	@ModelAttribute("comboBoxCategory")
	public List<Category> getCategories() {
		List<Category> categories = categoryRepository.findAll();
		return categories;
	}
	
	@ModelAttribute("adminUsers")
	public Page<Account> getAdminUsersView(@RequestParam("pUser") Optional<Integer> p) {
		Pageable pageable = PageRequest.of(p.orElse(0), 10);
		Page<Account> accounts = accountRepository.findAll(pageable);
		return accounts;
	}
	
	@ModelAttribute("adminOrders")
	public Page<Orders> getAdminOrdersView(@RequestParam("pOrder") Optional<Integer> p) {
		Pageable pageable = PageRequest.of(p.orElse(0), 10);
		Page<Orders> orders = ordersRepository.findAll(pageable);
		return orders;
	}
	
	@ModelAttribute("turnover")
	public double getTurnOver() {
		double turnover = 0;
		List<Orders> orders = ordersRepository.findAll();
		for(Orders order : orders) {
			turnover += order.getPrice();
		}
		return turnover;
	}
	
	@ModelAttribute("depot")
	public int getDepot() {
		int depot = 0;
		List<Product> products = productRepository.findAll();
		for(Product product : products) {
			depot += product.getQuantity();
		}
		return depot;
	}
	
	@ModelAttribute("sold")
	public int getSold() {
		int sold = 0;
		List<OrdersDetail> ordersDetails = ordersDetailRepository.findAll();
		for(OrdersDetail ordersDetail : ordersDetails) {
			sold += ordersDetail.getQuantity();
		}
		return sold;
	}
	
}
