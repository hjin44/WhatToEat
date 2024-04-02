package com.dj.wte.member.vo;

public class AddressFolderVo {
	private int address_folder_no;
	private int member_no;
	private String address_folder_name;
	
	public AddressFolderVo() {
		super();
	}

	public AddressFolderVo(int address_folder_no, int member_no, String address_folder_name) {
		super();
		this.address_folder_no = address_folder_no;
		this.member_no = member_no;
		this.address_folder_name = address_folder_name;
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

	public String getAddress_folder_name() {
		return address_folder_name;
	}

	public void setAddress_folder_name(String address_folder_name) {
		this.address_folder_name = address_folder_name;
	}
	
}
