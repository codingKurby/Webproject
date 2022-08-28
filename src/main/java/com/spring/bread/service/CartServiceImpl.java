package com.spring.bread.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.bread.dto.CartDTO;
import com.spring.bread.mapper.CartMapper;

@Service
public class CartServiceImpl implements CartService{

	@Autowired
	private CartMapper cartMapper;

	public CartServiceImpl() {
		System.out.println("@CartService : 스프링 자동 생성");
	}

	/* 카트 목록 (장바구니 테이블 여러 개 ROW 가져오기) */
	@Override
	public List<CartDTO> getCart(String memberId) throws Exception {
		List<CartDTO> result = cartMapper.getCart(memberId);
		return result;
	}

	/* 카트 추가 */
	@Override
	public int addCart(CartDTO cart) throws Exception {
		List<CartDTO> chk = cartMapper.checkCart(cart);
		int cnt = chk.size();
		int result = 0;
		if(cnt>=1) {
			result=9999;
		}else {
			result = cartMapper.addCart(cart);
		}
		return result;
	}

	
	/* 카트 삭제 */
	
	  @Override
	  public int deleteCart(String cartId) throws Exception{ 
	  int result = cartMapper.deleteCart(cartId); 
	  return result;
}
	 

	/* 카트 수량 수정 */
	@Override
	public int modifyCount(CartDTO cart) throws Exception{ 
		int result = cartMapper.modifyCount(cart);
		return result;
	}
	
	/* 카트 구매 */
	
	  @Override
	  public int buyCart(String cartId) throws Exception{ 
	  int result = cartMapper.buyCart(cartId); 
	  return result;
}
	 
	
	
}