package com.spring.bread.service;

import java.util.List;

import com.spring.bread.model.AttachImageVo;

public interface AttachService {
	/* 이미지 데이터 반환 */
	public List<AttachImageVo> getAttachList(int productId);
}
