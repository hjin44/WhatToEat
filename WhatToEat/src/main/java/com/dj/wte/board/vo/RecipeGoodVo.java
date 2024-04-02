package com.dj.wte.board.vo;

import java.util.Date;

public class RecipeGoodVo {

	private int recipe_good_no;
	private int member_no;
	private int recipe_no;
	private Date recipe_good_checkdate;
	
	public RecipeGoodVo() {
		super();
	}
	
	public RecipeGoodVo(int recipe_good_no, int member_no, int recipe_no, Date recipe_good_checkdate) {
		super();
		this.recipe_good_no = recipe_good_no;
		this.member_no = member_no;
		this.recipe_no = recipe_no;
		this.recipe_good_checkdate = recipe_good_checkdate;
	}
	
	public int getRecipe_good_no() {
		return recipe_good_no;
	}
	public void setRecipe_good_no(int recipe_good_no) {
		this.recipe_good_no = recipe_good_no;
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
	public Date getRecipe_good_checkdate() {
		return recipe_good_checkdate;
	}
	public void setRecipe_good_checkdate(Date recipe_good_checkdate) {
		this.recipe_good_checkdate = recipe_good_checkdate;
	}
}
