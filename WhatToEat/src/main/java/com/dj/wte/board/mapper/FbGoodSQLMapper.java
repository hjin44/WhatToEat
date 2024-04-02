package com.dj.wte.board.mapper;


import com.dj.wte.board.vo.FbGoodVo;




public interface FbGoodSQLMapper {
	
		//좋아요
		public void good(FbGoodVo vo);
		
		//좋아요 여부 검사
		public FbGoodVo selectByNo(FbGoodVo vo);
		
		//좋아요 취소
		public void deleteGood(int fb_good_no);
		
		//좋아요 갯수
		public int getGoodCount(int fb_no);
	
	
	
	
	
	
	
	

}
