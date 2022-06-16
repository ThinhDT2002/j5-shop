package com.assignment.service.database;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.assignment.model.Account;
@Repository
public interface AccountRepository extends JpaRepository<Account, String>{
	@Query("SELECT o FROM Account o WHERE o.username=?1")
	Account findAccountByUsername(String username);
}
