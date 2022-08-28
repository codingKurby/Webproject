package com.spring.bread.model;

import java.util.List;

import com.spring.bread.dto.PageMakerDTO;

public class ReplyPageVo {
	List<ReplyVo> list;
	
	PageMakerDTO pageInfo;

	@Override
	public String toString() {
		return "ReplyPageVo [list=" + list + ", pageInfo=" + pageInfo + "]";
	}

	public List<ReplyVo> getList() {
		return list;
	}

	public void setList(List<ReplyVo> list) {
		this.list = list;
	}

	public PageMakerDTO getPageInfo() {
		return pageInfo;
	}

	public void setPageInfo(PageMakerDTO pageInfo) {
		this.pageInfo = pageInfo;
	}
}
