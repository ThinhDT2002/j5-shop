package com.assignment.service.product;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class SaveProductImage {
	@Autowired
	ServletContext app;
	public String save(MultipartFile photoFile) throws IllegalStateException, IOException {
		if(!photoFile.isEmpty()) {
			String path = app.getRealPath("/");
			String fileName = photoFile.getOriginalFilename();
			File file = new File(path + "/images/product/" + fileName);
			if(!file.exists()) {
				file.mkdirs();
			}
			photoFile.transferTo(file);
			return fileName;
		}
		return "";
	}
}
