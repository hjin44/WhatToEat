package com.dj.wte.member.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.dj.wte.board.vo.GoodsLikeVo;
import com.dj.wte.board.vo.GoodsVo;
import com.dj.wte.board.vo.RecipeGoodVo;
import com.dj.wte.board.vo.RecipeVo;
import com.dj.wte.member.vo.MemberVo;

public interface MemberSQLMapper {

	// memberPk 생성
	public int createKey();
	
	// 회원가입
	public void insert(MemberVo vo);
	
	// 중복 아이디 확인
	public MemberVo selectConfirmById(String member_id);
	
	// 중복 닉네임 확인
	public MemberVo selectConfirmByNick(String member_nick);
	
	// 로그인
	public MemberVo selectByIdAndPw(MemberVo vo);
	
	// member_no로 회원 정보 가져오기
	public MemberVo selectAll(int member_no);
	
	// 닉네임으로 member_no 가져오기
	public int selectByNick(String member_nick);
	
	// member_no로 닉네임 가져오기
	public String selectByNo(int member_no);
	
	//좋아요 누른 상품 목록 출력
	public ArrayList<GoodsLikeVo> goodsLikeListByMemberNo(int member_no);
	
	//상품 정보 출력
	public GoodsVo selectGoodsInfo(int goods_no);
	
	// 좋아요 누른 레시피 목록 현정6
	public ArrayList<RecipeGoodVo> recipeGoodListByMemberNo(int member_no);
	
	//글 보기
	public RecipeVo selectByRecipeNo(int recipe_no);
	
	//회원 정보수정
	public void update(MemberVo vo);
	
	// 회원 정보 사진만 수정
	public void updatePhoto(@Param("member_profilephoto") String member_profilephoto, @Param("member_no") int member_no);
	
	// 아이디 찾기 현정7
	public ArrayList<String> selectId(@Param("member_email") String member_email, @Param("member_birth") String member_birth);
	
}
