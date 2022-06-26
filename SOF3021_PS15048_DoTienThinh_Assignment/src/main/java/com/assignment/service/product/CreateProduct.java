package com.assignment.service.product;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.assignment.model.Product;
import com.assignment.service.database.ProductRepository;

@Service
public class CreateProduct {
	@Autowired
	ProductRepository productRepository;
	@Autowired
	SaveProductImage saveImage;
	public void create(Product product,
						 MultipartFile photoFile1,
						 MultipartFile photoFile2,
						 MultipartFile photoFile3,
						 MultipartFile photoFile4) throws IllegalStateException, IOException {
		if(product.getId() != null) {
			product = productRepository.findProductById(product.getId());
		}
		String image1 = saveImage.save(photoFile1);
		String image2 = saveImage.save(photoFile2);
		String image3 = saveImage.save(photoFile3);
		String image4 = saveImage.save(photoFile4);
		if(product.getDiscount() == null) {
			product.setDiscount(0);
		}
		if(!image1.equals("")) {
			product.setImage1(image1);
		}
		if(!image2.equals("")) {
			product.setImage2(image2);
		}
		if(!image3.equals("")) {
			product.setImage3(image3);
		}
		if(!image4.equals("")) {
			product.setImage4(image4);
		}
		productRepository.save(product);
	}
}
