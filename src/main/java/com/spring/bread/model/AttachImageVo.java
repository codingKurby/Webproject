package com.spring.bread.model;

public class AttachImageVo {
	
	
	/* 경로 */
	private String uploadPath;
	
	/* 파일 이름 */
	private String fileName;
	
	/* 상품 id */
	private int productId;

	public String getUploadPath() {
		return uploadPath;
	}

	public void setUploadPath(String uploadPath) {
		this.uploadPath = uploadPath;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	@Override
	public String toString() {
		return "AttachImageVo [uploadPath=" + uploadPath + ", fileName=" + fileName + ", productId=" + productId + "]";
	}


	
}
