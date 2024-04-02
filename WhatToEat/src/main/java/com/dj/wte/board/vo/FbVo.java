package com.dj.wte.board.vo;

import java.util.Date;

public class FbVo {
	
	private int fb_no;
	private int member_no;
	private int fb_category_no;
	private String fb_title;
	private String fb_content;
	private int fb_readcount;
	private Date fb_writedate;
	public FbVo() {
		super();
	}
	public FbVo(int fb_no, int member_no, int fb_category_no, String fb_title, String fb_content, int fb_readcount,
			Date fb_writedate) {
		super();
		this.fb_no = fb_no;
		this.member_no = member_no;
		this.fb_category_no = fb_category_no;
		this.fb_title = fb_title;
		this.fb_content = fb_content;
		this.fb_readcount = fb_readcount;
		this.fb_writedate = fb_writedate;
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
	public int getFb_category_no() {
		return fb_category_no;
	}
	public void setFb_category_no(int fb_category_no) {
		this.fb_category_no = fb_category_no;
	}
	public String getFb_title() {
		return fb_title;
	}
	public void setFb_title(String fb_title) {
		this.fb_title = fb_title;
	}
	public String getFb_content() {
		return fb_content;
	}
	public void setFb_content(String fb_content) {
		this.fb_content = fb_content;
	}
	public int getFb_readcount() {
		return fb_readcount;
	}
	public void setFb_readcount(int fb_readcount) {
		this.fb_readcount = fb_readcount;
	}
	public Date getFb_writedate() {
		return fb_writedate;
	}
	public void setFb_writedate(Date fb_writedate) {
		this.fb_writedate = fb_writedate;
	}
	
	
}