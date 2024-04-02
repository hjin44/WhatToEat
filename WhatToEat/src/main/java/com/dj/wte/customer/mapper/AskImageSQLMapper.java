package com.dj.wte.customer.mapper;

import java.util.ArrayList;

import com.dj.wte.customer.vo.AskImageVo;

public interface AskImageSQLMapper {

	public void insert(AskImageVo vo);
	
	public ArrayList<AskImageVo> selectByAskNo(int ask_no);
}
