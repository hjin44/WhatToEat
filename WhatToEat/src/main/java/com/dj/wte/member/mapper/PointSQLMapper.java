package com.dj.wte.member.mapper;

import com.dj.wte.member.vo.PointVo;

public interface PointSQLMapper {
	
	//포인트 충전
	public void insert(PointVo vo);
	
	//보유 포인트 출력
	public Integer getPoint(int member_no);
}
