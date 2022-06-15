package com.assignment.service.database;

import org.springframework.data.jpa.repository.JpaRepository;

import com.assignment.model.Category;

public interface CategoryRepository extends JpaRepository<Category, String>{

}
