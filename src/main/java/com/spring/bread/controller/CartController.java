package com.spring.bread.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.bread.dto.CartDTO;
import com.spring.bread.model.MemberVo;
import com.spring.bread.service.CartService;
import com.spring.bread.service.MemberService;

@Controller
public class CartController {

	@Autowired
	private CartService cartService;

	@Autowired
	private MemberService memberservice;

	public CartController() {
		System.out.println("@CartController : 스프링 자동 생성");
	}

	/* 카트 목록 (장바구니 테이블 여러 개 ROW 가져오기) */
	@RequestMapping(value = "/cartlist/{memberId}", method = RequestMethod.GET)
	public String cartListPage(@PathVariable("memberId") String memberId, Model model) throws Exception {
		System.out.println("@@RequestMapping : 카트 리스트 페이지 방문, 접속한 유저 ID [" + memberId + "]");
		List<CartDTO> list = cartService.getCart(memberId);
		model.addAttribute("cartInfo", list);
		System.out.println(list.toString());
		return "cartlist";
	}

	/* 카트 로그인 */
	@RequestMapping(value = "/cartLogin", method = RequestMethod.POST)
	public ModelAndView cartLogin(@RequestParam Map<String, String> map, HttpSession session) {
		System.out.println("cartLogin 카트 페이지 로그인");
		session.setAttribute("tmpCart", map); //임시카트
		System.out.println("tempCart 임시 카트" + map);
		System.out.println("cartLogin : POST");
		return new ModelAndView("cartLogin");
	}
	
	@RequestMapping(value = "/cartLoginProc", method = RequestMethod.POST)
	public ModelAndView loginPost(@RequestParam Map<String, String> map, HttpServletRequest request) throws Exception {
		System.out.println("cartLoginProc : POST");
		System.out.println("map >>" + map);

		//service
		MemberVo rs = memberservice.memberLogin(map);
		System.out.println("rs>>" + rs);

		ModelAndView mav = new ModelAndView();
		if(rs != null) {
			System.out.println("login");
			HttpSession session = request.getSession();
			session.setAttribute("member", rs);
			session.setAttribute("memberId", rs.getMemberId());
			
			Map<String, String> tmpCart = (Map)session.getAttribute("tmpCart"); //카트값

			CartDTO cartDTO = new CartDTO();
			cartDTO.setMemberId((String)tmpCart.get("memberId"));
			cartDTO.setProductId(Integer.parseInt(tmpCart.get("productId")));
			cartDTO.setProductCount(1);
			cartDTO.setProductName((String)tmpCart.get("productName"));
			cartDTO.setProductPrice(Integer.parseInt(tmpCart.get("productPrice")));
			cartDTO.setTotalPrice(Integer.parseInt(tmpCart.get("productPrice")));

			String memberId = (String) session.getAttribute("memberId");
			cartDTO.setMemberId(memberId);
			int totalPrice = cartDTO.getProductCount() * cartDTO.getProductPrice();
			cartDTO.setTotalPrice(totalPrice);
			int result = cartService.addCart(cartDTO);
			mav.setViewName("redirect:/cartlist/"+memberId);
			
		}else {
			System.out.println("login failed");
			int result = 0;
			mav.addObject("result", result);
			mav.setViewName("/cartLogin");
		}
		return mav;
	}

	/* 카트 추가 */
	@RequestMapping(value = "/cart/add", method = RequestMethod.POST)
	public String cartAdd(@RequestParam Map<String, String> map, HttpSession session) throws Exception {
		System.out.println("cart/add : 카트 추가" + map);
		CartDTO cartDTO = new CartDTO();
		//String memberId = (String) session.getAttribute("memberId");
		cartDTO.setMemberId((String)map.get("memberId"));
		cartDTO.setProductId(Integer.parseInt(map.get("productId")));
		cartDTO.setProductCount(1);
		cartDTO.setProductName((String)map.get("productName"));
		cartDTO.setProductPrice(Integer.parseInt(map.get("productPrice")));
		cartDTO.setTotalPrice(Integer.parseInt(map.get("productPrice")));
		String memberId = (String)map.get("memberId");
		if (memberId == null) {
			return "redirect:/cartLogin/";
		} else {
			cartDTO.setMemberId(memberId);
			int totalPrice = cartDTO.getProductCount() * cartDTO.getProductPrice();
			cartDTO.setTotalPrice(totalPrice);
			int result = cartService.addCart(cartDTO);
			return "redirect:/cartlist/"+memberId;
		}
	}

	/* 카트 삭제 */
	@RequestMapping(value = "/cart/delete", method = RequestMethod.POST)
	public String deleteCart(CartDTO cartDTO, HttpServletRequest request) throws Exception {
		System.out.println("@@RequestMapping : 카트 삭제");
		System.out.println("@@CartDTO : " + cartDTO.toString());

		String productDelete = cartDTO.getProductDeleteList();
		String[] productDeleteList = productDelete.split(",");
		for (int i = 0; i < productDeleteList.length; i++) {
			String cartId = productDeleteList[i];
			cartService.deleteCart(cartId);
			String productId = productDeleteList[i];
			cartService.deleteCart(productId);
			String memberId = productDeleteList[i];
			cartService.deleteCart(memberId);
			String productCount = productDeleteList[i];
			cartService.deleteCart(productCount);
		}
		return "success";
	}

	/* 장바구니 수량 수정 */
	@RequestMapping(value = "/cart/update", method = RequestMethod.POST)
	public String updateCartPOST(CartDTO cartDTO) throws Exception {
		System.out.println("@@RequestMapping : 카트 수정");
		System.out.println("@@CartDTO : " + cartDTO.toString());

		cartService.modifyCount(cartDTO);

		return "success";
	}

	/* 카트 구매 */
	@RequestMapping(value = "/cart/buy", method = RequestMethod.POST)
	public String buyCart(CartDTO cartDTO, HttpServletRequest request) throws Exception {
		System.out.println("@@RequestMapping : 카트 구매");
		System.out.println("@@CartDTO : " + cartDTO.toString());

		String productbuy = cartDTO.getProductbuyList();
		String[] productbuyList = productbuy.split(",");
		for (int i = 0; i < productbuyList.length; i++) {
			String cartId = productbuyList[i];
			cartService.buyCart(cartId);
			String productId = productbuyList[i];
			cartService.buyCart(productId);
			String memberId = productbuyList[i];
			cartService.buyCart(memberId);
			String productCount = productbuyList[i];
			cartService.buyCart(productCount);
		}
		return "success";
	}

}
