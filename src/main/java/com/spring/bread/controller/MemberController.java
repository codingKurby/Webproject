package com.spring.bread.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.bread.model.MemberVo;
import com.spring.bread.service.MemberService;

@Controller
public class MemberController {
	public MemberController() {
		System.out.println("@MemberController : 스프링 자동 생성");
	}

	@Autowired
	MemberService memberservice;


	// 회원가입 
	@RequestMapping(value = "/memberJoin", method = RequestMethod.GET)
	public ModelAndView join() {
		System.out.println("join : GET");
		return new ModelAndView("member/memberJoin");
	}

	@RequestMapping(value = "/memberJoin", method = RequestMethod.POST)
	public ModelAndView joinPost(MemberVo vo) {
		System.out.println("Join : POST");

		//service
		int rs = memberservice.memberJoin(vo);

		ModelAndView mav = new ModelAndView();
		if(rs==1) {
			mav.setViewName("redirect:/index");
		}else {
			mav.setViewName("redirect:/memberJoin");
		}
		return mav;
	}

	// 로그인  
	@RequestMapping(value = "/memberLogin", method = RequestMethod.GET)
	public ModelAndView login() {
		System.out.println("login : GET");
		return new ModelAndView("member/memberLogin");
	}

	@RequestMapping(value = "/memberLogin", method = RequestMethod.POST)
	public ModelAndView loginPost(@RequestParam Map<String, String> map, HttpServletRequest request, RedirectAttributes rttr) {
		System.out.println("login : POST");
		ModelAndView mav = new ModelAndView();

		//service
		MemberVo rs = memberservice.memberLogin(map);

		if(rs != null) {
			System.out.println("login");
			HttpSession session = request.getSession();
			session.setAttribute("member", rs);
			mav.setViewName("redirect:/index");
		}else {
			System.out.println("login failed");
			int result = 0;
			rttr.addFlashAttribute("result", result);
			mav.setViewName("redirect:/memberLogin");
		}
		return mav;
	}

	// 로그아웃 
	@RequestMapping(value = "memberLogout.do", method = RequestMethod.GET)
	public String memberLogout(HttpServletRequest request) {
		System.out.println("logout : get");
		HttpSession session = request.getSession();
		session.invalidate();
		return "redirect:/";
	}

	// 마이페이지
	@RequestMapping(value = "/memberMyPage", method = RequestMethod.GET)
	public ModelAndView myPage(HttpServletRequest request) {
		System.out.println("myPage : GET");

		HttpSession session = request.getSession();
		MemberVo mem = (MemberVo)session.getAttribute("member");

		ModelAndView mav = new ModelAndView();
		if(mem == null) {
			mav.setViewName("redirect:/main");
		}else {
			mav.addObject("mem", mem);
			mav.setViewName("member/memberMyPage");
		}
		return mav;
	}

	// 정보수정
	@RequestMapping(value = "/memberModify", method = RequestMethod.GET)
	public ModelAndView memberModify(HttpServletRequest request) {
		System.out.println("memberModify : GET");

		HttpSession session = request.getSession();


		MemberVo vo = (MemberVo)session.getAttribute("member");
		MemberVo mem = memberservice.memberDetail(vo);

		ModelAndView mav = new ModelAndView();
		mav.addObject("mem", mem);
		mav.setViewName("member/memberModify");

		return mav;
	}

	@RequestMapping(value = "/memberModify", method = RequestMethod.POST)
	public ModelAndView memberModifyPost(MemberVo vo, HttpServletRequest request) {
		System.out.println("memberModify : POST");

		int rs = memberservice.memberModify(vo);

		ModelAndView mav = new ModelAndView();

		if(rs==1) {
			mav.addObject("memberId", vo.getMemberId());
			mav.setViewName("redirect:/memberModify");
		}else {
			mav.addObject("memberId", vo.getMemberId());
			mav.setViewName("redirect:/memberModify");
		}

		return mav;
	}

	// 비밀번호 수정
	@RequestMapping(value = "/memberChangePw", method = RequestMethod.GET)
	public ModelAndView memberChangePw(HttpServletRequest request) {
		System.out.println("memberChangePw : GET");

		ModelAndView mav = new ModelAndView("member/memberChangePw");

		return mav;
	}

	@RequestMapping(value = "/memberChangePw", method = RequestMethod.POST)
	public ModelAndView memberChangePwPost(@RequestParam Map<String, String> map, HttpServletRequest request) {
		System.out.println("memberChangePw : POST");

		System.out.println(map);
		int rs = memberservice.memberChangePw(map);

		ModelAndView mav = new ModelAndView();

		if(rs==1) {
			mav.addObject("memberId", map.get("memberId"));
			mav.setViewName("redirect:/memberMyPage");
		}else {
			mav.addObject("memberId", map.get("memberId"));
			mav.setViewName("redirect:/memberChangePw");
		}

		return mav;
	}

	// 관리자페이지 설정하게 되면 사용.
	@RequestMapping(value="/memberList", method = RequestMethod.GET)
	public ModelAndView memberList() {

		//service
		List<MemberVo> list = memberservice.memberList();

		ModelAndView mav = new ModelAndView();
		mav.addObject("data",list);
		mav.setViewName("member/memberList");

		return mav;
	}

	// 회원탈퇴   
	@RequestMapping(value = "/memberDelete", method = RequestMethod.GET)
	public ModelAndView delete(MemberVo vo, HttpServletRequest request) {
		System.out.println("delete : GET");

		HttpSession session = request.getSession();
		MemberVo member = (MemberVo)session.getAttribute("member");

		ModelAndView mav = new ModelAndView();
		if(member == null) {
			mav.setViewName("redirect:/main");
		}else {
			mav.addObject("member", member);
			mav.setViewName("member/memberDelete");
		}
		return mav;
	}

	@RequestMapping(value = "/memberDelete", method = RequestMethod.POST)
	public ModelAndView deletePost(MemberVo vo, HttpServletRequest request, RedirectAttributes rttr) {
		System.out.println("delete : POST");

		//service
		int rs = memberservice.memberDelete(vo);
		System.out.println(rs);
		ModelAndView mav = new ModelAndView();
		if(rs == 1) {
			System.out.println("delete");
			memberservice.memberDeleted(vo);
			HttpSession session = request.getSession();
			session.invalidate();
			mav.setViewName("redirect:/main");
		}else {
			System.out.println("delete failed");
			int result = 0;
			rttr.addFlashAttribute("result", result);
			mav.setViewName("redirect:/memberDelete");
		}
		return mav;
	}

	// 아이디 중복 검사
	@RequestMapping(value = "/memberIdChk", method = RequestMethod.POST)
	@ResponseBody
	public String memberIdChkPOST(String memberId) throws Exception{
		int result = memberservice.memberIdCheck(memberId);
		//System.out.println("idChkPOST" + result);

		if(result != 0) {
			return "fail";	// 중복 아이디가 존재
		} else {
			return "success";	// 중복 아이디 x
		} // memberIdChkPOST() 종료	
	}

	/* 비동기방식 로그아웃 메서드 */
	@RequestMapping(value={"logout.do", "cartlist/logout.do"}, method=RequestMethod.POST)
	@ResponseBody
	public void logoutPOST(HttpServletRequest request) throws Exception{
		System.out.println("logout.do : post");

		HttpSession session = request.getSession();

		session.invalidate();

	}

}
