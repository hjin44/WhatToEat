package com.dj.wte.board.vo;

public class GoodsLikeVo {
	private int goods_like_no;
	private int goods_no;
	private int member_no;
	
	public GoodsLikeVo() {
		super();
	}

	public GoodsLikeVo(int goods_like_no, int goods_no, int member_no) {
		super();
		this.goods_like_no = goods_like_no;
		this.goods_no = goods_no;
		this.member_no = member_no;
	}

	public int getGoods_like_no() {
		return goods_like_no;
	}

	public void setGoods_like_no(int goods_like_no) {
		this.goods_like_no = goods_like_no;
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
	
	
	
}
