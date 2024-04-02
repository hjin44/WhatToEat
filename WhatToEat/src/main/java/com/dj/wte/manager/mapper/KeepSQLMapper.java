package com.dj.wte.manager.mapper;

import java.util.ArrayList;

import com.dj.wte.board.vo.SubgroupVo;
import com.dj.wte.manager.vo.KeepVo;

public interface KeepSQLMapper {
	//현정6
	//글쓰기
	public void insert(KeepVo vo); 
	
	//글 리스트 출력
	public ArrayList<KeepVo> selectAll();
	
	//레시피 페이지에서 재료 정보 보기
	public KeepVo selectBySubGroupNo(int subgroup_no);
	
	//글보기
	public KeepVo selectByKeepNo(int keep_no);
		
	//글수정
	public void update(KeepVo vo); 
	
	//글삭제
	public void deleteByKeepNo(int keep_no);

	public SubgroupVo selectBySubName(String subgroup_name); 
}
