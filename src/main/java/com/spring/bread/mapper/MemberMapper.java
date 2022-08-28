package com.spring.bread.mapper;

import java.util.List;
import java.util.Map;

import com.spring.bread.dto.CartDTO;
import com.spring.bread.model.ProductVo;
import com.spring.bread.model.Criteria;
import com.spring.bread.model.MemberVo;

public interface MemberMapper {
	
	// member
	
	public int memberJoin(MemberVo vo);

	public List<MemberVo> memberList();
	
	public MemberVo memberDetail(MemberVo vo);

	public MemberVo memberPwCheck(MemberVo vo);

	public MemberVo memberLogin(Map<String, String> map);

	public int memberModify(MemberVo vo);
	
	public int memberDelete(MemberVo vo);
	
	public int memberDeleted(MemberVo vo);
	
	public int memberIdCheck(String memberId);
	
	public int memberChangePw(Map<String, String> map);

}
