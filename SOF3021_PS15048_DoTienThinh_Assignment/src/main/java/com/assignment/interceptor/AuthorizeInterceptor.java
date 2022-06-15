package com.assignment.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.HandlerInterceptor;

import com.assignment.model.Account;
import com.assignment.service.session.SessionService;
@Service
public class AuthorizeInterceptor implements HandlerInterceptor{
	@Autowired
	SessionService sessionService;
	
	@Override
	public boolean preHandle(HttpServletRequest req, HttpServletResponse resp,
			Object handler) throws Exception {
		String uri = req.getRequestURI();
		Account account = sessionService.getAttribute("user");
		
		String error = "";
		
		if(account == null) {
			error="Not logged in!";
			resp.sendRedirect("/account/login?error=" + error);
			return false;
		}
		else if(!account.getAdmin() && uri.startsWith("/home/admin")) {
			error="Access denined!";
			resp.sendRedirect("/account/accessDeny?error=" + error);
			return false;
		}
		return true;
	}
}
