package com.assignment.controller;

import java.io.IOException;
import java.util.List;
import java.util.Optional;

import javax.servlet.ServletContext;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

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
import com.assignment.service.product.CreateProduct;
import com.assignment.service.product.SaveProductImage;
import com.assignment.service.session.SessionService;
import com.assignment.service.shoppingCart.ShoppingCartServiceImplement;

@Controller
public class HomeController {
	@Autowired
	ProductRepository productRepository;
	@Autowired
	ShoppingCartServiceImplement shoppingCart;
	@Autowired
	SessionService sessionService;
	@Autowired
	OrdersRepository ordersRepository;
	@Autowired
	OrdersDetailRepository ordersDetailRepository;
	@Autowired
	ServletContext app;
	@Autowired
	AccountRepository accountRepository;
	@Autowired
	SaveProductImage saveImage;
	@Autowired
	CreateProduct createProduct;
	@Autowired
	CategoryRepository categoryRepository;
	@ModelAttribute("shoppingCart")
	public ShoppingCartServiceImplement getShoppingCart() {
		return shoppingCart;
	}
	
	@RequestMapping("/home/index")
	public String getIndex(Model model, @RequestParam("p") Optional<Integer> pageNumber,
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
	
	@RequestMapping("/home/admin/create")
	public String createProduct(Model model,@Valid Product product, Errors errors, 
			@RequestParam("attach-file1") MultipartFile multipartFile1,
			@RequestParam("attach-file2") MultipartFile multipartFile2,
			@RequestParam("attach-file3") MultipartFile multipartFile3,
			@RequestParam("attach-file4") MultipartFile multipartFile4) throws IllegalStateException, IOException{
		boolean productValid = true;
		if(errors.hasErrors()) {
			productValid = false;
		}
		if(multipartFile1.getOriginalFilename().length() > 65) {
			productValid = false;
			model.addAttribute("errorImg1", "Tên ảnh quá dài");
		}
		if(multipartFile2.getOriginalFilename().length() > 65) {
			productValid = false;
			model.addAttribute("errorImg2", "Tên ảnh quá dài");
		}
		if(multipartFile3.getOriginalFilename().length() > 65) {
			productValid = false;
			model.addAttribute("errorImg3", "Tên ảnh quá dài");
		}
		if(multipartFile4.getOriginalFilename().length() > 65) {
			productValid = false;
			model.addAttribute("errorImg4", "Tên ảnh quá dài");
		}
		if(!productValid) {
			return "home/admin";
		}
		
		createProduct.create(product, multipartFile1, multipartFile2, multipartFile3, multipartFile4);
		
		return "redirect:/home/admin";
	}

	@RequestMapping("/home/admin/edit/{id}")
	public String editProduct(Model model, @PathVariable("id") Integer id,
			@RequestParam("p") Optional<Integer> p) {
		Product product = productRepository.findById(id).get();
		model.addAttribute("product", product);
		return "home/admin";
	}
	
	@RequestMapping("/home/admin/update")
	public String update(Product product) {
		productRepository.save(product);
		return "redirect:/home/admin/edit/" + product.getId();
	}
	
	@RequestMapping("/home/admin/delete/{id}")
	public String delete(@PathVariable("id") Integer id) {
		productRepository.deleteById(id);
		return "redirect:/home/admin";
	}
	
	
	@RequestMapping("/home/order")
	public String getOrderHistoryPage(Model model, @RequestParam("page") Optional<Integer> page) {
		Account account = sessionService.getAttribute("user");
		Pageable pageable = PageRequest.of(page.orElse(0), 10);
		Page<Orders> orders = ordersRepository.findOrdersByUserName(pageable, account.getUsername());
		model.addAttribute("orders",orders);
		return "home/order";
	}
	
	@RequestMapping("/home/order/detail")
	public String getOrderDetail(Model model, @RequestParam("orderId") int orderId) {
		List<OrdersDetail> ordersDetails = ordersDetailRepository.findOrdersDetailByOrderId(orderId);
		double total = ordersDetails.get(0).getOrders().getPrice();
		model.addAttribute("ordersDetails",ordersDetails);
		model.addAttribute("totalPrice", total);
		return "home/order/detail";
	}
}
