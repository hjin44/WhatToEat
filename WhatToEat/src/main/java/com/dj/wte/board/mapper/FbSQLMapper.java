package com.dj.wte.board.mapper;

import java.util.ArrayList;


import com.dj.wte.board.vo.FbCategoryVo;

import com.dj.wte.board.vo.FbVo;



public interface FbSQLMapper {
		
		//키생성
		public int createKey();	
		//글쓰기...
		public void insert(FbVo vo);
		//전체 출력..
		public ArrayList<FbVo> selectAll(int page_num);
		
		//제목 검색...
		public ArrayList<FbVo> selectByTitle(String search_word);
		
		//내용 검색
		public ArrayList<FbVo> selectByContent(String search_word);
		
		//작성자 검색
		public ArrayList<FbVo> selectByWriter(String search_word);
			
		//글보기...
		public FbVo selectByNo(int no);
		//글 삭제
		public void deleteByNo(int no);
		//글 수정
		public void update(FbVo vo);
		
		//조회수 증가
		public void increaseReadCount(int no);

		//페이지 개수
		public int getPageCount();
		
		//카테고리
		public ArrayList<FbCategoryVo> selectByCategory();
		
		//카테고리 이름가져오기
			
		public FbCategoryVo selectByCategoryNo(int fb_category_no);
		
	
	
	

}
