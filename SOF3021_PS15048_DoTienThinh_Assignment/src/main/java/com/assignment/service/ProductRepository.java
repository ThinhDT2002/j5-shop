package com.assignment.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.assignment.model.Product;

public interface ProductRepository extends JpaRepository<Product, Integer>{
	Page<Product> findAllByCategoryIdLike(String category, Pageable pageable);
	
	@Query("SELECT o FROM Product o WHERE o.id=?1")
	Product findProductById(Integer id);
}
