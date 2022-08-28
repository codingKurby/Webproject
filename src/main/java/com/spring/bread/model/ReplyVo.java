package com.spring.bread.model;

import java.sql.Date;

public class ReplyVo {
	private int replyId;

	private int productId;

	private String memberId;

	private Date regDate;

	@Override
	public String toString() {
		return "ReplyVo [replyId=" + replyId + ", productId=" + productId + ", memberId=" + memberId + ", regDate="
				+ regDate + ", content=" + content + ", rating=" + rating + "]";
	}

	public int getReplyId() {
		return replyId;
	}

	public void setReplyId(int replyId) {
		this.replyId = replyId;
	}

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public double getRating() {
		return rating;
	}

	public void setRating(double rating) {
		this.rating = rating;
	}

	private String content;

	private double rating;
}
