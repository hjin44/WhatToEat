package com.dj.wte.manager.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.dj.wte.customer.vo.AskVo;
import com.dj.wte.manager.vo.AnswerVo;

public interface AnswerSQLMapper {

	public ArrayList<AskVo> selectByAnswer(@Param("manager_no")int manager_no);
	
	public ArrayList<AskVo> selectByPrepare(@Param("manager_no")int manager_no);
	
	public ArrayList<AskVo> selectByComplete(@Param("manager_no")int manager_no);
	
	//답변 삽입
	public void insert(AnswerVo vo);
	
	public int createKey();
	
	//답변 완료 업데이트
	public void update(int ask_no);
	
	//답변 가져오기
	public ArrayList<AnswerVo> getAnswer(int assign_no);
	
	public void deleteAnswer(int assign_no);
	
	public void deleteupdate(int ask_no);
	
	public void answerUpdate(@Param("answer_content")String answer_content, @Param("assign_no")int assign_no);
	
	public void transferAnswer(@Param("select_manager")int select_manager, @Param("assign_no") int assign_no);
}
