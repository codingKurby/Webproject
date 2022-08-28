package com.spring.bread.model;

import java.util.List;

public class ProductVo {

	int productId;
	String productName;
	int productPrice;
	String productCategory;
	
	public ProductVo() {
	}

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public int getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}

	public String getProductCategory() {
		return productCategory;
	}

	public void setProductCategory(String productCategory) {
		this.productCategory = productCategory;
	}

	@Override
	public String toString() {
		return "BreadVo [productId=" + productId + ", productName=" + productName + ", productPrice=" + productPrice
				+ ", productCategory=" + productCategory + "]";
	}
	private AttachImageVo imageVo;
	
	/* 이미지 정보 */
	private List<AttachImageVo> imageList;
	

	public AttachImageVo getImageVo() {
		return imageVo;
	}

	public void setImageVo(AttachImageVo imageVo) {
		this.imageVo = imageVo;
	}

	public List<AttachImageVo> getImageList() {
		return imageList;
	}

	public void setImageList(List<AttachImageVo> imageList) {
		this.imageList = imageList;
	}

	public ProductVo(int productId, String productName, int productPrice, String productCategory, AttachImageVo imageVo,
			List<AttachImageVo> imageList) {
		super();
		this.productId = productId;
		this.productName = productName;
		this.productPrice = productPrice;
		this.productCategory = productCategory;
		this.imageVo = imageVo;
		this.imageList = imageList;
	}
	
	
	
	
}
