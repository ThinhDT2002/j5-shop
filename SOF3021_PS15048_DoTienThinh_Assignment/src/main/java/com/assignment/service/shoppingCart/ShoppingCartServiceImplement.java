package com.assignment.service.shoppingCart;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.annotation.SessionScope;

import com.assignment.model.Orders;
import com.assignment.model.OrdersDetail;
import com.assignment.model.Product;
import com.assignment.service.database.OrdersDetailRepository;
import com.assignment.service.database.ProductRepository;

@Service
@SessionScope
public class ShoppingCartServiceImplement implements ShoppingCartService {
	@Autowired
	ProductRepository productRepository;
	@Autowired
	OrdersDetailRepository ordersDetailRepository;
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
	
	public void getProductsInShoppingCartInsertIntoOrderDetail(Orders orders) {
		Iterator<Map.Entry<Integer, Product>> iterator = shoppingCart.entrySet().iterator();
		while(iterator.hasNext()) {
			Map.Entry<Integer, Product> entry = iterator.next();
			Product product = entry.getValue();
			Product productInStock = productRepository.findProductById(product.getId());
			int productRemain = productInStock.getQuantity() - product.getQuantity();
			productInStock.setQuantity(productRemain);
			OrdersDetail ordersDetail = new OrdersDetail();
			ordersDetail.setOrders(orders);
			ordersDetail.setQuantity(product.getQuantity());
			ordersDetail.setProduct(product);
			ordersDetailRepository.save(ordersDetail);
			productRepository.save(productInStock);
		}
		shoppingCart.clear();
	}
}
