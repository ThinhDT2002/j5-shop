package com.assignment.service.session;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SessionService {
	@Autowired
	HttpSession httpSession;
	
	public void setAttribute(String name, Object value) {
		httpSession.setAttribute(name, value);
	}
	
	@SuppressWarnings("unchecked")
	public <T> T getAttribute(String name) {
		return (T) httpSession.getAttribute(name);
	}
	
	public void removeAttribute(String name) {
		httpSession.removeAttribute(name);
	}
}
