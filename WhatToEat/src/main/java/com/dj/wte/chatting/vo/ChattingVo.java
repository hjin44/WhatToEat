package com.dj.wte.chatting.vo;

import java.util.Date;

public class ChattingVo {
	
	private int chatting_message_no;
	private int chat_room_no;
	private int chat_attend_member_no;
	private String chatting_content;
	private Date chatting_date;
	
	public ChattingVo() {
		super();
	}

	public ChattingVo(int chatting_message_no, int chat_room_no, int chat_attend_member_no, String chatting_content,
			Date chatting_date) {
		super();
		this.chatting_message_no = chatting_message_no;
		this.chat_room_no = chat_room_no;
		this.chat_attend_member_no = chat_attend_member_no;
		this.chatting_content = chatting_content;
		this.chatting_date = chatting_date;
	}

	public int getChatting_message_no() {
		return chatting_message_no;
	}

	public void setChatting_message_no(int chatting_message_no) {
		this.chatting_message_no = chatting_message_no;
	}

	public int getChat_room_no() {
		return chat_room_no;
	}

	public void setChat_room_no(int chat_room_no) {
		this.chat_room_no = chat_room_no;
	}

	public int getChat_attend_member_no() {
		return chat_attend_member_no;
	}

	public void setChat_attend_member_no(int chat_attend_member_no) {
		this.chat_attend_member_no = chat_attend_member_no;
	}

	public String getChatting_content() {
		return chatting_content;
	}

	public void setChatting_content(String chatting_content) {
		this.chatting_content = chatting_content;
	}

	public Date getChatting_date() {
		return chatting_date;
	}

	public void setChatting_date(Date chatting_date) {
		this.chatting_date = chatting_date;
	}

	

}
