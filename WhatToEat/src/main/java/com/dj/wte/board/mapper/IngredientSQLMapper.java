package com.dj.wte.board.mapper;

import java.util.ArrayList;

import com.dj.wte.board.vo.GroupVo;
import com.dj.wte.board.vo.SubgroupVo;

public interface IngredientSQLMapper {

	// 대분류 select
	public ArrayList<GroupVo> selectGroup();
	
	// 중분류 select(group_no)
	public ArrayList<SubgroupVo> selectSubgroup(int group_no);
	
	// 서브그룹 넘버로 테이블 뽑아오기
	public SubgroupVo selectSubgroupBysubgroupNo(int subgroup_no);
	
	// 대분류 select(현정님꺼)
	public GroupVo selectGroupByNo(int group_no);
}
