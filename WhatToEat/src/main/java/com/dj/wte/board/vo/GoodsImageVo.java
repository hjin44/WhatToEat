package com.dj.wte.board.vo;

public class GoodsImageVo {
	private int goods_image_no;
	private int goods_no;
	private String goods_image_link;
	
	public GoodsImageVo() {
		super();
	}

	public GoodsImageVo(int goods_image_no, int goods_no, String goods_image_link) {
		super();
		this.goods_image_no = goods_image_no;
		this.goods_no = goods_no;
		this.goods_image_link = goods_image_link;
	}

	public int getGoods_image_no() {
		return goods_image_no;
	}

	public void setGoods_image_no(int goods_image_no) {
		this.goods_image_no = goods_image_no;
	}

	public int getGoods_no() {
		return goods_no;
	}

	public void setGoods_no(int goods_no) {
		this.goods_no = goods_no;
	}

	public String getGoods_image_link() {
		return goods_image_link;
	}

	public void setGoods_image_link(String goods_image_link) {
		this.goods_image_link = goods_image_link;
	}

	
}
