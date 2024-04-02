package com.dj.wte.board.vo;

public class RecipeNationalVo {

	private int national_no;
	private String national_name;
	
	public RecipeNationalVo() {
		super();
	}
	
	public RecipeNationalVo(int national_no, String national_name) {
		super();
		this.national_no = national_no;
		this.national_name = national_name;
	}
	
	public int getNational_no() {
		return national_no;
	}
	public void setNational_no(int national_no) {
		this.national_no = national_no;
	}
	public String getNational_name() {
		return national_name;
	}
	public void setNational_name(String national_name) {
		this.national_name = national_name;
	}

}
