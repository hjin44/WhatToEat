package com.dj.wte.manager.mapper;

import java.util.ArrayList;

import com.dj.wte.manager.vo.ManagerVo;

public interface ManagerSQLMapper {
	
	public ManagerVo selectIdAndPw(ManagerVo vo);
	
	public ManagerVo selectByNo(int manager_no);
	
	public ArrayList<ManagerVo> selectManager();

}
