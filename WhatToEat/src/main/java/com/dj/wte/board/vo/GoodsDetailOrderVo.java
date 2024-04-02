package com.dj.wte.board.vo;

public class GoodsDetailOrderVo {
	private int detail_order_no;
	private int order_no;
	private int basket_no;
	
	public GoodsDetailOrderVo() {
		super();
	}

	public GoodsDetailOrderVo(int detail_order_no, int order_no, int basket_no) {
		super();
		this.detail_order_no = detail_order_no;
		this.order_no = order_no;
		this.basket_no = basket_no;
	}

	public int getDetail_order_no() {
		return detail_order_no;
	}

	public void setDetail_order_no(int detail_order_no) {
		this.detail_order_no = detail_order_no;
	}

	public int getOrder_no() {
		return order_no;
	}

	public void setOrder_no(int order_no) {
		this.order_no = order_no;
	}

	public int getBasket_no() {
		return basket_no;
	}

	public void setBasket_no(int basket_no) {
		this.basket_no = basket_no;
	}
	
}
