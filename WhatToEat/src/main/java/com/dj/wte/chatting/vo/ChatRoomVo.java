package com.dj.wte.chatting.vo;

import java.util.Date;

public class ChatRoomVo {
	
	private int chat_room_no;
	private int member_no;
	private String chat_room_title;
	private int chat_total_people;
	private Date chat_room_open_date;
	private Date chat_room_close_date;
	private String chat_room_status;
	
	public ChatRoomVo() {
		super();
	}

	public ChatRoomVo(int chat_room_no, int member_no, String chat_room_title, int chat_total_people,
			Date chat_room_open_date, Date chat_room_close_date, String chat_room_status) {
		super();
		this.chat_room_no = chat_room_no;
		this.member_no = member_no;
		this.chat_room_title = chat_room_title;
		this.chat_total_people = chat_total_people;
		this.chat_room_open_date = chat_room_open_date;
		this.chat_room_close_date = chat_room_close_date;
		this.chat_room_status = chat_room_status;
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

	public String getChat_room_title() {
		return chat_room_title;
	}

	public void setChat_room_title(String chat_room_title) {
		this.chat_room_title = chat_room_title;
	}

	public int getChat_total_people() {
		return chat_total_people;
	}

	public void setChat_total_people(int chat_total_people) {
		this.chat_total_people = chat_total_people;
	}

	public Date getChat_room_open_date() {
		return chat_room_open_date;
	}

	public void setChat_room_open_date(Date chat_room_open_date) {
		this.chat_room_open_date = chat_room_open_date;
	}

	public Date getChat_room_close_date() {
		return chat_room_close_date;
	}

	public void setChat_room_close_date(Date chat_room_close_date) {
		this.chat_room_close_date = chat_room_close_date;
	}

	public String getChat_room_status() {
		return chat_room_status;
	}

	public void setChat_room_status(String chat_room_status) {
		this.chat_room_status = chat_room_status;
	}
	
	
	

}
