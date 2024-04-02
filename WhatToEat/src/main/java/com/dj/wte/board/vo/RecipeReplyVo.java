package com.dj.wte.board.vo;

import java.util.Date;

public class RecipeReplyVo {

	private int recipe_reply_no;
	private int recipe_no;
	private int member_no;
	private String recipe_reply_comment;
	private Date recipe_reply_writedate;
	
	public RecipeReplyVo() {
		super();
	}
	
	public RecipeReplyVo(int recipe_reply_no, int recipe_no, int member_no, String recipe_reply_comment,
			Date recipe_reply_writedate) {
		super();
		this.recipe_reply_no = recipe_reply_no;
		this.recipe_no = recipe_no;
		this.member_no = member_no;
		this.recipe_reply_comment = recipe_reply_comment;
		this.recipe_reply_writedate = recipe_reply_writedate;
	}
	
	public int getRecipe_reply_no() {
		return recipe_reply_no;
	}
	public void setRecipe_reply_no(int recipe_reply_no) {
		this.recipe_reply_no = recipe_reply_no;
	}
	public int getRecipe_no() {
		return recipe_no;
	}
	public void setRecipe_no(int recipe_no) {
		this.recipe_no = recipe_no;
	}
	public int getMember_no() {
		return member_no;
	}
	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}
	public String getRecipe_reply_comment() {
		return recipe_reply_comment;
	}
	public void setRecipe_reply_comment(String recipe_reply_comment) {
		this.recipe_reply_comment = recipe_reply_comment;
	}
	public Date getRecipe_reply_writedate() {
		return recipe_reply_writedate;
	}
	public void setRecipe_reply_writedate(Date recipe_reply_writedate) {
		this.recipe_reply_writedate = recipe_reply_writedate;
	}
	
}
