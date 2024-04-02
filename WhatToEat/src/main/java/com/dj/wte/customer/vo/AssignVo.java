package com.dj.wte.customer.vo;

import java.util.Date;

public class AssignVo {

	private int assign_no;
	private int ask_no;
	private int manager_no;
	private Date assign_date;
	
	public AssignVo() {
		super();
	}

	public AssignVo(int assign_no, int ask_no, int manager_no, Date assign_date) {
		super();
		this.assign_no = assign_no;
		this.ask_no = ask_no;
		this.manager_no = manager_no;
		this.assign_date = assign_date;
	}

	public int getAssign_no() {
		return assign_no;
	}

	public void setAssign_no(int assign_no) {
		this.assign_no = assign_no;
	}

	public int getAsk_no() {
		return ask_no;
	}

	public void setAsk_no(int ask_no) {
		this.ask_no = ask_no;
	}

	public int getManager_no() {
		return manager_no;
	}

	public void setManager_no(int manager_no) {
		this.manager_no = manager_no;
	}

	public Date getAssign_date() {
		return assign_date;
	}

	public void setAssign_date(Date assign_date) {
		this.assign_date = assign_date;
	}
	
	
}
