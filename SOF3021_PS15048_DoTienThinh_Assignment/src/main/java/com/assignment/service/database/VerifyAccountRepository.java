package com.assignment.service.database;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.assignment.model.VerifyAccount;
@Repository
public interface VerifyAccountRepository extends JpaRepository<VerifyAccount, String>{
	@Query("SELECT o FROM VerifyAccount o WHERE o.verifyCode=?1")
	VerifyAccount findVerifyAccountByVerifyCode(String verifyCode);
	
	@Query("SELECT o FROM VerifyAccount o WHERE o.username=?1")
	VerifyAccount findVerifyAccountByUsername(String username);
}
