package com.assignment.service;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.assignment.model.Account;

public interface AccountRepository extends JpaRepository<Account, String>{
	@Query("SELECT o FROM Account o WHERE o.username=?1")
	Account findAccountByUsername(String username);
}
