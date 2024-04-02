package com.dj.wte.board.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.dj.wte.board.vo.GoodsBasketVo;

public interface GoodsBasketSQLMapper {
	
	//장바구니 추가
	public void insert(GoodsBasketVo vo);
	
	//장바구니 목록
	public ArrayList<GoodsBasketVo> selectAll(int member_no);
	
	//장바구니 정보 가져오기
	public GoodsBasketVo selectByNo(int basket_no);
	
	//장바구니 삭제
	public void deleteByNo(GoodsBasketVo vo);
	
	//상품 삭제시 장바구니 삭제
	public void chainDeleteByNo(int goods_no);
}
