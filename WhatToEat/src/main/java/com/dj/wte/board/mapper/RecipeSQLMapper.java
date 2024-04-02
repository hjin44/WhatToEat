package com.dj.wte.board.mapper;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Param;

import com.dj.wte.board.vo.IngredientRecipeVo;
import com.dj.wte.board.vo.RecipeContentVo;
import com.dj.wte.board.vo.RecipeGoodVo;
import com.dj.wte.board.vo.RecipeKindVo;
import com.dj.wte.board.vo.RecipeNationalVo;
import com.dj.wte.board.vo.RecipeReplyVo;
import com.dj.wte.board.vo.RecipeVo;
import com.dj.wte.board.vo.SubgroupVo;

public interface RecipeSQLMapper {

	//키 생성
	public int createKey();
	
	// 나라별
	public ArrayList<RecipeNationalVo> selectNational();
	
	// 종류별
	public ArrayList<RecipeKindVo> selectKind();
	
	// 나라별 검색
	public ArrayList<RecipeVo> selectSearchNational(int national_no);
	
	// 종류별 검색
	public ArrayList<RecipeVo> selectSearchKind(int kind_no);
	
	// 상세 검색
	public ArrayList<RecipeVo> selectSearch(HashMap<String, Object> search);
	
	// 재료명으로 재료 찾기
	public int [] selectBySubgroupName(String [] subgroup_name);
	
	// 레시피 명으로 찾기
	public ArrayList<RecipeVo> selectSearchRecipe(String search);
	
	//레시피 등록
	public void insert(RecipeVo vo);

	//레시피 재료 등록
	public void insertIngredient(IngredientRecipeVo ingredientRecipeVo);

	//레시피 컨텐트 등록
	public void insertRecipeContent(RecipeContentVo recipeContentVo);
	
	//글 리스트 출력
	public ArrayList<RecipeVo> selectAll();

	//글 보기
	public RecipeVo selectByNo(int recipe_no);
	
	//조회수 증가
	public void increaseReadCount(int recipe_no);
	
	//글 보기 재료 목록
	public ArrayList<IngredientRecipeVo> ingredientSelectByNo(int recipe_no);
	
	//글 보기 컨텐트 목록
	public ArrayList<RecipeContentVo> contentSelectByNo(int recipe_no);

	//좋아요 누르면 인서트됨
	public void goodInsert(RecipeGoodVo vo);
	
	//한 사람이 좋아요 누른거 카운트 -> 좋아요 중복클릭 방지 (하트 색깔)
	public int selectCountByRecipeNoAndMemberNo(RecipeGoodVo vo);

	//추천 취소(삭제됨)
	public void deleteByRecipeNoAndMemberNo(@Param("recipe_no") int recipe_no, @Param("member_no") int member_no);

	//글 좋아요 개수
	public int selectCountByRecipeNo(int recipe_no);
	
	//회원 추가 재료 인서트
	public void subgroubInsert(@Param("member_no") int member_no, @Param("subgroup_name") String subgroup_name);
	
	//회원 추가 재료 인서트한거 넘버로 뽑아오기
	public int selectSubgroupNo(@Param("subgroup_name") String subgroup_name);

	//이미 추가된 재료 확인
	public SubgroupVo selectByingredintName(String ingredint);
	
	//서브그룹 이름만 가져오기
	public ArrayList<String> selectSubgroup();
	
	//서브그룹 이름으로 Vo 가져오기
	public SubgroupVo selectSubgroupVo(String subgroup_name);
	
	//글삭제
	public void deleteByNo(int no);
	
	//글의 재료 삭제
	public void deleteIngredient(int no);
	
	//글의 내용순서 삭제
	public void deleteContent(int no);

	//특정 회원의 글 목록
	public ArrayList<RecipeVo> selectRecipeByMemberNo(Integer memberNo);
	
	//글 개수
	public int countRecipe();
	
	//특정 회원의 글 개수
	public int countRecipeByMember(Integer memberNo);
	
	//댓글 입력
	public void insertReply(RecipeReplyVo vo);
	
	//글번호에 맞는 댓글 리스트
	public ArrayList<RecipeReplyVo> selectReplyByRecipeNo(int recipe_no);
	
	//댓글 삭제
	public void deleteReplyByNo(int no);
	
	//글 삭제 시 댓글 삭제
	public void deleteReplyByRecipeNo(int no);

	//레시피의 나라별 이름 뽑아오기
	public String nationalNameByNo(int nationalNo);
	
	//레시피의 종류별별 이름 뽑아오기
	public String kindNameByNo(int kindNo);

	//레시피 수정
	public void updateRecipe(RecipeVo vo);
	
	//글의 댓글 수 
	public int countRecipeReply(int recipe_no);
	
}
