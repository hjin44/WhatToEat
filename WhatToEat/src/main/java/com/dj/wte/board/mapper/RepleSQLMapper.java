package com.dj.wte.board.mapper;

import java.util.ArrayList;

import com.dj.wte.board.vo.GoodsRepleVo;
import com.dj.wte.board.vo.GoodsVo;

public interface RepleSQLMapper {
	
	//댓글 작성
	public void insert(GoodsRepleVo vo);
	
	//댓글 리스트 출력
	public ArrayList<GoodsRepleVo> selectByNo(int goods_no);
	
	//댓글 삭제
	public void deleteByNo(GoodsRepleVo vo);
	
	//글 삭제 시 댓글 삭제
	public void chainDeleteByNo(int goods_no);
	
	//댓글 개수
	public int getRepleCount(int goods_no);
	
}
