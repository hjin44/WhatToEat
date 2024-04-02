package com.dj.wte.manager.vo;

import java.util.Date;

public class AnswerVo {

	private int answer_no;
	private int assign_no;
	private String answer_content;
	private Date answer_writedate;
	
	public AnswerVo() {
		super();
	}

	public AnswerVo(int answer_no, int assign_no, String answer_content, Date answer_writedate) {
		super();
		this.answer_no = answer_no;
		this.assign_no = assign_no;
		this.answer_content = answer_content;
		this.answer_writedate = answer_writedate;
	}

	public int getAnswer_no() {
		return answer_no;
	}

	public void setAnswer_no(int answer_no) {
		this.answer_no = answer_no;
	}

	public int getAssign_no() {
		return assign_no;
	}

	public void setAssign_no(int assign_no) {
		this.assign_no = assign_no;
	}

	public String getAnswer_content() {
		return answer_content;
	}

	public void setAnswer_content(String answer_content) {
		this.answer_content = answer_content;
	}

	public Date getAnswer_writedate() {
		return answer_writedate;
	}

	public void setAnswer_writedate(Date answer_writedate) {
		this.answer_writedate = answer_writedate;
	}
	
	
	
}
