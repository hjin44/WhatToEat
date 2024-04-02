package com.dj.wte.board.mapper;

import java.util.ArrayList;


import com.dj.wte.board.vo.FbImageVo;



public interface FbImageSQLMapper {
	
public void insert(FbImageVo vo);
	
	public ArrayList<FbImageVo> selectByContentNo(int content_no);	

}
