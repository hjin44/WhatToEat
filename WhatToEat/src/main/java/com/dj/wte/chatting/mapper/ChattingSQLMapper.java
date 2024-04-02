package com.dj.wte.chatting.mapper;

import java.util.ArrayList;
import java.util.Date;

import org.apache.ibatis.annotations.Param;

import com.dj.wte.chatting.vo.AttendVo;
import com.dj.wte.chatting.vo.ChatRoomVo;
import com.dj.wte.chatting.vo.ChattingImageVo;
import com.dj.wte.chatting.vo.ChattingVo;

public interface ChattingSQLMapper {

	public int createKeyByChatRoom();
	
	//채팅방 생성
	public void insertByChatRoom(ChatRoomVo chatRoomVo);
	
	//채팅방 목록
	public ArrayList<ChatRoomVo> selectChatroom();
	//채팅방 검색
	public ArrayList<ChatRoomVo> selectByChatroomTitle(String search_chat_word);
	public ArrayList<ChatRoomVo> selectByChatroomKing(String search_chat_word);
	public ArrayList<ChatRoomVo> selectByMyChatroom(int member_no);
	
	//채팅방 개수
	public Integer numberOfChatroom();
	
	//채팅방
	public ChatRoomVo selectByChatNo(int chat_room_no);
	
	//채팅맴버
	public int createKeyByChatMember();
	
	//채팅맴버 삽입
	public void insertByChatMember(AttendVo attendVo);	
	//참가했습니다.....메세지
	public void insertByAttendChat(ChattingVo chattingVo);
	
	//지금 입장 맴버가 그 채팅방에 있는 지 검색
	public AttendVo selectTalkingMember(@Param("chat_room_no")int chat_room_no, @Param("member_no")int member_no);
	
	//채팅방에 있는 회원수
	public Integer countMember(int chat_room_no);
	
	//채팅방에 있는 맴버들 가져오기
	public ArrayList<AttendVo> selectChatMember(int chat_room_no);
	
	//채팅방 나가기
	public void outOfChat(@Param("chat_room_no")int chat_room_no, @Param("member_no")int member_no);
	//강퇴시키기
	public void walkoutOfChat(@Param("chat_room_no")int chat_room_no, @Param("member_no")int member_no);
	//지금 입장 맴버가 그 채팅방에서 퇴장 당했는 지 검색
	public AttendVo selectwalkoutMember(@Param("chat_room_no")int chat_room_no, @Param("member_no")int member_no);
	
	
	//채팅방 닫기
	public void closeChatroom(int chat_room_no);	
	public void closeChatroomAndMember(int chat_room_no);
	
	//채팅방 내용
	public int createKeyByChatting();
	public void insertChattingContent(ChattingVo vo);
	//채팅방 이비지
	public int createKeyByImage();
	public void insertChattingImage(ChattingImageVo vo);
	
	public ArrayList<ChattingVo> selectChatting(int chat_room_no);
	public AttendVo selectByChatAttendMemberNo(int chat_attend_member_no);
	
	//추가 대화만 업데이트
	public ArrayList<ChattingVo> selectAppendChatting(@Param("chat_room_no")int chat_room_no, @Param("chatting_date")Date chatting_date);
}
