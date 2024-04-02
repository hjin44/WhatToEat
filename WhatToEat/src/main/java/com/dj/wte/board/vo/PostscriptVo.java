package com.dj.wte.board.vo;

import java.util.Date;

public class PostscriptVo {
	private int postscript_no;
	private int member_no;
	private int recipe_no;
	private String postscript_content;
	private Date postscript_writedate;
	
	public PostscriptVo() {
		super();
	}

	public PostscriptVo(int postscript_no, int member_no, int recipe_no, String postscript_content,
			Date postscript_writedate) {
		super();
		this.postscript_no = postscript_no;
		this.member_no = member_no;
		this.recipe_no = recipe_no;
		this.postscript_content = postscript_content;
		this.postscript_writedate = postscript_writedate;
	}

	public int getPostscript_no() {
		return postscript_no;
	}

	public void setPostscript_no(int postscript_no) {
		this.postscript_no = postscript_no;
	}

	public int getMember_no() {
		return member_no;
	}

	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}

	public int getRecipe_no() {
		return recipe_no;
	}

	public void setRecipe_no(int recipe_no) {
		this.recipe_no = recipe_no;
	}

	public String getPostscript_content() {
		return postscript_content;
	}

	public void setPostscript_content(String postscript_content) {
		this.postscript_content = postscript_content;
	}

	public Date getPostscript_writedate() {
		return postscript_writedate;
	}

	public void setPostscript_writedate(Date postscript_writedate) {
		this.postscript_writedate = postscript_writedate;
	}
	
	
	
}
