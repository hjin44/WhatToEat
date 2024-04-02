package com.dj.wte.manager.service;


import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dj.wte.board.mapper.IngredientSQLMapper;
import com.dj.wte.board.vo.SubgroupVo;
import com.dj.wte.manager.mapper.KeepSQLMapper;
import com.dj.wte.manager.vo.KeepVo;

@Service
public class KeepServiceImpl {
	//현정6
	@Autowired
	private KeepSQLMapper keepSQLMapper;
	
	@Autowired
	private IngredientSQLMapper ingredientSQLMapper;
	
	public void writeKeep(KeepVo vo) {
		
		keepSQLMapper.insert(vo);
	}
	
	public ArrayList<HashMap<String, Object>> getIngredientList() {
		
		ArrayList<HashMap<String, Object>> resultList = new ArrayList<HashMap<String,Object>>();
		
		ArrayList<KeepVo> keepKist = keepSQLMapper.selectAll();
		
		for(KeepVo keepVo : keepKist) {
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			
			int subgroupNo = keepVo.getSubgroup_no();
			SubgroupVo subgroupVo = ingredientSQLMapper.selectSubgroupBysubgroupNo(subgroupNo);
			
			map.put("keepVo",keepVo);
			map.put("subgroupVo",subgroupVo);
			
			resultList.add(map);
		}
		
		
		return resultList;
	}

	public HashMap<String, Object> getKeep(int keep_no) {
		
		KeepVo keepVo = keepSQLMapper.selectByKeepNo(keep_no);
		
		int subgroupNo = keepVo.getSubgroup_no();
		SubgroupVo subgroupVo = ingredientSQLMapper.selectSubgroupBysubgroupNo(subgroupNo);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("keepVo", keepVo);
		map.put("subgroupVo", subgroupVo);
		
		return map;
	}
		
	public void deleteKeep(int recipeNo) {
		
		keepSQLMapper.deleteByKeepNo(recipeNo);
	}

	public void updateKeep(KeepVo vo) {
		
		keepSQLMapper.update(vo);
	}
	
	public boolean confirmIngredient(String subgroup_name) {
		
		SubgroupVo subVo = keepSQLMapper.selectBySubName(subgroup_name);
		int subNo = subVo.getSubgroup_no();
		
		KeepVo keepVo = keepSQLMapper.selectBySubGroupNo(subNo);
				
		if(keepVo != null) {
			return true;
			
		}else {
			return false;
		}
	}
}
