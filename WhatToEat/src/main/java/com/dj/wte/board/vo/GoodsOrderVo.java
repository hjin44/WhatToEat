package com.dj.wte.board.vo;

import java.util.Date;

public class GoodsOrderVo {
	private int order_no;
	private int goods_no;
	private int member_no;
	private String receiver_phone;
	private String receiver_name;
	private String receiver_address1;
	private String receiver_address2;
	private String receiver_address3;
	private int order_amount;
	private int order_price;
	private Date order_date;
	
	public GoodsOrderVo() {
		super();
	}

	public GoodsOrderVo(int order_no, int goods_no, int member_no, String receiver_phone, String receiver_name,
			String receiver_address1, String receiver_address2, String receiver_address3, int order_amount, 
			int order_price, Date order_date) {
		super();
		this.order_no = order_no;
		this.goods_no = goods_no;
		this.member_no = member_no;
		this.receiver_phone = receiver_phone;
		this.receiver_name = receiver_name;
		this.receiver_address1 = receiver_address1;
		this.receiver_address2 = receiver_address2;
		this.receiver_address3 = receiver_address3;
		this.order_amount = order_amount;
		this.order_price = order_price;
		this.order_date = order_date;
	}

	public int getOrder_no() {
		return order_no;
	}

	public void setOrder_no(int order_no) {
		this.order_no = order_no;
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

	public String getReceiver_phone() {
		return receiver_phone;
	}

	public void setReceiver_phone(String receiver_phone) {
		this.receiver_phone = receiver_phone;
	}

	public String getReceiver_name() {
		return receiver_name;
	}

	public void setReceiver_name(String receiver_name) {
		this.receiver_name = receiver_name;
	}

	public String getReceiver_address1() {
		return receiver_address1;
	}

	public void setReceiver_address1(String receiver_address1) {
		this.receiver_address1 = receiver_address1;
	}
	
	public String getReceiver_address2() {
		return receiver_address2;
	}

	public void setReceiver_address2(String receiver_address2) {
		this.receiver_address2 = receiver_address2;
	}
	
	public String getReceiver_address3() {
		return receiver_address3;
	}

	public void setReceiver_address3(String receiver_address3) {
		this.receiver_address3 = receiver_address3;
	}
	
	public int getOrder_amount() {
		return order_amount;
	}

	public void setOrder_amount(int order_amount) {
		this.order_amount = order_amount;
	}

	public int getOrder_price() {
		return order_price;
	}

	public void setOrder_price(int order_price) {
		this.order_price = order_price;
	}

	public Date getOrder_date() {
		return order_date;
	}

	public void setOrder_date(Date order_date) {
		this.order_date = order_date;
	}
	
}
