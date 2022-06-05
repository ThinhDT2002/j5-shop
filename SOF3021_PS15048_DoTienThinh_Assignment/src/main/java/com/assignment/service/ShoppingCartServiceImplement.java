package com.assignment.service;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.annotation.SessionScope;

import com.assignment.model.Product;

@Service
@SessionScope
public class ShoppingCartServiceImplement implements ShoppingCartService {
	@Autowired
	ProductRepository productRepository;
	Map<Integer, Product> shoppingCart = new HashMap<>();

	@Override
	public Product add(Integer id, int quantity) {
		Product product = shoppingCart.get(id);
		if (product == null) {
			product = productRepository.findProductById(id);
			product.setQuantity(quantity);
			shoppingCart.put(id, product);
		} else {
			product.setQuantity(product.getQuantity() + quantity);
			shoppingCart.put(id, product);
		}
		return product;
	}

	@Override
	public void remove(Integer id) {
		shoppingCart.remove(id);
	}

	@Override
	public Product update(Integer id, int qty) {
		Product product = shoppingCart.get(id);
		product.setQuantity(qty);
		shoppingCart.put(id, product);
		return product;
	}

	@Override
	public void clear() {
		shoppingCart.clear();
	}

	@Override
	public int getCount() {
		int productCount = 0;
		Iterator<Map.Entry<Integer, Product>> iterator = shoppingCart.entrySet().iterator();
		while(iterator.hasNext()) {
			Map.Entry<Integer, Product> entry = iterator.next();
			Product product = entry.getValue();
			productCount += product.getQuantity();
		}
		return productCount;
	}

	@Override
	public double getAmount() {
		double amount = 0;
		Iterator<Map.Entry<Integer, Product>> iterator = shoppingCart.entrySet().iterator();
		while (iterator.hasNext()) {
			Map.Entry<Integer, Product> entry = iterator.next();
			Product product = entry.getValue();
			amount += (product.getPrice() * product.getQuantity());
		}
		return amount;
	}
	
	@Override
	public double getTax() {
		return getAmount() * 0.05;
	}

	@Override
	public double getShipping() {
		return getCount() * 3000;
	}
	
	@Override
	public Collection<Product> getProducts() {
		Collection<Product> collection = new ArrayList<Product>();
		Iterator<Map.Entry<Integer, Product>> iterator = shoppingCart.entrySet().iterator();
		while (iterator.hasNext()) {
			Map.Entry<Integer, Product> entry = iterator.next();
			Product product = entry.getValue();
			collection.add(product);
		}
		return collection;
	}
}
