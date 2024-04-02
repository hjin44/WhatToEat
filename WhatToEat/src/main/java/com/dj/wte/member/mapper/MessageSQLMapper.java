package com.dj.wte.member.mapper;

import java.util.ArrayList;

import com.dj.wte.member.vo.MessageVo;

public interface MessageSQLMapper {

	// 쪽지 보내기
	public void insertMessage(MessageVo vo);
	
	// 받은 쪽지 리스트 보기
	public ArrayList<MessageVo> selectByTarget(int target_no);
	
	// 보낸 쪽지 리스트 보기
	public ArrayList<MessageVo> selectBySender(int sender_no);
	
	// 특정 쪽기 보기
	public MessageVo selectByNo(int message_no);
	
	// 쪽지 확인 완료
	public void updateConfirm(int message_no);
	
	// 쪽지 삭제
	public void deleteMessage(int message_no);
	
	// 받은 쪽지 전체 수
	public int getTotalMessage(int target_no);
	
	// 받은 쪽지 중 안읽은 쪽지 수
	public int getNotReadMessage(int target_no);
	
	// 보낸 쪽지 전체 수
	public int sendTotalMessage(int sender_no);
	
	// 보낸 쪽지 중 안읽은 쪽지 수
	public int sendNotReadMessage(int sender_no);
}