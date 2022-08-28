package com.spring.bread.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

import com.spring.bread.model.MemberVo;

public class CartInterceptor implements HandlerInterceptor{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		System.out.println("카트 프리 핸들러 작동 시작!");

		HttpSession session = request.getSession();

		MemberVo mvo = (MemberVo)session.getAttribute("member");

		if(mvo == null) {
			response.sendRedirect("/");
			return false;
		}

		System.out.println("카트 프리 핸들러 작동 끝!");
		return HandlerInterceptor.super.preHandle(request, response, handler);
	}

}
