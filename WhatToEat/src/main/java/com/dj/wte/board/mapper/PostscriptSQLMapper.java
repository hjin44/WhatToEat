package com.dj.wte.board.mapper;

import java.util.ArrayList;

import com.dj.wte.board.vo.PostscriptVo;

public interface PostscriptSQLMapper {
	
	public int createKey_postscript();
	
	public void insert_Postscript(PostscriptVo vo);	
	
	public ArrayList<PostscriptVo> select_All_Postscript();
	public ArrayList<PostscriptVo> select_Postscript_by_recipe_no(Integer recipe_no);

	public void delete_Postscript(int postscript_no);
}
