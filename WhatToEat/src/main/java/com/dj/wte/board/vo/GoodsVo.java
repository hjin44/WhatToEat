package com.dj.wte.board.vo;

import java.util.Date;

public class GoodsVo {
	private int goods_no;
	private int member_no;
	private String goods_name;
	private int goods_price;
	private String goods_info;
	private int goods_amount;
	private int goods_readcount;
	private Date goods_registdate;
	
	public GoodsVo() {
		super();
	}

	public GoodsVo(int goods_no, int member_no, String goods_name, int goods_price, String goods_info, int goods_amount,
			int goods_readcount, Date goods_registdate) {
		super();
		this.goods_no = goods_no;
		this.member_no = member_no;
		this.goods_name = goods_name;
		this.goods_price = goods_price;
		this.goods_info = goods_info;
		this.goods_amount = goods_amount;
		this.goods_readcount = goods_readcount;
		this.goods_registdate = goods_registdate;
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

	public String getGoods_name() {
		return goods_name;
	}

	public void setGoods_name(String goods_name) {
		this.goods_name = goods_name;
	}

	public int getGoods_price() {
		return goods_price;
	}

	public void setGoods_price(int goods_price) {
		this.goods_price = goods_price;
	}

	public String getGoods_info() {
		return goods_info;
	}

	public void setGoods_info(String goods_info) {
		this.goods_info = goods_info;
	}

	public int getGoods_amount() {
		return goods_amount;
	}

	public void setGoods_amount(int goods_amount) {
		this.goods_amount = goods_amount;
	}

	public int getGoods_readcount() {
		return goods_readcount;
	}

	public void setGoods_readcount(int goods_readcount) {
		this.goods_readcount = goods_readcount;
	}
	
	public Date getGoods_registdate() {
		return goods_registdate;
	}

	public void setGoods_registdate(Date goods_registdate) {
		this.goods_registdate = goods_registdate;
	}
	
	
}
