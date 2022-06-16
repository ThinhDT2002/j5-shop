package com.assignment.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Optional;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.assignment.model.Account;
import com.assignment.model.Orders;
import com.assignment.model.OrdersDetail;
import com.assignment.model.Product;
import com.assignment.service.database.AccountRepository;
import com.assignment.service.database.OrdersDetailRepository;
import com.assignment.service.database.OrdersRepository;
import com.assignment.service.database.ProductRepository;
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
	
	@ModelAttribute("user")
	public Account getCurrentUser() {
		Account account = sessionService.getAttribute("user");
		return account;
	}
	
	@RequestMapping("/home/admin")
	public String getAccount(Model model) {
		Product product = new Product();
		model.addAttribute("product", product);
		List<Product> products = productRepository.findAll();
		model.addAttribute("products", products);
		List<Account> items = accountRepository.findAll();
		model.addAttribute("items", items);
		return "home/admin";
	}
	
	@RequestMapping("/home/admin/create")
	public String createProduct(Product product, @RequestParam("attach-file")
			MultipartFile multipartFile) throws IllegalStateException, IOException{
		if(!multipartFile.isEmpty()) {
			String path = app.getRealPath("/"); // nó lấy đường dẫn webapp
			
			System.out.println("path : " + path);
			
			
			
			String fileName = multipartFile.getOriginalFilename();
			File file = new File(path + "/images/product/" + fileName);
			
			if(!file.exists()) {
				file.mkdirs();
			}
			
			product.setImage1(fileName);
			product.setImage2(fileName);
			product.setImage3(fileName);
			product.setImage4(fileName);
			
			multipartFile.transferTo(file);
//			System.out.println(file);
//			System.out.println(file.getAbsolutePath());
//			System.out.println(multipartFile.getOriginalFilename());
		}
		productRepository.save(product);
		return "redirect:/home/admin";
	}

	@RequestMapping("/home/admin/edit/{id}")
	public String editProduct(Model model, @PathVariable("id") Integer id) {
		Product product = productRepository.findById(id).get();
		model.addAttribute("product", product);
		List<Product> products = productRepository.findAll();
		model.addAttribute("products", products);
		return "home/admin";
	}

	@RequestMapping("/home/admin/update")
	public String update(Product product) {
		productRepository.save(product);
		return "redirect:/home/admin/edit/" + product.getId();
	}
	
	@RequestMapping("/home/admin/delete/{id}")
	public String create(@PathVariable("id") Integer id) {
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
