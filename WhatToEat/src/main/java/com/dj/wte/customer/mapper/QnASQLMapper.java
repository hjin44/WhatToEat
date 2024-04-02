package com.dj.wte.customer.mapper;

import java.util.ArrayList;

import com.dj.wte.customer.vo.AskVo;
import com.dj.wte.customer.vo.AssignVo;


public interface QnASQLMapper {

	//전체 질문 목록 가져오기
	public ArrayList<AskVo> selectAll(int member_no);
	
	//키생성
	public int createKey();

	//질문하기
	public void insert(AskVo vo);
	
	//질문글 보기
	public AskVo selectByNo(int ask_no);
	
	//배정테이블 가져오기
	public AssignVo selectByAssign(int ask_no);
	
	public int createKeyAssign();
	
	//질문 배정
	public void insertAssign(int ask_no);
	
	public void deleteByAsk(int ask_no);
	public void deleteByAssign(int ask_no);
}
