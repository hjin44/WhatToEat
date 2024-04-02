package com.dj.wte.board.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dj.wte.board.service.RecipeServiceImpl;
import com.dj.wte.board.vo.RecipeGoodVo;
import com.dj.wte.board.vo.RecipeReplyVo;
import com.dj.wte.board.vo.SubgroupVo;
import com.dj.wte.member.vo.MemberVo;

@Controller
@RequestMapping("/board/*")
@ResponseBody
public class RESTfulRecipeController {

	@Autowired
	private RecipeServiceImpl recipeService;
	
	@RequestMapping("recipe_subgroup_list.do")
	public ArrayList<SubgroupVo> subgroupList(int group_no){
		
		ArrayList<SubgroupVo> subgroupVo = recipeService.subgroupList(group_no);
		
		return subgroupVo;	
	}
	
	@RequestMapping("recipe_search_list.do")
	public ArrayList<HashMap<String, Object>> recipeSearchList(int national_no, int kind_no, int [] in_subgroup_no, int [] not_subgroup_no, String [] in_typing_name, String [] not_typing_name){
		
		if(in_typing_name.length != 0) {
			
			ArrayList<Integer> arr = new ArrayList<Integer>();
			
			for(int i = 0; i < in_subgroup_no.length; i++) {
				arr.add(in_subgroup_no[i]);
			}
			
			int [] inTypingName = recipeService.typingSubgroupName(in_typing_name);
			
			
			for(int i = 0; i < inTypingName.length; i++) {
				arr.add(inTypingName[i]);
			}
			
			in_subgroup_no = new int [arr.size()];
			
			for(int i = 0; i < arr.size(); i++) {
				in_subgroup_no[i] = arr.get(i);
			}
			
		}
		
		if(not_typing_name.length != 0) {
			
			ArrayList<Integer> arr = new ArrayList<Integer>();
			
			for(int i = 0; i < not_subgroup_no.length; i++) {
				arr.add(not_subgroup_no[i]);
			}
			
			int [] notTypingName = recipeService.typingSubgroupName(not_typing_name);
			
			for(int i = 0; i < notTypingName.length; i++) {
				arr.add(notTypingName[i]);
			}
			
			not_subgroup_no = new int [arr.size()];
			
			for(int i = 0; i < arr.size(); i++) {
				not_subgroup_no[i] = arr.get(i);
			}
		}
		
		if(in_subgroup_no.length == 0) {
			in_subgroup_no = null;
		}
		
		if(not_subgroup_no.length == 0) {
			not_subgroup_no = null;
		}
		
		
		HashMap<String, Object> search = new HashMap<String, Object>();
		search.put("national_no", national_no);
		search.put("kind_no", kind_no);
		search.put("in_subgroup_no", in_subgroup_no);
		search.put("not_subgroup_no", not_subgroup_no);
		
		
		ArrayList<HashMap<String, Object>> recipeResultList = recipeService.recipeSearchList(search);
		
		return recipeResultList;
	}
	
	@RequestMapping("recipe_title_search.do")
	public ArrayList<HashMap<String, Object>> recipeTitleSearch(String search){
		
		ArrayList<HashMap<String, Object>> recipeResultList = recipeService.recipeTitleSearch(search);
		
		return recipeResultList;
		
	}
	
	@RequestMapping("subgroup_confirm.do")
	public boolean subgroupConfirm(String [] typing_name) {
		
		if(typing_name.length == 0) {
			
			return true;
			
		}
		
		int [] inTypingName = recipeService.typingSubgroupName(typing_name);
		
		System.out.println(inTypingName.length);
		
		if(inTypingName.length == 0) {
			
			return false;
			
		} else {
			
			return true;
			
		}
		
	}
	
	@RequestMapping("national_search_list.do")
	public ArrayList<HashMap<String, Object>> nationalSearchList(int national_no){
		
		ArrayList<HashMap<String, Object>> recipeResultList = recipeService.recipeNationalSearchList(national_no);
		
		return recipeResultList;
	}
	
	@RequestMapping("kind_search_list.do")
	public ArrayList<HashMap<String, Object>> kindSearchList(int kind_no){
		
		ArrayList<HashMap<String, Object>> recipeResultList = recipeService.recipeKindSearchList(kind_no);
		
		return recipeResultList;
	}
	
	//현정 추가//////
	
	@RequestMapping("recipe_good_process.do")
	public void recipeGoodprocess(HttpSession session, int recipe_no) {
		
		MemberVo sessionUser = (MemberVo)session.getAttribute("sessionUser");
		int userNo = sessionUser.getMember_no();
		
		RecipeGoodVo param = new RecipeGoodVo();
		param.setRecipe_no(recipe_no);
		param.setMember_no(userNo);
		
		recipeService.recipeGoodclick(param);
		
		int recipeGoodCount = recipeService.recipeGood(param);
		
		//좋아요를 한 번도 안 눌렀거나 한 번만 누른게(좋아요 누름) 아니라면 
		if(recipeGoodCount != 0 && recipeGoodCount != 1) {
			
			recipeService.recipeGoodDelete(recipe_no, userNo);
		}
	}
	
	@RequestMapping("recipe_good_count_heart_color.do")
	public int getGoodCountHeart(HttpSession session, int recipe_no) {
		
		MemberVo sessionUser = (MemberVo)session.getAttribute("sessionUser");
		int userNo = 0;
		
		if(sessionUser != null) {
			userNo = sessionUser.getMember_no();
		}
		
		RecipeGoodVo param = new RecipeGoodVo();
		param.setRecipe_no(recipe_no);
		param.setMember_no(userNo);
		
		int recipeGoodCount = recipeService.recipeGood(param);
		
		return recipeGoodCount;
	}
	
	@RequestMapping("recipe_good_count.do")
	public int getGoodCount(int recipe_no) {
		
		int countRG = recipeService.countRecipeGood(recipe_no);
		
		return countRG;
	}
	
	@RequestMapping("exist_ingredient.do")
	public String existId(String ingredint) {
		
		boolean existIngredient = recipeService.existIngredient(ingredint);
		
		if(existIngredient == true) {
			return "true";
			
		}else {
			return "false";
			
		}
	}
	
	@RequestMapping("recipe_subgroup_select.do")
	public HashMap<String, Object> selectSubgroupVo(String subgroup_name) {
		
		HashMap<String, Object> result = recipeService.subgroupVoByName(subgroup_name);
		return result;
	}
	
	@RequestMapping("recipe_reply_write_process.do")
	public void writeRepleProcess(RecipeReplyVo param, HttpSession session) {
		
		int member_no = ((MemberVo)session.getAttribute("sessionUser")).getMember_no();
		param.setMember_no(member_no);
		
		recipeService.recipeReplyWrite(param);
	}
	
	@RequestMapping("get_recipe_reply_list.do")
	public ArrayList<HashMap<String, Object>> getRecipeReplyList(int recipe_no){
		
		ArrayList<HashMap<String, Object>> recipeReplyList = recipeService.getRecipeReplyList(recipe_no);
		
		return recipeReplyList;
	}
	
	@RequestMapping("recipe_reply_delete_process.do")
	public void recipeReplyDeleteProcess(int recipe_reply_no, int recipe_no) {
		
		recipeService.recipeReplyDelete(recipe_reply_no);
	}
	
	@RequestMapping("recipe_reply_count.do")
	public int recipeReplyCount(int recipe_no) {
		int recipeReplyCount = recipeService.recipeReplyCount(recipe_no);
		return recipeReplyCount;
	}
	
}
