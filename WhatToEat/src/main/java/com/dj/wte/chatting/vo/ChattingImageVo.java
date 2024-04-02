package com.dj.wte.chatting.vo;

import java.util.Date;

public class ChattingImageVo {
	
	private int chatting_image_no;
	private int chatting_message_no;
	private String chatting_image_link;
	private Date chatting_image_date;
	
	public ChattingImageVo() {
		super();
	}

	public ChattingImageVo(int chatting_image_no, int chatting_message_no, String chatting_image_link,
			Date chatting_image_date) {
		super();
		this.chatting_image_no = chatting_image_no;
		this.chatting_message_no = chatting_message_no;
		this.chatting_image_link = chatting_image_link;
		this.chatting_image_date = chatting_image_date;
	}

	public int getChatting_image_no() {
		return chatting_image_no;
	}

	public void setChatting_image_no(int chatting_image_no) {
		this.chatting_image_no = chatting_image_no;
	}

	public int getChatting_message_no() {
		return chatting_message_no;
	}

	public void setChatting_message_no(int chatting_message_no) {
		this.chatting_message_no = chatting_message_no;
	}

	public String getChatting_image_link() {
		return chatting_image_link;
	}

	public void setChatting_image_link(String chatting_image_link) {
		this.chatting_image_link = chatting_image_link;
	}

	public Date getChatting_image_date() {
		return chatting_image_date;
	}

	public void setChatting_image_date(Date chatting_image_date) {
		this.chatting_image_date = chatting_image_date;
	}
	
	
	

}
