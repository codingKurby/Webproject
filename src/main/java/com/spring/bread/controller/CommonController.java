package com.spring.bread.controller;



import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class CommonController {
	public CommonController() {
		System.out.println("@CommonController : 스프링 자동 생성");
	}
	
	// 메인페이지 
	@RequestMapping(value={"/", "/index", "/main"}, method = RequestMethod.GET)
	public ModelAndView index() {
		return new ModelAndView("index");
	}

	

}
