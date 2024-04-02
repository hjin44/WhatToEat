package com.dj.wte.board.vo;

public class RecipeKindVo {

	private int kind_no;
	private String kind_name;
	
	public RecipeKindVo() {
		super();
	}
	
	public RecipeKindVo(int kind_no, String kind_name) {
		super();
		this.kind_no = kind_no;
		this.kind_name = kind_name;
	}
	
	public int getKind_no() {
		return kind_no;
	}
	public void setKind_no(int kind_no) {
		this.kind_no = kind_no;
	}
	public String getKind_name() {
		return kind_name;
	}
	public void setKind_name(String kind_name) {
		this.kind_name = kind_name;
	}

}
