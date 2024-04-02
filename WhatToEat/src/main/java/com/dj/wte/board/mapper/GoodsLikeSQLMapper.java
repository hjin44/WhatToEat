package com.dj.wte.board.mapper;

import com.dj.wte.board.vo.GoodsLikeVo;

public interface GoodsLikeSQLMapper {
	
	//좋아요
	public void like(GoodsLikeVo vo);
	
	//좋아요 여부 검사
	public GoodsLikeVo selectByNo(GoodsLikeVo vo);
	
	//좋아요 취소
	public void deleteLike(int goods_like_no);
	
	//글 삭제 시 좋아요 삭제
	public void chainDeleteByNo(int goods_no);
	
	//좋아요 갯수
	public int getLikeCount(int goods_no);
	
	//한 사람이 좋아요 누른거 카운트 -> 좋아요 중복클릭 방지 (하트 색깔)
	public int selectCountByGoodsNoAndMemberNo(GoodsLikeVo vo);
}
