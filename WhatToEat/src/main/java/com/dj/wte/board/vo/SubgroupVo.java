package com.dj.wte.board.vo;

public class SubgroupVo {

	private int subgroup_no;
	private int group_no;
	private int member_no;
	private String subgroup_name;
	
	public SubgroupVo() {
		super();
	}

	public SubgroupVo(int subgroup_no, int group_no, int member_no, String subgroup_name) {
		super();
		this.subgroup_no = subgroup_no;
		this.group_no = group_no;
		this.member_no = member_no;
		this.subgroup_name = subgroup_name;
	}

	public int getSubgroup_no() {
		return subgroup_no;
	}

	public void setSubgroup_no(int subgroup_no) {
		this.subgroup_no = subgroup_no;
	}

	public int getGroup_no() {
		return group_no;
	}

	public void setGroup_no(int group_no) {
		this.group_no = group_no;
	}

	public int getMember_no() {
		return member_no;
	}

	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}

	public String getSubgroup_name() {
		return subgroup_name;
	}

	public void setSubgroup_name(String subgroup_name) {
		this.subgroup_name = subgroup_name;
	}
	
}
