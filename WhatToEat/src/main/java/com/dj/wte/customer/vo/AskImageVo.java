package com.dj.wte.customer.vo;

public class AskImageVo {

	private int image_no;
	private int ask_no;
	private String image_link;
	
	public AskImageVo() {
		super();
	}

	public AskImageVo(int image_no, int ask_no, String image_link) {
		super();
		this.image_no = image_no;
		this.ask_no = ask_no;
		this.image_link = image_link;
	}

	public int getImage_no() {
		return image_no;
	}

	public void setImage_no(int image_no) {
		this.image_no = image_no;
	}

	public int getAsk_no() {
		return ask_no;
	}

	public void setAsk_no(int ask_no) {
		this.ask_no = ask_no;
	}

	public String getImage_link() {
		return image_link;
	}

	public void setImage_link(String image_link) {
		this.image_link = image_link;
	}
	
	
}
