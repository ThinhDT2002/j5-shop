package com.assignment.service;

import org.springframework.data.jpa.repository.JpaRepository;

import com.assignment.model.Account;

public interface AccountRepository extends JpaRepository<Account, String>{

}
