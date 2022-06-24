package com.assignment.service.account;

import java.io.File;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.assignment.model.Account;
import com.assignment.service.database.AccountRepository;
import com.assignment.service.session.SessionService;

@Service
public class UpdateAccount {
	@Autowired
	SessionService sessionService;
	@Autowired
	AccountRepository accountRepository;
	
	private static final String URL_PHOTO = System.getProperty("user.dir") + "/src/main/webapp/images/account/";
	
	public String updateProfile(Account account, MultipartFile photoFile) {
		Account currentUser = sessionService.getAttribute("user");
		try {
			account.setUsername(currentUser.getUsername());
			account.setPassword(currentUser.getPassword());
			account.setEmail(account.getEmail());
			account.setFullname(account.getFullname());
			account.setPhonenumber(account.getPhonenumber());
			account.setActivated(currentUser.getActivated());
			if(currentUser.getAdmin() == false || currentUser.getAdmin() == null) {
				account.setAdmin(false);
			} else {
				account.setAdmin(true);
			}
			if(!photoFile.isEmpty()) {
				String filename = photoFile.getOriginalFilename();
				File file = new File(URL_PHOTO + filename);
				if(!file.exists()) {
					file.mkdirs();
				}
				photoFile.transferTo(file);
				account.setPhoto(filename);	
			} else {
				account.setPhoto(currentUser.getPhoto());
			}
			accountRepository.save(account);
			sessionService.setAttribute("user", account);
			return "Cập nhật thành công";
		} catch (Exception ex) {
			ex.printStackTrace();
			return "Cập nhật thất bại";
		}
	}
}
