package com.dj.wte.chatting.vo;

import java.util.Date;

public class AttendVo {

	private int chat_attend_member_no;
	private int chat_room_no;
	private int member_no;
	private String chat_room_owner;
	private Date chat_attend_date;
	private Date chat_out_date;
	
	public AttendVo() {
		super();
	}

	public AttendVo(int chat_attend_member_no, int chat_room_no, int member_no, String chat_room_owner,
			Date chat_attend_date, Date chat_out_date) {
		super();
		this.chat_attend_member_no = chat_attend_member_no;
		this.chat_room_no = chat_room_no;
		this.member_no = member_no;
		this.chat_room_owner = chat_room_owner;
		this.chat_attend_date = chat_attend_date;
		this.chat_out_date = chat_out_date;
	}

	public int getChat_attend_member_no() {
		return chat_attend_member_no;
	}

	public void setChat_attend_member_no(int chat_attend_member_no) {
		this.chat_attend_member_no = chat_attend_member_no;
	}

	public int getChat_room_no() {
		return chat_room_no;
	}

	public void setChat_room_no(int chat_room_no) {
		this.chat_room_no = chat_room_no;
	}

	public int getMember_no() {
		return member_no;
	}

	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}

	public String getChat_room_owner() {
		return chat_room_owner;
	}

	public void setChat_room_owner(String chat_room_owner) {
		this.chat_room_owner = chat_room_owner;
	}

	public Date getChat_attend_date() {
		return chat_attend_date;
	}

	public void setChat_attend_date(Date chat_attend_date) {
		this.chat_attend_date = chat_attend_date;
	}

	public Date getChat_out_date() {
		return chat_out_date;
	}

	public void setChat_out_date(Date chat_out_date) {
		this.chat_out_date = chat_out_date;
	}
	
	
	
}
