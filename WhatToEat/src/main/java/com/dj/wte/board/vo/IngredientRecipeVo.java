package com.dj.wte.board.vo;

public class IngredientRecipeVo {

	private int ingredient_recipe_no;
	private int recipe_no;
	private int subgroup_no;
	private String ingredient_recipe_quantity;
	
	public IngredientRecipeVo() {
		super();
	}
	
	public IngredientRecipeVo(int ingredient_recipe_no, int recipe_no, int subgroup_no,
			String ingredient_recipe_quantity) {
		super();
		this.ingredient_recipe_no = ingredient_recipe_no;
		this.recipe_no = recipe_no;
		this.subgroup_no = subgroup_no;
		this.ingredient_recipe_quantity = ingredient_recipe_quantity;
	}
	
	public int getIngredient_recipe_no() {
		return ingredient_recipe_no;
	}
	public void setIngredient_recipe_no(int ingredient_recipe_no) {
		this.ingredient_recipe_no = ingredient_recipe_no;
	}
	public int getRecipe_no() {
		return recipe_no;
	}
	public void setRecipe_no(int recipe_no) {
		this.recipe_no = recipe_no;
	}
	public int getSubgroup_no() {
		return subgroup_no;
	}
	public void setSubgroup_no(int subgroup_no) {
		this.subgroup_no = subgroup_no;
	}
	public String getIngredient_recipe_quantity() {
		return ingredient_recipe_quantity;
	}
	public void setIngredient_recipe_quantity(String ingredient_recipe_quantity) {
		this.ingredient_recipe_quantity = ingredient_recipe_quantity;
	}
	
}
