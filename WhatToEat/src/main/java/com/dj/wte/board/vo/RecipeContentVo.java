package com.dj.wte.board.vo;

public class RecipeContentVo {

	private int recipe_content_no;
	private int recipe_no;
	private String recipe_content;
	private String recipe_image_link;
	
	public RecipeContentVo() {
		super();
	}
	
	public RecipeContentVo(int recipe_content_no, int recipe_no, String recipe_content, String recipe_image_link) {
		super();
		this.recipe_content_no = recipe_content_no;
		this.recipe_no = recipe_no;
		this.recipe_content = recipe_content;
		this.recipe_image_link = recipe_image_link;
	}
	
	public int getRecipe_content_no() {
		return recipe_content_no;
	}
	public void setRecipe_content_no(int recipe_content_no) {
		this.recipe_content_no = recipe_content_no;
	}
	public int getRecipe_no() {
		return recipe_no;
	}
	public void setRecipe_no(int recipe_no) {
		this.recipe_no = recipe_no;
	}
	public String getRecipe_content() {
		return recipe_content;
	}
	public void setRecipe_content(String recipe_content) {
		this.recipe_content = recipe_content;
	}
	public String getRecipe_image_link() {
		return recipe_image_link;
	}
	public void setRecipe_image_link(String recipe_image_link) {
		this.recipe_image_link = recipe_image_link;
	}
}
