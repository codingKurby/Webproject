package com.spring.bread.mapper;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.spring.bread.dto.CartDTO;
import com.spring.bread.model.ProductVo;
import com.spring.bread.model.ReplyVo;
import com.spring.bread.model.AttachImageVo;
import com.spring.bread.model.Criteria;
import com.spring.bread.model.MemberVo;

public interface BreadMapper {
	
	// product
	// product
	// product
	
	//게시판 등록
	public void enroll(ProductVo vo);

	//게시판 목록
	public List<ProductVo> getList();

	//게시판 목록(페이징 적용)
	public List<ProductVo> getListPaging(Criteria cri);

	//게시판 총 갯수
	public int getTotal(Criteria cri);

	//게시판 조회(상품 상세페이지)
	public ProductVo getPage(int productId);

	//게시판 수정
	public int modify(ProductVo vo);

	//게시판 삭제
	public int delete(int productId);
	
	//이미지 등록
	public void imageEnroll(AttachImageVo vo);
	
	//상품정보
	public ProductVo getProductInfo(int productId);
		
	/* 이미지 데이터 반환 */
	public List<AttachImageVo> getAttachList(int productId);
	
	
	// member
	// member
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
		
	//댓글등록
		public int enrollReply(ReplyVo rvo);

		//상품 id 이름
		public ProductVo getProductIdName(int productId);
		
		//댓글 존재 체크
		
		public Integer checkReply(ReplyVo rvo);
		
		//댓글페이징
		public List<ReplyVo> getReplyList(Criteria cri);
		
		//댓글 총 개수
		public int getReplyTotal(int productId);
		
		//댓글 수정
		public int updateReply(ReplyVo rvo);
		
		/* 댓글 한개 정보(수정페이지) */
		public ReplyVo getUpdateReply(int replyId);
		
		/* 댓글 삭제 */
		public int deleteReply(int replyId);
		
		public List<ReplyVo> replyGetList();


}
