package com.dj.wte.manager.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dj.wte.manager.mapper.ManagerSQLMapper;
import com.dj.wte.manager.vo.ManagerVo;

@Service
public class ManagerServiceImpl {

	@Autowired
	private ManagerSQLMapper managerSQLMapper;
	
	public ManagerVo login(ManagerVo vo) {
		ManagerVo result = managerSQLMapper.selectIdAndPw(vo);
		
		return result;
	}
}
