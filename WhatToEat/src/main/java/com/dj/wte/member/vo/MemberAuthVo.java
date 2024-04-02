package com.dj.wte.member.vo;

import java.util.Date;

public class MemberAuthVo {
	
	private int auth_no;
	private int member_no;
	private String member_email;
	private int auth_key;
	private String auth_complete;
	private Date auth_date;
	
	public MemberAuthVo() {
		super();
	}

	public MemberAuthVo(int auth_no, int member_no, String member_email, int auth_key, String auth_complete,
			Date auth_date) {
		super();
		this.auth_no = auth_no;
		this.member_no = member_no;
		this.member_email = member_email;
		this.auth_key = auth_key;
		this.auth_complete = auth_complete;
		this.auth_date = auth_date;
	}

	public int getAuth_no() {
		return auth_no;
	}

	public void setAuth_no(int auth_no) {
		this.auth_no = auth_no;
	}

	public int getMember_no() {
		return member_no;
	}

	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}

	public String getMember_email() {
		return member_email;
	}

	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}

	public int getAuth_key() {
		return auth_key;
	}

	public void setAuth_key(int auth_key) {
		this.auth_key = auth_key;
	}

	public String getAuth_complete() {
		return auth_complete;
	}

	public void setAuth_complete(String auth_complete) {
		this.auth_complete = auth_complete;
	}

	public Date getAuth_date() {
		return auth_date;
	}

	public void setAuth_date(Date auth_date) {
		this.auth_date = auth_date;
	}
	
}
