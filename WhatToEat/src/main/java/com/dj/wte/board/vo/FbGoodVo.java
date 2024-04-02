package com.dj.wte.board.vo;

public class FbGoodVo {
	private int fb_good_no;
	private int fb_no;
	private int member_no;
	public FbGoodVo() {
		super();
	}
	public FbGoodVo(int fb_good_no, int fb_no, int member_no) {
		super();
		this.fb_good_no = fb_good_no;
		this.fb_no = fb_no;
		this.member_no = member_no;
	}
	public int getFb_good_no() {
		return fb_good_no;
	}
	public void setFb_good_no(int fb_good_no) {
		this.fb_good_no = fb_good_no;
	}
	public int getFb_no() {
		return fb_no;
	}
	public void setFb_no(int fb_no) {
		this.fb_no = fb_no;
	}
	public int getMember_no() {
		return member_no;
	}
	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}
	
	
	
	
}