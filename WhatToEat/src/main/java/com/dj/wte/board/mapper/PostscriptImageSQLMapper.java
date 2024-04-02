package com.dj.wte.board.mapper;

import java.util.ArrayList;

import com.dj.wte.board.vo.PostscriptImageVo;

public interface PostscriptImageSQLMapper {

	//이미지 첨부
	public void insert(PostscriptImageVo vo);
	
	public ArrayList<PostscriptImageVo> select_postscript_no(int postscript_no);
	
	public PostscriptImageVo select_first_image(int postscript_no);
	
}
