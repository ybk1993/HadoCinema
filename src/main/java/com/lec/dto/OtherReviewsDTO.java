package com.lec.dto;

import java.util.Date;

public class OtherReviewsDTO {

	private String rMemId2;
	private String rMovieName2;
	private int reviewUid2;
	private Date reviewRegdate2;
	private String reviewContent2;
	private String reviewGrade2;
	private int reviewHeart2;
	
	
	public OtherReviewsDTO(String rMovieName2, String reviewContent2, String reviewGrade2) {
		super();
		this.rMovieName2 = rMovieName2;
		this.reviewContent2 = reviewContent2;
		this.reviewGrade2 = reviewGrade2;
	}
	public String getrMemId2() {
		return rMemId2;
	}
	public void setrMemId2(String rMemId2) {
		this.rMemId2 = rMemId2;
	}
	public String getrMovieName2() {
		return rMovieName2;
	}
	public void setrMovieName2(String rMovieName2) {
		this.rMovieName2 = rMovieName2;
	}
	public int getReviewUid2() {
		return reviewUid2;
	}
	public void setReviewUid2(int reviewUid2) {
		this.reviewUid2 = reviewUid2;
	}
	public Date getReviewRegdate2() {
		return reviewRegdate2;
	}
	public void setReviewRegdate2(Date reviewRegdate2) {
		this.reviewRegdate2 = reviewRegdate2;
	}
	public String getReviewContent2() {
		return reviewContent2;
	}
	public void setReviewContent2(String reviewContent2) {
		this.reviewContent2 = reviewContent2;
	}
	public String getReviewGrade2() {
		return reviewGrade2;
	}
	public void setReviewGrade2(String reviewGrade2) {
		this.reviewGrade2 = reviewGrade2;
	}
	public int getReviewHeart2() {
		return reviewHeart2;
	}
	public void setReviewHeart2(int reviewHeart2) {
		this.reviewHeart2 = reviewHeart2;
	}
	@Override
	public String toString() {
		return "OtherReviewsDTO [rMemId2=" + rMemId2 + ", rMovieName2=" + rMovieName2 + ", reviewUid2=" + reviewUid2
				+ ", reviewRegdate2=" + reviewRegdate2 + ", reviewContent2=" + reviewContent2 + ", reviewGrade2="
				+ reviewGrade2 + ", reviewHeart2=" + reviewHeart2 + "]";
	}
	
	
}
