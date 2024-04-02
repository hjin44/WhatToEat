package com.dj.wte.member.vo;

import java.util.Date;

public class MemberVo {
	private int member_no;
	private String member_id;
	private String member_pw;
	private String member_nick;
	private String member_email;
	private String member_gender;
	private String member_birth;
	private String member_profilephoto;
	private Date member_joindate;
	
	public MemberVo() {
		super();
	}

	public MemberVo(int member_no, String member_id, String member_pw, String member_nick, String member_email,
			String member_gender, String member_birth, String member_profilephoto, Date member_joindate) {
		super();
		this.member_no = member_no;
		this.member_id = member_id;
		this.member_pw = member_pw;
		this.member_nick = member_nick;
		this.member_email = member_email;
		this.member_gender = member_gender;
		this.member_birth = member_birth;
		this.member_profilephoto = member_profilephoto;
		this.member_joindate = member_joindate;
	}

	public int getMember_no() {
		return member_no;
	}

	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getMember_pw() {
		return member_pw;
	}

	public void setMember_pw(String member_pw) {
		this.member_pw = member_pw;
	}

	public String getMember_nick() {
		return member_nick;
	}

	public void setMember_nick(String member_nick) {
		this.member_nick = member_nick;
	}

	public String getMember_email() {
		return member_email;
	}

	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}

	public String getMember_gender() {
		return member_gender;
	}

	public void setMember_gender(String member_gender) {
		this.member_gender = member_gender;
	}

	public String getMember_birth() {
		return member_birth;
	}

	public void setMember_birth(String member_birth) {
		this.member_birth = member_birth;
	}

	public String getMember_profilephoto() {
		return member_profilephoto;
	}

	public void setMember_profilephoto(String member_profilephoto) {
		this.member_profilephoto = member_profilephoto;
	}

	public Date getMember_joindate() {
		return member_joindate;
	}

	public void setMember_joindate(Date member_joindate) {
		this.member_joindate = member_joindate;
	}
	
}
