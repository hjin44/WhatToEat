package com.dj.wte.member.vo;

import java.util.Date;

public class PointVo {
	private int point_no;
	private int member_no;
	private int point_amount;
	private Date point_chargedate;
	
	public PointVo() {
		super();
	}

	public PointVo(int point_no, int member_no, int point_amount, Date point_chargedate) {
		super();
		this.point_no = point_no;
		this.member_no = member_no;
		this.point_amount = point_amount;
		this.point_chargedate = point_chargedate;
	}

	public int getPoint_no() {
		return point_no;
	}

	public void setPoint_no(int point_no) {
		this.point_no = point_no;
	}

	public int getMember_no() {
		return member_no;
	}

	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}

	public int getPoint_amount() {
		return point_amount;
	}

	public void setPoint_amount(int point_amount) {
		this.point_amount = point_amount;
	}

	public Date getPoint_chargedate() {
		return point_chargedate;
	}

	public void setPoint_chargedate(Date point_chargedate) {
		this.point_chargedate = point_chargedate;
	}
	
	
}
