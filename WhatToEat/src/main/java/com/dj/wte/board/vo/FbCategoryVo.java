package com.dj.wte.board.vo;

public class FbCategoryVo {
	
	private int fb_category_no;
	private String fb_category_name;
	public FbCategoryVo() {
		super();
	}
	public FbCategoryVo(int fb_category_no, String fb_category_name) {
		super();
		this.fb_category_no = fb_category_no;
		this.fb_category_name = fb_category_name;
	}
	public int getFb_category_no() {
		return fb_category_no;
	}
	public void setFb_category_no(int fb_category_no) {
		this.fb_category_no = fb_category_no;
	}
	public String getFb_category_name() {
		return fb_category_name;
	}
	public void setFb_category_name(String fb_category_name) {
		this.fb_category_name = fb_category_name;
	}
	
}	
	
