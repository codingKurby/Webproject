package com.spring.bread.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.bread.controller.ProductController;
import com.spring.bread.mapper.AttachMapper;
import com.spring.bread.model.AttachImageVo;

@Service
public class AttachServiceImpl implements AttachService {
	
	private static final Logger log = LoggerFactory.getLogger(ProductController.class);
	
	@Autowired
	private AttachMapper attachMapper;
	
	
	/* 이미지 데이터 반환 */
	@Override
	public List<AttachImageVo> getAttachList(int productId) {
		
		log.info("getAttachList.........");
		
		return attachMapper.getAttachList(productId);
	}

}
