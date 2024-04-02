package com.dj.wte.board.mapper;

import java.util.ArrayList;



import com.dj.wte.board.vo.FbRepleVo;




public interface FbRepleSQLMapper{
		
				
		//댓글 작성
		public void insert(FbRepleVo vo);
		
		//댓글 리스트 출력
		public ArrayList<FbRepleVo> selectByNo(int fb_no);
		
		//댓글 삭제
		public void deleteByNo(FbRepleVo vo);
		
		//댓글 개수
		public int getRepleCount(int fb_no);
		
		//글 삭제 시 댓글 삭제
		public void fbdeleteByFbNo(int fb_no);
		
		
}
