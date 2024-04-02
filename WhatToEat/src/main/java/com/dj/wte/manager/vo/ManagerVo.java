package com.dj.wte.manager.vo;

import java.util.Date;

public class ManagerVo {
	private int manager_no;
	private String manager_id;
	private String manager_pw;
	private String manager_nick;
	private Date manager_joindate;
	
	public ManagerVo() {
		super();
	}

	public ManagerVo(int manager_no, String manager_id, String manager_pw, String manager_nick, Date manager_joindate) {
		super();
		this.manager_no = manager_no;
		this.manager_id = manager_id;
		this.manager_pw = manager_pw;
		this.manager_nick = manager_nick;
		this.manager_joindate = manager_joindate;
	}

	public int getManager_no() {
		return manager_no;
	}

	public void setManager_no(int manager_no) {
		this.manager_no = manager_no;
	}

	public String getManager_id() {
		return manager_id;
	}

	public void setManager_id(String manager_id) {
		this.manager_id = manager_id;
	}

	public String getManager_pw() {
		return manager_pw;
	}

	public void setManager_pw(String manager_pw) {
		this.manager_pw = manager_pw;
	}

	public String getManager_nick() {
		return manager_nick;
	}

	public void setManager_nick(String manager_nick) {
		this.manager_nick = manager_nick;
	}

	public Date getManager_joindate() {
		return manager_joindate;
	}

	public void setManager_joindate(Date manager_joindate) {
		this.manager_joindate = manager_joindate;
	}
	
	
	
	
}
