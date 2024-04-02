package com.dj.wte.board.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.commons.text.StringEscapeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dj.wte.board.mapper.PostscriptImageSQLMapper;
import com.dj.wte.board.mapper.PostscriptSQLMapper;
import com.dj.wte.board.mapper.RecipeSQLMapper;
import com.dj.wte.board.vo.PostscriptImageVo;
import com.dj.wte.board.vo.PostscriptVo;
import com.dj.wte.board.vo.RecipeVo;
import com.dj.wte.member.mapper.MemberSQLMapper;
import com.dj.wte.member.vo.MemberVo;

@Service
public class PostscriptServiceImpl {

	@Autowired
	private PostscriptSQLMapper postscriptSQLMapper;
	
	@Autowired
	private PostscriptImageSQLMapper postscriptImageSQLMapper;
	
	@Autowired
	private MemberSQLMapper memberSQLMapper;
	
	@Autowired
	private RecipeSQLMapper recipeSQLMapper;
	
	//후기 작성
	public void writePostscript(PostscriptVo vo, ArrayList<PostscriptImageVo> imageVoList) {
		int PostscriptPK = postscriptSQLMapper.createKey_postscript();
		vo.setPostscript_no(PostscriptPK);
		postscriptSQLMapper.insert_Postscript(vo);
		
		for(PostscriptImageVo postscriptImageVo : imageVoList) {
			postscriptImageVo.setPostscript_no(PostscriptPK);
			postscriptImageSQLMapper.insert(postscriptImageVo);
		}
	}
	
	//전체 후기 리스트 가져오기
	public ArrayList<HashMap<String, Object>> getAllPostscriptList(Integer recipe_no){
		ArrayList<HashMap<String, Object>> resultList = new ArrayList<HashMap<String,Object>>();
		
		if(recipe_no == null) {

			ArrayList<PostscriptVo> postList = null;
			postList = postscriptSQLMapper.select_All_Postscript();
			
		
			for(PostscriptVo postscriptVo : postList) {
				HashMap<String, Object> map = new HashMap<String, Object>();
				
				String str = postscriptVo.getPostscript_content();
				str = StringEscapeUtils.escapeHtml4(str);
				str = str.replaceAll("\n", "<br>");
				postscriptVo.setPostscript_content(str);
				

				int postscript_no = postscriptVo.getPostscript_no();
				int member_no = postscriptVo.getMember_no();
				int post_recipe_no = postscriptVo.getRecipe_no();
				
				//System.out.println("postscript_no : "+ postscript_no);
				PostscriptImageVo postscriptImageVo = postscriptImageSQLMapper.select_first_image(postscript_no);
				String image = postscriptImageVo.getPostscript_image_link();
				
				MemberVo memberVo = memberSQLMapper.selectAll(member_no);
				RecipeVo recipeVo = recipeSQLMapper.selectByNo(post_recipe_no);
				
				ArrayList<PostscriptImageVo> imageList = postscriptImageSQLMapper.select_postscript_no(postscript_no);
				System.out.println("imageList : "+ imageList);
				
				map.put("postscriptVo", postscriptVo);
				map.put("image", image);
				map.put("memberVo", memberVo);
				map.put("recipeVo", recipeVo);
				map.put("imageList", imageList);
				
				
				resultList.add(map);
			}
			return resultList;
		}else {
			ArrayList<PostscriptVo> postList = null;
			postList = postscriptSQLMapper.select_Postscript_by_recipe_no(recipe_no);
			
			
			for(PostscriptVo postscriptVo : postList) {
				HashMap<String, Object> map = new HashMap<String, Object>();
				
				String str = postscriptVo.getPostscript_content();
				str = StringEscapeUtils.escapeHtml4(str);
				str = str.replaceAll("\n", "<br>");
				postscriptVo.setPostscript_content(str);
				
				int postscript_no = postscriptVo.getPostscript_no();
				int member_no = postscriptVo.getMember_no();
				int post_recipe_no = postscriptVo.getRecipe_no();				
				
				//System.out.println("postscript_no : "+ postscript_no);
				PostscriptImageVo postscriptImageVo = postscriptImageSQLMapper.select_first_image(postscript_no);
				String image = postscriptImageVo.getPostscript_image_link();
				
				MemberVo memberVo = memberSQLMapper.selectAll(member_no);
				RecipeVo recipeVo = recipeSQLMapper.selectByNo(post_recipe_no);
				
				ArrayList<PostscriptImageVo> imageList = postscriptImageSQLMapper.select_postscript_no(postscript_no);
				
				map.put("postscriptVo", postscriptVo);
				map.put("image", image);
				map.put("memberVo", memberVo);
				map.put("recipeVo", recipeVo);
				map.put("imageList", imageList);
				
				
				resultList.add(map);
			}
			return resultList;
		}
		
	}

	//후기 삭제
	public void deletePostscript(int postscript_no) {
		postscriptSQLMapper.delete_Postscript(postscript_no);
	}
	
	
	//후기 리스트 가져오기 사용 x
	public ArrayList<HashMap<String, Object>> getPostscriptList(int recipe_no){
		ArrayList<HashMap<String, Object>> resultList = new ArrayList<HashMap<String,Object>>();
		
		ArrayList<PostscriptVo> postList = null;
		postList = postscriptSQLMapper.select_Postscript_by_recipe_no(recipe_no);
		
		for(PostscriptVo postscriptVo : postList) {
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("postscriptVo", postscriptVo);
			
			resultList.add(map);
		}
		return resultList;
	}
	
}
