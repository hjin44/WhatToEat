package com.dj.wte.board.vo;

import java.util.Date;

public class FbRepleVo {
	
	private int fb_reple_no;
	private int fb_no;
	private int member_no;
	private String fb_reple_content;
	private Date fb_reple_writedate;
	public FbRepleVo() {
		super();
	}
	public FbRepleVo(int fb_reple_no, int fb_no, int member_no, String fb_reple_content, Date fb_reple_writedate) {
		super();
		this.fb_reple_no = fb_reple_no;
		this.fb_no = fb_no;
		this.member_no = member_no;
		this.fb_reple_content = fb_reple_content;
		this.fb_reple_writedate = fb_reple_writedate;
	}
	public int getFb_reple_no() {
		return fb_reple_no;
	}
	public void setFb_reple_no(int fb_reple_no) {
		this.fb_reple_no = fb_reple_no;
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
	public String getFb_reple_content() {
		return fb_reple_content;
	}
	public void setFb_reple_content(String fb_reple_content) {
		this.fb_reple_content = fb_reple_content;
	}
	public Date getFb_reple_writedate() {
		return fb_reple_writedate;
	}
	public void setFb_reple_writedate(Date fb_reple_writedate) {
		this.fb_reple_writedate = fb_reple_writedate;
	}
	
	
}