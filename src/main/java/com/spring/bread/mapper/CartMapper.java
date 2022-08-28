package com.spring.bread.mapper;

import java.util.List;
import java.util.Map;

import com.spring.bread.dto.CartDTO;

public interface CartMapper {

	/* 카트 목록 (장바구니 테이블 여러 개 ROW 가져오기) */
	public List<CartDTO> getCart(String memberId) throws Exception;

	/* 카트 확인 (장바구니 테이블 한 개의 ROW 가져오기) */
	public List<CartDTO> checkCart(CartDTO cart) throws Exception;

	/* 카트 추가 */
	public int addCart(CartDTO cart) throws Exception;

	/* 카트 삭제 */
	public int deleteCart(String cartId) throws Exception; 

	/*카트 수정*/
	public int modifyCount(CartDTO cart) throws Exception;

	/* 카트 구매*/
	public int buyCart(String cartId) throws Exception;



	/* 
	 * 유저 정보 확인 public Map<String, Object> getMember(String memberId);
	 */

}
