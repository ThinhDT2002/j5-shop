package com.assignment.service.database;

import org.springframework.data.jpa.repository.JpaRepository;

import com.assignment.model.Orders;

public interface OrdersRepository extends JpaRepository<Orders, Integer>{

}
