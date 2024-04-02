package com.dj.wte.manager.vo;

public class KeepVo {

	private int keep_no;
	private int subgroup_no;
	private String keep_content;
	private String keep_image_link;
	
	public KeepVo() {
		super();
	}
	
	public KeepVo(int keep_no, int subgroup_no, String keep_content, String keep_image_link) {
		super();
		this.keep_no = keep_no;
		this.subgroup_no = subgroup_no;
		this.keep_content = keep_content;
		this.keep_image_link = keep_image_link;
	}
	
	public int getKeep_no() {
		return keep_no;
	}
	public void setKeep_no(int keep_no) {
		this.keep_no = keep_no;
	}
	public int getSubgroup_no() {
		return subgroup_no;
	}
	public void setSubgroup_no(int subgroup_no) {
		this.subgroup_no = subgroup_no;
	}
	public String getKeep_content() {
		return keep_content;
	}
	public void setKeep_content(String keep_content) {
		this.keep_content = keep_content;
	}
	public String getKeep_image_link() {
		return keep_image_link;
	}
	public void setKeep_image_link(String keep_image_link) {
		this.keep_image_link = keep_image_link;
	}
	
	
}
