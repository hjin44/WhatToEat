package com.dj.wte.customer.vo;

import java.util.Date;

public class AskVo {

	private int ask_no;
	private int member_no;
	private String ask_title;
	private String ask_content;
	private String ask_check;
	private Date ask_writedate;
	
	public AskVo() {
		super();
	}

	public AskVo(int ask_no, int member_no, String ask_title, String ask_content, String ask_check,
			Date ask_writedate) {
		super();
		this.ask_no = ask_no;
		this.member_no = member_no;
		this.ask_title = ask_title;
		this.ask_content = ask_content;
		this.ask_check = ask_check;
		this.ask_writedate = ask_writedate;
	}

	public int getAsk_no() {
		return ask_no;
	}

	public void setAsk_no(int ask_no) {
		this.ask_no = ask_no;
	}

	public int getMember_no() {
		return member_no;
	}

	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}

	public String getAsk_title() {
		return ask_title;
	}

	public void setAsk_title(String ask_title) {
		this.ask_title = ask_title;
	}

	public String getAsk_content() {
		return ask_content;
	}

	public void setAsk_content(String ask_content) {
		this.ask_content = ask_content;
	}

	public String getAsk_check() {
		return ask_check;
	}

	public void setAsk_check(String ask_check) {
		this.ask_check = ask_check;
	}

	public Date getAsk_writedate() {
		return ask_writedate;
	}

	public void setAsk_writedate(Date ask_writedate) {
		this.ask_writedate = ask_writedate;
	}
	
	
	
}
