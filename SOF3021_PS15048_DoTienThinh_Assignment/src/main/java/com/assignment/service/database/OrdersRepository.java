package com.assignment.service.database;

import java.util.Date;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.query.Procedure;
import org.springframework.stereotype.Repository;

import com.assignment.model.Orders;
@Repository
public interface OrdersRepository extends JpaRepository<Orders, Integer>{
	@Procedure(procedureName = "CreateOrder", outputParameterName = "Output")
	public int CreateOrder(String username,Date create_date,String address, String phonenumber, String order_note, int order_status, double price);
	
	@Query("Select o FROM Orders o where o.account.username=?1")
	Page<Orders> findOrdersByUserName(Pageable pageable ,String username);
	
}
