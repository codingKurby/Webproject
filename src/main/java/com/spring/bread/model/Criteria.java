package com.spring.bread.model;

import java.util.Arrays;

public class Criteria {
	
	
	//현재 페이지
	private int pageNum;
	
	//한 페이지 당 보여질 게시글 수
	private int amount;
	
	//스킵할 게시글 수 (pageNum-1)*amount
	private int skip;
	
	//검색 키워드
	private String keyword;
	
	//검색 타입
	private String type;
	
	//검색 타입 배열
	private String[] typeArr;
	
	//review
	private int productId;
	
	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}
	
	//기본 생성자(기본 값 1,10)
	public Criteria() {
		this(1,10);
		this.skip = 0;
	}

	//생성자 => 원하는 pageNum, 원하는 amount
	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
		this.skip = (this.pageNum-1)* this.amount;
		
	}
	

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.skip = (pageNum-1) * this.amount;
		this.pageNum = pageNum;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.skip = (this.pageNum-1) * amount;
		this.amount = amount;
	}

	public int getSkip() {
		return skip;
	}

	public void setSkip(int skip) {
		this.skip = skip;
	}
	

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
		this.typeArr = type.split(""); //split => String 타입의 데이터를 String 배열 타입 데이터로 변환해주는 메소드
	}

	public String[] getTypeArr() {
		return typeArr;
	}

	public void setTypeArr(String[] typeArr) {
		this.typeArr = typeArr; 
	}

	@Override
	public String toString() {
		return "Criteria [pageNum=" + pageNum + ", amount=" + amount + ", skip=" + skip + ", keyword=" + keyword
				+ ", type=" + type + ", typeArr=" + Arrays.toString(typeArr) + "]";
	}

	
	

	
	
}
