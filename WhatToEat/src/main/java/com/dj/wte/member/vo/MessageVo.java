package com.dj.wte.member.vo;

import java.util.Date;

public class MessageVo {
	private int message_no;
	private int sender_no;
	private int target_no;
	private String message_content;
	private String open_confirm;
	private Date send_date;
	
	public MessageVo() {
		super();
	}

	public MessageVo(int message_no, int sender_no, int target_no, String message_content, String open_confirm,
			Date send_date) {
		super();
		this.message_no = message_no;
		this.sender_no = sender_no;
		this.target_no = target_no;
		this.message_content = message_content;
		this.open_confirm = open_confirm;
		this.send_date = send_date;
	}

	public int getMessage_no() {
		return message_no;
	}

	public void setMessage_no(int message_no) {
		this.message_no = message_no;
	}

	public int getSender_no() {
		return sender_no;
	}

	public void setSender_no(int sender_no) {
		this.sender_no = sender_no;
	}

	public int getTarget_no() {
		return target_no;
	}

	public void setTarget_no(int target_no) {
		this.target_no = target_no;
	}

	public String getMessage_content() {
		return message_content;
	}

	public void setMessage_content(String message_content) {
		this.message_content = message_content;
	}

	public String getOpen_confirm() {
		return open_confirm;
	}

	public void setOpen_confirm(String open_confirm) {
		this.open_confirm = open_confirm;
	}

	public Date getSend_date() {
		return send_date;
	}

	public void setSend_date(Date send_date) {
		this.send_date = send_date;
	}
	
}