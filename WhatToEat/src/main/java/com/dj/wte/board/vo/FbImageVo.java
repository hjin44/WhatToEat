package com.dj.wte.board.vo;

public class FbImageVo {
	
	private int fbimage_no;
	private int fb_no;
	private String fbimage_link;
	
	public FbImageVo() {
		super();
	}
	public FbImageVo(int fbimage_no, int fb_no, String fbimage_link) {
		super();
		this.fbimage_no = fbimage_no;
		this.fb_no = fb_no;
		this.fbimage_link = fbimage_link;
	}
	public int getFbimage_no() {
		return fbimage_no;
	}
	public void setFbimage_no(int fbimage_no) {
		this.fbimage_no = fbimage_no;
	}
	public int getFb_no() {
		return fb_no;
	}
	public void setFb_no(int fb_no) {
		this.fb_no = fb_no;
	}
	public String getFbimage_link() {
		return fbimage_link;
	}
	public void setFbimage_link(String fbimage_link) {
		this.fbimage_link = fbimage_link;
	}
	
	
}