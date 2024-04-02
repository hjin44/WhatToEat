package com.dj.wte.board.vo;

import java.util.Date;

public class GoodsRepleVo {
	private int goods_reply_no;
	private int goods_no;
	private int member_no;
	private String goods_reply_comment;
	private Date goods_reply_writedate;
	
	public GoodsRepleVo() {
		super();
	}

	public GoodsRepleVo(int goods_reply_no, int goods_no, int member_no, String goods_reply_comment,
			Date goods_reply_writedate) {
		super();
		this.goods_reply_no = goods_reply_no;
		this.goods_no = goods_no;
		this.member_no = member_no;
		this.goods_reply_comment = goods_reply_comment;
		this.goods_reply_writedate = goods_reply_writedate;
	}

	public int getGoods_reply_no() {
		return goods_reply_no;
	}

	public void setGoods_reply_no(int goods_reply_no) {
		this.goods_reply_no = goods_reply_no;
	}

	public int getGoods_no() {
		return goods_no;
	}

	public void setGoods_no(int goods_no) {
		this.goods_no = goods_no;
	}

	public int getMember_no() {
		return member_no;
	}

	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}

	public String getGoods_reply_comment() {
		return goods_reply_comment;
	}

	public void setGoods_reply_comment(String goods_reply_comment) {
		this.goods_reply_comment = goods_reply_comment;
	}

	public Date getGoods_reply_writedate() {
		return goods_reply_writedate;
	}

	public void setGoods_reply_writedate(Date goods_reply_writedate) {
		this.goods_reply_writedate = goods_reply_writedate;
	}

	
	
}
