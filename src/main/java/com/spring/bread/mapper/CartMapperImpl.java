package com.spring.bread.mapper;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.bread.dto.CartDTO;

@Repository
public class CartMapperImpl implements CartMapper {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public CartMapperImpl() {
		System.out.println("@CartRepository : 스프링 자동 생성");
	}

	/* 카트 목록 (장바구니 테이블 여러 개 ROW 가져오기) */
	@Override
	public List<CartDTO> getCart(String memberId) throws Exception {
		List<CartDTO> result = sqlSessionTemplate.selectList("com.spring.bread.mapper.CartMapper.getCart", memberId);
		return result;
	}

	/* 카트 확인 (장바구니 테이블 한 개의 ROW 가져오기) */
	@Override
	public List<CartDTO> checkCart(CartDTO cart) throws Exception {
		List<CartDTO> result = sqlSessionTemplate.selectList("com.spring.bread.mapper.CartMapper.checkCart", cart);
		return result;
	}

	/* 카트 추가 */
	@Override
	public int addCart(CartDTO cart) throws Exception {
		int result = sqlSessionTemplate.insert("com.spring.bread.mapper.CartMapper.addCart", cart);
		return result;
	}

	/* 카트 삭제 */

	@Override
	public int deleteCart(String cartId) throws Exception {
		int result = sqlSessionTemplate.delete("com.spring.bread.mapper.CartMapper.deleteCart", cartId);
		return result;
	}

	/* 카드수정 */
	@Override
	public int modifyCount(CartDTO cart) throws Exception {
		int result = sqlSessionTemplate.update("com.spring.bread.mapper.CartMapper.modifyCount", cart);
		return result;
	}

	/* 카트구매*/
	
	@Override
	public int buyCart(String cartId) throws Exception {
		int result = sqlSessionTemplate.delete("com.spring.bread.mapper.CartMapper.buyCart", cartId);
		return result;
	}

}
