package com.spring.bread.dto;

public class CartDTO {

	public CartDTO() {
	}

	// cart 테이블 속성
	private int cartId; // 카트번호
	private String memberId; // 회원id
	private int productId; // 상품번호
	private int productCount; // 상품수량

	// PRODUCT 테이블과 조인 / 페이지에 보여주기
	private String productName; // 상품이름
	private int productPrice; // 상품가격

	// 추가
	private int totalPrice; // 총가격
	// private List<AttachImageVo> imageList; //상품이미지

	private String productDeleteList;
	private String productbuyList;
	
	
	
	public int getCartId() {
		return cartId;
	}
	public void setCartId(int cartId) {
		this.cartId = cartId;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	public int getProductCount() {
		return productCount;
	}
	public void setProductCount(int productCount) {
		this.productCount = productCount;
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
	public int getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	public String getProductDeleteList() {
		return productDeleteList;
	}
	public void setProductDeleteList(String productDeleteList) {
		this.productDeleteList = productDeleteList;
	}
	public String getProductbuyList() {
		return productbuyList;
	}
	public void setProductbuyList(String productbuyList) {
		this.productbuyList = productbuyList;
	}
	@Override
	public String toString() {
		return "CartDTO [cartId=" + cartId + ", memberId=" + memberId + ", productId=" + productId + ", productCount="
				+ productCount + ", productName=" + productName + ", productPrice=" + productPrice + ", totalPrice="
				+ totalPrice + ", productDeleteList=" + productDeleteList + ", productbuyList=" + productbuyList + "]";
	}
	public CartDTO(int cartId, String memberId, int productId, int productCount, String productName, int productPrice,
			int totalPrice, String productDeleteList, String productbuyList) {
		super();
		this.cartId = cartId;
		this.memberId = memberId;
		this.productId = productId;
		this.productCount = productCount;
		this.productName = productName;
		this.productPrice = productPrice;
		this.totalPrice = totalPrice;
		this.productDeleteList = productDeleteList;
		this.productbuyList = productbuyList;
	}

	}