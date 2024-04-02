package com.dj.wte.board.vo;

public class PostscriptImageVo {
	private int postscript_image_no;
	private int postscript_no;
	private String postscript_image_link;
	
	public PostscriptImageVo() {
		super();
	}

	public PostscriptImageVo(int postscript_image_no, int postscript_no, String postscript_image_link) {
		super();
		this.postscript_image_no = postscript_image_no;
		this.postscript_no = postscript_no;
		this.postscript_image_link = postscript_image_link;
	}

	public int getPostscript_image_no() {
		return postscript_image_no;
	}

	public void setPostscript_image_no(int postscript_image_no) {
		this.postscript_image_no = postscript_image_no;
	}

	public int getPostscript_no() {
		return postscript_no;
	}

	public void setPostscript_no(int postscript_no) {
		this.postscript_no = postscript_no;
	}

	public String getPostscript_image_link() {
		return postscript_image_link;
	}

	public void setPostscript_image_link(String postscript_image_link) {
		this.postscript_image_link = postscript_image_link;
	}
	
	
	
}
