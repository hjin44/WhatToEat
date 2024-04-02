package com.dj.wte.board.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.commons.text.StringEscapeUtils;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dj.wte.board.mapper.IngredientSQLMapper;
import com.dj.wte.board.mapper.RecipeSQLMapper;
import com.dj.wte.board.vo.GroupVo;
import com.dj.wte.board.vo.IngredientRecipeVo;
import com.dj.wte.board.vo.RecipeContentVo;
import com.dj.wte.board.vo.RecipeGoodVo;
import com.dj.wte.board.vo.RecipeKindVo;
import com.dj.wte.board.vo.RecipeNationalVo;
import com.dj.wte.board.vo.RecipeReplyVo;
import com.dj.wte.board.vo.RecipeVo;
import com.dj.wte.board.vo.SubgroupVo;
import com.dj.wte.manager.mapper.KeepSQLMapper;
import com.dj.wte.manager.vo.KeepVo;
import com.dj.wte.member.mapper.MemberSQLMapper;
import com.dj.wte.member.vo.MemberVo;

@Service
public class RecipeServiceImpl {
	
	@Autowired
	private MemberSQLMapper memberSQLMapper;
	
	@Autowired
	private RecipeSQLMapper recipeSQLMapper;
	
	@Autowired
	private IngredientSQLMapper ingredientSQLMapper;
	
	@Autowired //현정4
	private KeepSQLMapper keepSQLMapper;
	
	// 대분류 select
	public ArrayList<GroupVo> groupList(){
		
		ArrayList<GroupVo> groupVo = ingredientSQLMapper.selectGroup();
		
		return groupVo;
	}
	
	// 중분류 select(group_no)
	public ArrayList<SubgroupVo> subgroupList(int group_no){
		
		ArrayList<SubgroupVo> subgroupVo = ingredientSQLMapper.selectSubgroup(group_no);
		
		return subgroupVo;
	}
	
	// 나라별 select
	public ArrayList<RecipeNationalVo> nationalList(){
		
		ArrayList<RecipeNationalVo> nationalVo = recipeSQLMapper.selectNational();
		
		return nationalVo;
	}
	
	// 종류별 select
	public ArrayList<RecipeKindVo> kindList(){
		
		ArrayList<RecipeKindVo> kindVo = recipeSQLMapper.selectKind();
		
		return kindVo;
	}
	
	// 상세검색 쿼리
	public ArrayList<HashMap<String, Object>> recipeSearchList(HashMap<String, Object> search){
		
		ArrayList<HashMap<String, Object>> recipeResultList = new ArrayList<HashMap<String,Object>>();
		
		ArrayList<RecipeVo> recipeList = recipeSQLMapper.selectSearch(search);
		
		for(RecipeVo recipeVo : recipeList) {
			
			int member_no = recipeVo.getMember_no();
			MemberVo memberVo = memberSQLMapper.selectAll(member_no);
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			
			map.put("memberVo", memberVo);
			map.put("recipeVo", recipeVo);
			
			recipeResultList.add(map);
		}
		
		return recipeResultList;
		
	}
	
	public ArrayList<HashMap<String, Object>> recipeTitleSearch(String search){
		
		ArrayList<HashMap<String, Object>> recipeResultList = new ArrayList<HashMap<String,Object>>();
		
		ArrayList<RecipeVo> recipeList = recipeSQLMapper.selectSearchRecipe(search);
		
		for(RecipeVo recipeVo : recipeList) {
			
			int member_no = recipeVo.getMember_no();
			MemberVo memberVo = memberSQLMapper.selectAll(member_no);
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			
			map.put("memberVo", memberVo);
			map.put("recipeVo", recipeVo);
			
			recipeResultList.add(map);
		}
		
		return recipeResultList;
		
	}
	
	// 재료명으로 재료 검색
	public int [] typingSubgroupName(String [] subgroup_name) {
		
		int [] subgroupNo = null;
		
		if(subgroup_name.length != 0 ) {
			
			subgroupNo = recipeSQLMapper.selectBySubgroupName(subgroup_name);

		} 
			
			return subgroupNo;
	}
	
	// 나라별 검색
	public ArrayList<HashMap<String, Object>> recipeNationalSearchList(int national_no){
		
		ArrayList<HashMap<String, Object>> recipeResultList = new ArrayList<HashMap<String,Object>>();
		
		ArrayList<RecipeVo> recipeList = recipeSQLMapper.selectSearchNational(national_no);
		
		for(RecipeVo recipeVo : recipeList) {
			
			int member_no = recipeVo.getMember_no();
			MemberVo memberVo = memberSQLMapper.selectAll(member_no);
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			
			System.out.println("recipeVo.getRecipe_title() : " + recipeVo.getRecipe_title());
			
			map.put("memberVo", memberVo);
			map.put("recipeVo", recipeVo);
			
			recipeResultList.add(map);
		}
		
		return recipeResultList;
		
	}
	
	// 종류별 검색
	public ArrayList<HashMap<String, Object>> recipeKindSearchList(int kind_no){
		
		ArrayList<HashMap<String, Object>> recipeResultList = new ArrayList<HashMap<String,Object>>();
		
		ArrayList<RecipeVo> recipeList = recipeSQLMapper.selectSearchKind(kind_no);
		
		for(RecipeVo recipeVo : recipeList) {
			
			int member_no = recipeVo.getMember_no();
			MemberVo memberVo = memberSQLMapper.selectAll(member_no);
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			
			System.out.println("recipeVo.getRecipe_title() : " + recipeVo.getRecipe_title());
			
			map.put("memberVo", memberVo);
			map.put("recipeVo", recipeVo);
			
			recipeResultList.add(map);
		}
		
		return recipeResultList;
		
	}
	
	// 현정 추가 /////////////////////
	public void writeRecipe(RecipeVo vo) {
		
		int recipePK = recipeSQLMapper.createKey();
		vo.setRecipe_no(recipePK);
		
		recipeSQLMapper.insert(vo);
	}
	
	public int [] userIngredientAdd(int member_no, String [] subgroup_names) {
		
		int[] subgroup_nos = new int[subgroup_names.length];
		
		for(int i = 0 ; i < subgroup_names.length; i++) {
			
			recipeSQLMapper.subgroubInsert(member_no, subgroup_names[i]);
			
			int subgroup_no = recipeSQLMapper.selectSubgroupNo(subgroup_names[i]);
			
			subgroup_nos[i] = subgroup_no;
		}
		
		return subgroup_nos;
	}

	public void writeIngredientRecipe(int [] subgroup_nos, String [] ingredient_recipe_quantitys, int recipe_no) {

		ArrayList<IngredientRecipeVo> ingredientRecipeVoList = new ArrayList<IngredientRecipeVo>();
		
		for(int i = 0 ; i < subgroup_nos.length ; i++) {
			
			if(subgroup_nos[i] != 0) {
				
			IngredientRecipeVo ingredientRecipeVo = new IngredientRecipeVo();
		
			ingredientRecipeVo.setRecipe_no(recipe_no);
			ingredientRecipeVo.setSubgroup_no(subgroup_nos[i]);
			ingredientRecipeVo.setIngredient_recipe_quantity(ingredient_recipe_quantitys[i]);
			
			ingredientRecipeVoList.add(ingredientRecipeVo);
			}
		}
		
		for(IngredientRecipeVo ingredientRecipeVooo : ingredientRecipeVoList) {
			
			recipeSQLMapper.insertIngredient(ingredientRecipeVooo);
		}
		
	}

	public void writeRecipeContent(String[] recipeContentImageList, String[] recipe_contents,  int recipe_no) {
		
		ArrayList<RecipeContentVo> recipeContentVoList = new ArrayList<RecipeContentVo>();
		
		for(int i = 0 ; i < recipe_contents.length ; i++) {
			
			RecipeContentVo recipeContentVo = new RecipeContentVo();
			
			recipeContentVo.setRecipe_no(recipe_no);
			recipeContentVo.setRecipe_content(recipe_contents[i]);
			recipeContentVo.setRecipe_image_link(recipeContentImageList[i]);
			
			recipeContentVoList.add(recipeContentVo);
		}
		
		for(RecipeContentVo recipeContentVooo : recipeContentVoList) {
			
			recipeSQLMapper.insertRecipeContent(recipeContentVooo);
		}
	}
	
	public ArrayList<HashMap<String, Object>> recipeList(Integer memberNo, Integer userNo, Integer nationalNo){
		
		ArrayList<HashMap<String, Object>> recipeResultList = new ArrayList<HashMap<String,Object>>();
		
		ArrayList<RecipeVo> recipeList = null;
		
		if(memberNo == null) {
			
			if(nationalNo == null) {
				
				//전체 글 
				recipeList = recipeSQLMapper.selectAll();
				
			} else {
				
				recipeList = recipeSQLMapper.selectSearchNational(nationalNo);
				
			}
			
			
		}else { 
			//특정 회원의 글 
			recipeList = recipeSQLMapper.selectRecipeByMemberNo(memberNo);
		}
		
		for(RecipeVo recipeVo : recipeList) {
			
			int member_no = recipeVo.getMember_no();
			MemberVo memberVo = memberSQLMapper.selectAll(member_no);
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			
			map.put("memberVo", memberVo);
			map.put("recipeVo", recipeVo);
			
			int recipe_no = recipeVo.getRecipe_no();
			
			//좋아요 수 목록
			map.put("recipeGoodCount", recipeSQLMapper.selectCountByRecipeNo(recipe_no));
			
			//댓글 수 목록
			map.put("recipeReplyCount", recipeSQLMapper.countRecipeReply(recipe_no));
			
			//하트 색깔 목록
			if(userNo == null) {
				map.put("recipeGoodHeartColor",0);
				
			}else {
				RecipeGoodVo recipeGoodVo = new RecipeGoodVo();
				recipeGoodVo.setRecipe_no(recipe_no);
				recipeGoodVo.setMember_no((int)userNo);
				
				map.put("recipeGoodHeartColor",recipeSQLMapper.selectCountByRecipeNoAndMemberNo(recipeGoodVo));
			}
			
			recipeResultList.add(map);
		}
		
		return recipeResultList;
	}

	public HashMap<String, Object> recipeRead(int recipe_no) {
		
		// 조회수 증가 쿼리 실행
		recipeSQLMapper.increaseReadCount(recipe_no);
		
		RecipeVo recipeVo = recipeSQLMapper.selectByNo(recipe_no);
		
		int member_no = recipeVo.getMember_no();
		MemberVo memberVo = memberSQLMapper.selectAll(member_no);
		
		HashMap<String, Object> map = new HashMap<String, Object>(); 
		
		//카테고리
		int nationalNo = recipeVo.getNational_no();
		String nationalName = recipeSQLMapper.nationalNameByNo(nationalNo);
		
		int kindNo = recipeVo.getKind_no();
		String kindName = recipeSQLMapper.kindNameByNo(kindNo);
		
		//여기엔 재료 넘버만 있음 이름이 없어!!!
		ArrayList<HashMap<String, Object>> subgroupList = new ArrayList<HashMap<String, Object>>();
		ArrayList<IngredientRecipeVo> ingredientList =  recipeSQLMapper.ingredientSelectByNo(recipe_no);
		
		for(IngredientRecipeVo ingredientVo : ingredientList) {
			//재료 넘버로 재료 테이블 다 뽑아와서
			int subgroup_no = ingredientVo.getSubgroup_no();
			
			HashMap<String, Object> submap = new HashMap<String, Object>();
			
			//재료 테이블 뽑아올거임 (여기에 재료 이름이 있음)
			SubgroupVo subgroupVo = ingredientSQLMapper.selectSubgroupBysubgroupNo(subgroup_no);
			submap.put("subgroupVo",subgroupVo);
			
			//현정4
			KeepVo keepVo = keepSQLMapper.selectBySubGroupNo(subgroup_no);
			submap.put("keepVo",keepVo);
			submap.put("ingredientVo",ingredientVo);
			
			subgroupList.add(submap);
			
		}
		
		map.put("memberVo", memberVo);
		map.put("recipeVo", recipeVo);
		map.put("subgroupList", subgroupList);
		map.put("nationalName", nationalName);
		map.put("kindName", kindName);
		
		return map;
	}
	
	public ArrayList<RecipeContentVo> readContentList(int recipe_no){
		ArrayList<RecipeContentVo> contentList = recipeSQLMapper.contentSelectByNo(recipe_no);
		//현정3
		for(RecipeContentVo recipeContentVo : contentList) {
			String str = recipeContentVo.getRecipe_content();
			str = StringEscapeUtils.escapeHtml4(str);
			str = str.replaceAll("\n", "<br>");
			recipeContentVo.setRecipe_content(str);
		}
		
		return contentList;
	}
	
	public ArrayList<RecipeContentVo> updateContentList(int recipe_no){
		ArrayList<RecipeContentVo> contentList = recipeSQLMapper.contentSelectByNo(recipe_no);
		//현정3
		for(RecipeContentVo recipeContentVo : contentList) {
			String str = recipeContentVo.getRecipe_content();
			str = StringEscapeUtils.escapeHtml4(str);
			str = str.replaceAll("<br>", "");
			recipeContentVo.setRecipe_content(str);
		}
		
		return contentList;
	}
	
	public void recipeGoodclick(RecipeGoodVo vo) {
		
		recipeSQLMapper.goodInsert(vo);
	}

	public int recipeGood(RecipeGoodVo vo) {
		//출력 데이터 받아오기 -> 한 유저가 추천 누른 수
		int recipeGoodCountByMember = recipeSQLMapper.selectCountByRecipeNoAndMemberNo(vo);
		
		return recipeGoodCountByMember;
	}

	public void recipeGoodDelete(int recipe_no, int member_no) {

		recipeSQLMapper.deleteByRecipeNoAndMemberNo(recipe_no, member_no);
	}

	public int countRecipeGood(int recipe_no) {

		int countRG = recipeSQLMapper.selectCountByRecipeNo(recipe_no);
		
		return countRG;
	}

	public boolean existIngredient(String ingredint) {

		SubgroupVo vo = recipeSQLMapper.selectByingredintName(ingredint);
		
		if(vo != null) {
			return true;
			
		}else {
			return false;
		}
	}
	
	public ArrayList<String> subgroupList(){
		
		ArrayList<String> subgrouNameList = recipeSQLMapper.selectSubgroup();
		
		return subgrouNameList;
	}
	
	public HashMap<String, Object> subgroupVoByName(String subgroup_name){
		
		SubgroupVo subgroupVo = recipeSQLMapper.selectSubgroupVo(subgroup_name);
		
		if(subgroupVo == null) {
			return null;
			
		}else {
			
			int group_no = subgroupVo.getGroup_no();
			GroupVo groupVo = ingredientSQLMapper.selectGroupByNo(group_no);
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("subgroupVo",subgroupVo);
			map.put("groupVo",groupVo);
			
			return map;
		}
	}
	
	public void deleteRecipe(int recipeNo) {
		
		recipeSQLMapper.deleteByNo(recipeNo);
		recipeSQLMapper.deleteIngredient(recipeNo);
		recipeSQLMapper.deleteContent(recipeNo);
		recipeSQLMapper.deleteReplyByRecipeNo(recipeNo);
	}
	
	public void deleteRecipeIngredientAndContent(int recipeNo) {
		
		recipeSQLMapper.deleteIngredient(recipeNo);
		recipeSQLMapper.deleteContent(recipeNo);
	}

	public int getCountRecipe(Integer memberNo) {
		
		int countRecipe = 0;		
		
		if(memberNo == null) {
			countRecipe = recipeSQLMapper.countRecipe();
			
		}else {
			countRecipe = recipeSQLMapper.countRecipeByMember(memberNo);
		}
		
		return countRecipe;
	}
	
	public void recipeReplyWrite(RecipeReplyVo vo) {
			
		recipeSQLMapper.insertReply(vo);
	}
	
	public ArrayList<HashMap<String, Object>> getRecipeReplyList(int recipeNo){
		
		ArrayList<HashMap<String, Object>> recipeReplyList = new ArrayList<HashMap<String,Object>>();
		
		ArrayList<RecipeReplyVo> recipeReplyVoList = recipeSQLMapper.selectReplyByRecipeNo(recipeNo);
		
		for(RecipeReplyVo recipeReplyVo : recipeReplyVoList) {
			
			MemberVo memberVo = memberSQLMapper.selectAll(recipeReplyVo.getMember_no());
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("memberVo", memberVo);
			map.put("recipeReplyVo", recipeReplyVo);
			
			recipeReplyList.add(map);
			
		}
		
		return recipeReplyList;
	}
	
	public void recipeReplyDelete(int recipeReplyNo) {
		
		recipeSQLMapper.deleteReplyByNo(recipeReplyNo);
	}

	public void updateRecipe(RecipeVo vo) {
		
		recipeSQLMapper.updateRecipe(vo);
	}
	
	public ArrayList<HashMap<String, Object>> updateRecipeIngredient(int recipe_no) {
		
		ArrayList<HashMap<String, Object>> resultList = new ArrayList<HashMap<String,Object>>();
		
		ArrayList<IngredientRecipeVo> ingredientList =  recipeSQLMapper.ingredientSelectByNo(recipe_no);
		
		for(IngredientRecipeVo ingredientVo : ingredientList) {
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			
			int subgroup_no = ingredientVo.getSubgroup_no();
			SubgroupVo subgroupVo = ingredientSQLMapper.selectSubgroupBysubgroupNo(subgroup_no);
			
			int group_no = subgroupVo.getGroup_no();
			GroupVo groupVo = ingredientSQLMapper.selectGroupByNo(group_no);
			
			map.put("ingredientVo", ingredientVo);
			map.put("subgroupVo", subgroupVo);
			map.put("groupVo", groupVo);
			
			resultList.add(map);
		}
		
		return resultList;
	}
	
	public int recipeReplyCount(int recipe_no) {
		int recipeReplyCount = recipeSQLMapper.countRecipeReply(recipe_no);
		return recipeReplyCount;
	}
	
}
