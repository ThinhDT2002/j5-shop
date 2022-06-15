package com.assignment.util.mail;

import java.io.File;
import java.io.IOException;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
@Service
public class MailUtil {
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
}
