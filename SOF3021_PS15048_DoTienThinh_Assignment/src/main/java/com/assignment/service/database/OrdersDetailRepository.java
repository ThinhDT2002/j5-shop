package com.assignment.service.database;

import org.springframework.data.jpa.repository.JpaRepository;

import com.assignment.model.OrdersDetail;

public interface OrdersDetailRepository extends JpaRepository<OrdersDetail, String>{

}
