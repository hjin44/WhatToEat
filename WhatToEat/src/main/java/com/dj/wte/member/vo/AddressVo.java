package com.dj.wte.member.vo;

public class AddressVo {
	private int address_no;
	private int address_folder_no;
	private int member_no;
	
	public AddressVo() {
		super();
	}

	public AddressVo(int address_no, int address_folder_no, int member_no) {
		super();
		this.address_no = address_no;
		this.address_folder_no = address_folder_no;
		this.member_no = member_no;
	}

	public int getAddress_no() {
		return address_no;
	}

	public void setAddress_no(int address_no) {
		this.address_no = address_no;
	}

	public int getAddress_folder_no() {
		return address_folder_no;
	}

	public void setAddress_folder_no(int address_folder_no) {
		this.address_folder_no = address_folder_no;
	}

	public int getMember_no() {
		return member_no;
	}

	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}
	
}
