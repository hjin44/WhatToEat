package com.dj.wte.board.vo;

public class GoodsBasketVo {
	private int basket_no; 
	private int member_no;
	private int goods_no;
	private int basket_amount;
	
	public GoodsBasketVo() {
		super();
	}

	public GoodsBasketVo(int basket_no, int member_no, int goods_no, int basket_amount) {
		super();
		this.basket_no = basket_no;
		this.member_no = member_no;
		this.goods_no = goods_no;
		this.basket_amount = basket_amount;
	}

	public int getBasket_no() {
		return basket_no;
	}

	public void setBasket_no(int basket_no) {
		this.basket_no = basket_no;
	}

	public int getMember_no() {
		return member_no;
	}

	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}

	public int getGoods_no() {
		return goods_no;
	}

	public void setGoods_no(int goods_no) {
		this.goods_no = goods_no;
	}
	
	public int getBasket_amount() {
		return basket_amount;
	}

	public void setBasket_amount(int basket_amount) {
		this.basket_amount = basket_amount;
	}
	
}
