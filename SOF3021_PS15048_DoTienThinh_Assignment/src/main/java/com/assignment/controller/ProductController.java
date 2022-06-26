package com.assignment.controller;

import java.io.IOException;
import java.util.Optional;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.assignment.model.Product;
import com.assignment.service.database.ProductRepository;
import com.assignment.service.product.CreateProduct;

@Controller
public class ProductController {
	@Autowired
	CreateProduct createProduct;
	@Autowired
	ProductRepository productRepository;
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
}
