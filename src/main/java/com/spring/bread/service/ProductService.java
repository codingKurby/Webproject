package com.spring.bread.service;

import java.util.List;

import com.spring.bread.model.ProductVo;
import com.spring.bread.model.ReplyPageVo;
import com.spring.bread.model.ReplyVo;
import com.spring.bread.model.Criteria;

public interface ProductService {

    /* 게시판 등록 */
    public void enroll(ProductVo vo);
    
    /* 게시판 목록 */
    public List<ProductVo> getList();
    
    /* 게시판 목록 (페이징 적용)*/
    public List<ProductVo> getListPaging(Criteria cri);
    
    /* 게시판 조회 */
    public ProductVo getPage(int productId);
    
    /* 게시판 수정 */
    public int modify(ProductVo vo);
    
    /* 게시판 삭제 */
    public int delete(int productId);
    
    /* 게시판 총 갯수 */
    public int getTotal(Criteria cri);
    
    /* 상품 정보 */
	public ProductVo getProductInfo(int ProductId);
	

		//상품 id 이름
		public ProductVo getProductIdName(int productId);

		//댓글 존재 체크
		public String checkReply(ReplyVo rvo);
		
		//댓글 페이징
		public ReplyPageVo replyList(Criteria cri); 
		
		//댓글 수정
		public int updateReply(ReplyVo rvo);
		
		/* 댓글 한개 정보(수정페이지) */
		public ReplyVo getUpdateReply(int replyId);
		
		public int deleteReply(ReplyVo rvo);
		//댓글등록
		public List<ReplyVo> replyGetList(Criteria cri);
			public int enrollReply(ReplyVo rvo);
}
