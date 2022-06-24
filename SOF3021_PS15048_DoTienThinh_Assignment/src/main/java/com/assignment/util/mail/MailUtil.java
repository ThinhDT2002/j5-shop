package com.assignment.util.mail;

import java.io.File;
import java.io.IOException;

import javax.mail.MessagingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.assignment.model.MailInformation;
import com.assignment.service.mail.MailServiceImplement;
@Service
public class MailUtil {
	@Autowired 
	MailServiceImplement mailServiceImplement;
	public String[] parseStringEmailToArray(String emailString) {
		String[] arrEmail = null;
		if(emailString.length() > 0) {
			emailString = removeSpace(emailString);
			arrEmail = emailString.split(",");
		}
		return arrEmail;
	}
	
	public String removeSpace(String string) {
		return string.replaceAll(" ", "");
	}
	
	public File convertMultipartFileToFile(MultipartFile multipartFile) throws IOException {
		File convertFile = new File(System.getProperty("java.io.tmpdir") + "/" + multipartFile.getOriginalFilename());
		multipartFile.transferTo(convertFile);
		return convertFile;
	}
	
	public void sendVerifyCode(String to, String verifyCode, String subject, String body) throws MessagingException {
		MailInformation mailInformation = new MailInformation();
		mailInformation.setTo(to);
		mailInformation.setSubject(subject);
		mailInformation.setBody(body);
		mailServiceImplement.send(mailInformation);
	}
}
