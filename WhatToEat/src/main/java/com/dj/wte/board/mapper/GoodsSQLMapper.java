package com.dj.wte.board.mapper;

import java.util.ArrayList;

import com.dj.wte.board.vo.GoodsVo;

public interface GoodsSQLMapper {
	
	//글번호 증가
	public int createKey();
	
	//글 작성
	public void insert(GoodsVo vo);
	
	//글 리스트 출력
	public ArrayList<GoodsVo> selectAll(int page_num);
	
	//글 리스트 출력(메인 페이지)
	public ArrayList<GoodsVo> selectAllInMain();
	
	//글 보기
	public GoodsVo selectByNo(int no);
	
	//상품명별 검색
	public ArrayList<GoodsVo> selectByGoods(String search_word);
	
	//내용별 검색
	public ArrayList<GoodsVo> selectByInfo(String search_word);
	
	//작성자 검색
	public ArrayList<GoodsVo> selectByWriter(String search_word);
	
	//글 수정
	public void update(GoodsVo vo);
	
	//글 삭제
	public void deleteByNo(int no);
	
	//상품 갯수
	public Integer getGoodsCount();
	
	//조회수 증가
	public void increaseCount(int no);
	
	//페이징
	public int getPageCount();
	
	//상품 재고 출력
	public Integer getAmountByNo(int goods_no);
	
}
