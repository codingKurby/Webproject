package com.spring.bread.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.bread.dto.PageMakerDTO;
import com.spring.bread.mapper.AttachMapper;
import com.spring.bread.mapper.BreadMapper;
import com.spring.bread.model.ProductVo;
import com.spring.bread.model.ReplyPageVo;
import com.spring.bread.model.ReplyVo;
import com.spring.bread.model.AttachImageVo;
import com.spring.bread.model.Criteria;

@Service
public class ProductServiceImpl implements ProductService{
	@Autowired
	private BreadMapper mapper;

	@Autowired
	private AttachMapper attachMapper;

	@Override
	public void enroll(ProductVo vo) {

		mapper.enroll(vo);
		if(vo.getImageList() == null || vo.getImageList().size() <= 0) {
			return;
		}
		for(AttachImageVo attach : vo.getImageList()) {
			attach.setProductId(vo.getProductId());
			mapper.imageEnroll(attach);
		}

	}

	@Override
	public List<ProductVo> getList() {

		return mapper.getList();
	}

	/* 게시판 목록 (페이징 적용)*/
	@Override
	public List<ProductVo> getListPaging(Criteria cri){

		//return mapper.getListPaging(cri);

		List<ProductVo> list = mapper.getListPaging(cri);

		list.forEach(product -> {

			int productId = product.getProductId();

			List<AttachImageVo> imageList = attachMapper.getAttachList(productId);

			product.setImageList(imageList);

		});
		return list;
	}

	/* 게시판 조회 */
	@Override
	public ProductVo getPage(int productId) {

		return mapper.getPage(productId);
	}   

	/* 게시판 수정 */
	@Override
	public int modify(ProductVo vo) {

		return mapper.modify(vo);
	}

	/*게시판 삭제*/
	@Override
	public int delete(int productId) {

		return mapper.delete(productId);
	}

	/* 게시판 총 갯수 */
	@Override
	public int getTotal(Criteria cri) {

		return mapper.getTotal(cri);
	}



	@Override
	public ProductVo getProductInfo(int productId) {

		ProductVo productInfo = mapper.getProductInfo(productId);


		return productInfo;
	}
	
	@Override
	public List<ReplyVo> replyGetList(Criteria cri) {
		return mapper.replyGetList();
	}

	@Override
	public int enrollReply(ReplyVo rvo) {
		
		int result = mapper.enrollReply(rvo);
		
		return result;
	}

	@Override
	public ProductVo getProductIdName(int productId) {
		return mapper.getProductIdName(productId);
	}

	@Override
	public String checkReply(ReplyVo rvo) {
		
		Integer result = mapper.checkReply(rvo);
		
		if(result==null) {
			return "0";
		}else {
			return"1";
		}
		
	}

	@Override
	public ReplyPageVo replyList(Criteria cri) {
		
		ReplyPageVo rpvo = new ReplyPageVo();
		
		rpvo.setList(mapper.getReplyList(cri));
		rpvo.setPageInfo(new PageMakerDTO(cri, mapper.getReplyTotal(cri.getProductId())));
		return rpvo;
	}

	@Override
	public int updateReply(ReplyVo rvo) {
		int result = mapper.updateReply(rvo);
		return result;
	}

	@Override
	public ReplyVo getUpdateReply(int replyId) {
		return mapper.getUpdateReply(replyId);
	}

	@Override
	public int deleteReply(ReplyVo rvo) {
		int result = mapper.deleteReply(rvo.getReplyId()); 
		
		return result;
	}
}
