package com.spring.bread.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.bread.mapper.MemberMapper;
import com.spring.bread.model.MemberVo;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberMapper dao;
	
	public MemberServiceImpl(){
		System.out.println("@MemberService : 스프링 자동 생성");
	}

	@Override
	public int memberJoin(MemberVo vo) {
		int rs = dao.memberJoin(vo);
		return rs;
	}
	
	@Override
	public List<MemberVo> memberList() {
		return dao.memberList();
	}

	@Override
	public MemberVo memberLogin(Map<String, String> map) {
		return dao.memberLogin(map);
	}
	
	@Override
	public MemberVo memberPwCheck(MemberVo vo) {
		return dao.memberPwCheck(vo);
	}

	@Override
	public void test() {
		
	}

	@Override
	public MemberVo memberDetail(MemberVo vo) {
		return dao.memberDetail(vo);
	}

	@Override
	public int memberModify(MemberVo vo) {
		return dao.memberModify(vo);
	}
	
	@Override
	public int memberDelete(MemberVo vo) {
		return dao.memberDelete(vo);
	}

	@Override
	public int memberIdCheck(String memberId) {
		return dao.memberIdCheck(memberId);
	}

	@Override
	public int memberDeleted(MemberVo vo) {
		return dao.memberDeleted(vo);
	}

	@Override
	public int memberChangePw(Map<String, String> map) {
		return dao.memberChangePw(map);
	}

	
	
	
	
}
