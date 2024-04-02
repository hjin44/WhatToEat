package com.dj.wte.board.mapper;

import java.util.ArrayList;

import com.dj.wte.board.vo.GoodsImageVo;

public interface GoodsImageSQLMapper {
	
	//이미지 첨부
	public void insert(GoodsImageVo vo);
	
	//이미지 출력
	public ArrayList<GoodsImageVo> selectByGoodsNo(int goods_no);
	
	//대표이미지 출력
	public GoodsImageVo selectByGoodsOne(int goods_no);
	
	//글 삭제 시 사진 자동 삭제
	public void chainDeleteByNo(int goods_no);
	
}
