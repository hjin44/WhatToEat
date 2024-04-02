package com.dj.wte.board.vo;

import java.util.Date;

public class RecipeVo {
	
	private int recipe_no;
	private int member_no;
	private int national_no;
	private int kind_no;
	private String recipe_title;
	private String recipe_mainphoto;
	private String recipe_sauce;
	private int recipe_people;
	private int recipe_time;
	private int recipe_readcount;
	private Date recipe_date;
	
	public RecipeVo() {
		super();
	}
	
	public RecipeVo(int recipe_no, int member_no, int national_no, int kind_no, String recipe_title,
			String recipe_mainphoto, String recipe_sauce, int recipe_people, int recipe_time, int recipe_readcount,
			Date recipe_date) {
		super();
		this.recipe_no = recipe_no;
		this.member_no = member_no;
		this.national_no = national_no;
		this.kind_no = kind_no;
		this.recipe_title = recipe_title;
		this.recipe_mainphoto = recipe_mainphoto;
		this.recipe_sauce = recipe_sauce;
		this.recipe_people = recipe_people;
		this.recipe_time = recipe_time;
		this.recipe_readcount = recipe_readcount;
		this.recipe_date = recipe_date;
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
	public int getNational_no() {
		return national_no;
	}
	public void setNational_no(int national_no) {
		this.national_no = national_no;
	}
	public int getKind_no() {
		return kind_no;
	}
	public void setKind_no(int kind_no) {
		this.kind_no = kind_no;
	}
	public String getRecipe_title() {
		return recipe_title;
	}
	public void setRecipe_title(String recipe_title) {
		this.recipe_title = recipe_title;
	}
	public String getRecipe_mainphoto() {
		return recipe_mainphoto;
	}
	public void setRecipe_mainphoto(String recipe_mainphoto) {
		this.recipe_mainphoto = recipe_mainphoto;
	}
	public String getRecipe_sauce() {
		return recipe_sauce;
	}
	public void setRecipe_sauce(String recipe_sauce) {
		this.recipe_sauce = recipe_sauce;
	}
	public int getRecipe_people() {
		return recipe_people;
	}
	public void setRecipe_people(int recipe_people) {
		this.recipe_people = recipe_people;
	}
	public int getRecipe_time() {
		return recipe_time;
	}
	public void setRecipe_time(int recipe_time) {
		this.recipe_time = recipe_time;
	}
	public int getRecipe_readcount() {
		return recipe_readcount;
	}
	public void setRecipe_readcount(int recipe_readcount) {
		this.recipe_readcount = recipe_readcount;
	}
	public Date getRecipe_date() {
		return recipe_date;
	}
	public void setRecipe_date(Date recipe_date) {
		this.recipe_date = recipe_date;
	}
}
