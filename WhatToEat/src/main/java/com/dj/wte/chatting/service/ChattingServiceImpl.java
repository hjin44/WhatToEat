package com.dj.wte.chatting.service;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.dj.wte.chatting.mapper.ChattingSQLMapper;
import com.dj.wte.chatting.vo.AttendVo;
import com.dj.wte.chatting.vo.ChatRoomVo;
import com.dj.wte.chatting.vo.ChattingImageVo;
import com.dj.wte.chatting.vo.ChattingVo;
import com.dj.wte.member.mapper.MemberSQLMapper;
import com.dj.wte.member.vo.MemberVo;

@Service
public class ChattingServiceImpl {
	
	@Autowired
	private ChattingSQLMapper chattingSQLMapper;
	
	@Autowired
	private MemberSQLMapper memberSQLMapper;

	//채팅방 생성
	public void openChatRoom(ChatRoomVo chatRoomVo, AttendVo attendVo, ChattingVo chattingVo) {
		int ChatRoomPK = chattingSQLMapper.createKeyByChatRoom();
		
		chatRoomVo.setChat_room_no(ChatRoomPK);
		//System.out.println("chatRoomVo : " + chatRoomVo);
		//System.out.println("ChatRoomPK : " + ChatRoomPK);
		chattingSQLMapper.insertByChatRoom(chatRoomVo);
		
		int chat_room_no = chatRoomVo.getChat_room_no();
		System.out.println("chat_room_no : " + chat_room_no);
		
		int AttendPk = chattingSQLMapper.createKeyByChatMember();
		attendVo.setChat_attend_member_no(AttendPk);
		attendVo.setChat_room_no(chat_room_no);
		
		chattingSQLMapper.insertByChatMember(attendVo);
		
		int member_no = attendVo.getMember_no();
		MemberVo memberVo = memberSQLMapper.selectAll(member_no);
		
		String member_nick = memberVo.getMember_nick();
		

		int ChattingPk = chattingSQLMapper.createKeyByChatting();
		chattingVo.setChatting_message_no(ChattingPk);
		chattingVo.setChat_room_no(chat_room_no);
		chattingVo.setChat_attend_member_no(AttendPk);
		chattingVo.setChatting_content(member_nick+"님이 입장하셨습니다.");
		
		chattingSQLMapper.insertByAttendChat(chattingVo);
		
		return;
	}
	
	public ArrayList<HashMap<String, Object>> getChatroomList(HttpSession session, String chatroom_search_type, String search_chat_word){
		
		MemberVo loginVo = (MemberVo)session.getAttribute("sessionUser");
		int login_member = loginVo.getMember_no();
		
		ArrayList<HashMap<String, Object>> resultList = new ArrayList<HashMap<String,Object>>();
		
		ArrayList<ChatRoomVo> chatroomList = null;
		
		if(search_chat_word == null || chatroom_search_type == null) {
			
			chatroomList = chattingSQLMapper.selectChatroom();
			
		}else {
			
			if(chatroom_search_type.equals("title")) {
				
				chatroomList = chattingSQLMapper.selectByChatroomTitle(search_chat_word);
				
			}else if(chatroom_search_type.equals("king")){
				
				chatroomList = chattingSQLMapper.selectByChatroomKing(search_chat_word);
				
			}else {
				chatroomList = chattingSQLMapper.selectChatroom();

			}
		}
				
		for(ChatRoomVo chatroomVo : chatroomList) {
			int member_no = chatroomVo.getMember_no();
			
			//System.out.println("member_no : " + member_no);
			MemberVo memberVo = memberSQLMapper.selectAll(member_no);

			int chat_room_no = chatroomVo.getChat_room_no();			
			//Integer countMember = chattingSQLMapper.countMember(chat_room_no);
			
			
			ArrayList<AttendVo> attendList = chattingSQLMapper.selectChatMember(chat_room_no);
			int attendcount = attendList.size();
			
			AttendVo talkingVo = chattingSQLMapper.selectTalkingMember(chat_room_no, login_member);
			
			AttendVo exportVo = chattingSQLMapper.selectwalkoutMember(chat_room_no, login_member);
			
			System.out.println("talkingVo : " + talkingVo);
			System.out.println("exportVo : " + exportVo);
			
			boolean xxx = true;//채팅방 안에 있는 회원이야..
			
			if(talkingVo == null) {
				xxx = false;//채팅방 안에 맴버가 없어...
			}
			
			boolean export = true;//강퇴 안 당한 사람
			
			if(exportVo != null) {
				export = false;//강퇴 당한 회원
			}
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("memberVo", memberVo);
			map.put("chatroomVo", chatroomVo);
			map.put("attendcount", attendcount);
			map.put("xxx", xxx);
			map.put("export", export);
			resultList.add(map);
		}
		return resultList;
	}
	
	public ArrayList<HashMap<String, Object>> getMyChatroomList(int login_member){

		ArrayList<HashMap<String, Object>> resultList = new ArrayList<HashMap<String,Object>>();
		
		ArrayList<ChatRoomVo> chatroomList = chattingSQLMapper.selectByMyChatroom(login_member);
		
		for(ChatRoomVo chatroomVo : chatroomList) {
			int member_no = chatroomVo.getMember_no();

			MemberVo memberVo = memberSQLMapper.selectAll(member_no);
			int chat_room_no = chatroomVo.getChat_room_no();			

			ArrayList<AttendVo> attendList = chattingSQLMapper.selectChatMember(chat_room_no);
			int attendcount = attendList.size();
			
			AttendVo talkingVo = chattingSQLMapper.selectTalkingMember(chat_room_no, login_member);
			

			boolean xxx = true;//채팅방 안에 있는 회원이야..
			
			if(talkingVo == null) {
				xxx = false;//채팅방 안에 맴버가 없어
			}
			

			
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("memberVo", memberVo);
			map.put("chatroomVo", chatroomVo);
			map.put("attendcount", attendcount);
			map.put("xxx", xxx);
			

			resultList.add(map);			
		}
		return resultList;
	}
	
	public Integer numberOfChatroom() {
		Integer chatroomCount = chattingSQLMapper.numberOfChatroom();
		//System.out.println("chatroomCount : " + chatroomCount);
		if(chatroomCount == null) {
			chatroomCount = 0;
		}
		return chatroomCount;
	}
	
	//채팅
	public HashMap<String, Object> getChat(int chat_room_no){
		
		ChatRoomVo chatroomVo = chattingSQLMapper.selectByChatNo(chat_room_no);
		//System.out.println("chatRoomVo : " + chatroomVo);
		
		int member_no = chatroomVo.getMember_no();
		MemberVo memberVo = memberSQLMapper.selectAll(member_no);
		
		Integer countMember = chattingSQLMapper.countMember(chat_room_no);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("memberVo", memberVo);
		map.put("chatroomVo", chatroomVo);
		map.put("countMember", countMember);
		
		return map;
	}
	
	public void attendChat(HttpSession session, int chat_room_no, AttendVo attendVo, ChattingVo chattingVo){
		
		MemberVo memberVo = (MemberVo)session.getAttribute("sessionUser");
		int member_no = memberVo.getMember_no();
		String member_nick = memberVo.getMember_nick();
		
		AttendVo talkingVo = chattingSQLMapper.selectTalkingMember(chat_room_no, member_no);
		

		if(talkingVo == null) {
			//없으면 attentVo에 맴버 삽입
			
			int AttendPk = chattingSQLMapper.createKeyByChatMember();
			attendVo.setChat_attend_member_no(AttendPk);
			attendVo.setChat_room_no(chat_room_no);
			attendVo.setMember_no(member_no);
			attendVo.setChat_room_owner("member");
			
			chattingSQLMapper.insertByChatMember(attendVo);
			
			
			int ChattingPk = chattingSQLMapper.createKeyByChatting();
			chattingVo.setChatting_message_no(ChattingPk);
			chattingVo.setChat_room_no(chat_room_no);
			chattingVo.setChat_attend_member_no(AttendPk);
			chattingVo.setChatting_content(member_nick+"님이 입장하셨습니다.");
			
			chattingSQLMapper.insertByAttendChat(chattingVo);
			
			
		}		
	}
	
	public ArrayList<HashMap<String, Object>> getAttendMember(int chat_room_no){
		
		ArrayList<HashMap<String, Object>> resultList = new ArrayList<HashMap<String,Object>>();
		
		ArrayList<AttendVo> attendList = chattingSQLMapper.selectChatMember(chat_room_no);
		int attendcount = attendList.size();
		//System.out.println("attendcount : " + attendcount);
		
		for(AttendVo attendVo : attendList) {
			int member_no = attendVo.getMember_no();
			MemberVo memberVo = memberSQLMapper.selectAll(member_no);
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("attendVo", attendVo);
			map.put("memberVo", memberVo);
			
			resultList.add(map);	
		}
		return resultList;
	}
	
	public boolean isAttend(int chat_room_no, HttpSession session) {
				
		MemberVo memberVo = (MemberVo)session.getAttribute("sessionUser");
		int member_no = memberVo.getMember_no();
		
		AttendVo attendVo = chattingSQLMapper.selectTalkingMember(chat_room_no, member_no);
		
		boolean isAttend = true;
		
		if(attendVo == null) {
			isAttend = false;
		}else {
			isAttend = true;
		}
		
		return isAttend;
	}
	
	public void chatOut(int chat_room_no, HttpSession session, AttendVo attendVo, ChattingVo chattingVo) {
		MemberVo memberVo = (MemberVo)session.getAttribute("sessionUser");
		int member_no = memberVo.getMember_no();
		String member_nick = memberVo.getMember_nick();
		
		attendVo = chattingSQLMapper.selectTalkingMember(chat_room_no, member_no);
		int chat_attend_member_no = attendVo.getChat_attend_member_no();
		
		int ChattingPk = chattingSQLMapper.createKeyByChatting();
		chattingVo.setChatting_message_no(ChattingPk);
		chattingVo.setChat_room_no(chat_room_no);
		chattingVo.setChat_attend_member_no(chat_attend_member_no);
		chattingVo.setChatting_content(member_nick+"님이 퇴장하셨습니다.");
		
		chattingSQLMapper.insertByAttendChat(chattingVo);
		
		chattingSQLMapper.outOfChat(chat_room_no, member_no);
	}
	
	public void exportMember(int chat_room_no, int member_no, ChattingVo chattingVo) {
		
		MemberVo memberVo = memberSQLMapper.selectAll(member_no);
		String member_nick = memberVo.getMember_nick();
		
		AttendVo attendVo = chattingSQLMapper.selectTalkingMember(chat_room_no, member_no);
		int chat_attend_member_no = attendVo.getChat_attend_member_no();

		int ChattingPk = chattingSQLMapper.createKeyByChatting();
		chattingVo.setChatting_message_no(ChattingPk);
		chattingVo.setChat_room_no(chat_room_no);
		chattingVo.setChat_attend_member_no(chat_attend_member_no);
		chattingVo.setChatting_content(member_nick+"님을 내보냈습니다.");
		
		chattingSQLMapper.insertByAttendChat(chattingVo);
		
		//chattingSQLMapper.outOfChat(chat_room_no, member_no);
		chattingSQLMapper.walkoutOfChat(chat_room_no, member_no);		
	}
	
	public void closeChatroom(int chat_room_no) {
		chattingSQLMapper.closeChatroom(chat_room_no);
		chattingSQLMapper.closeChatroomAndMember(chat_room_no);
	}


	
	
	////////////////////////////////////////////////////////////
	//채팅방 내용
	public void writeChatting(ChattingVo vo, int chatting_member, MultipartFile [] chat_image) {
		int ChattingPk = chattingSQLMapper.createKeyByChatting();
		vo.setChatting_message_no(ChattingPk);
		
		int chat_room_no = vo.getChat_room_no();
		
		AttendVo attendVo = chattingSQLMapper.selectTalkingMember(chat_room_no, chatting_member);
		int chat_attend_member_no = attendVo.getChat_attend_member_no();
		
		//System.out.println("chat_image : " + chat_image);
		//System.out.println("vo.getChatting_content() : " + vo.getChatting_content());
		
		if(chat_image == null || chat_image.length == 0) {
			
			//chatting_member에 현재 유저no가 담겨 있는 데 이거를 참가회원에서 참가 번호로 가져와야돼 
			vo.setChat_attend_member_no(chat_attend_member_no);
			
			chattingSQLMapper.insertChattingContent(vo);			
			
		}else {
			
			//파일 업로드
			ArrayList<ChattingImageVo> imageList = new ArrayList<ChattingImageVo>();
			
			for(MultipartFile file : chat_image) {
				
				if(file.getSize() <= 0) {
					continue;
				}
				
				//날짜별 폴더 만들기
				//..../년도/월/일/랜덤_시간.jsp
				String uploadRootFolderName = "/upload_files/";
				
				Date today = new Date(); 
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
				String todayFolder = sdf.format(today);
				
				String uploadFolderName = uploadRootFolderName + todayFolder;
				
				File uploadFolder = new File(uploadFolderName); 
				
				if(!uploadFolder.exists()) {
					uploadFolder.mkdirs();
				}

				String originalFileName = file.getOriginalFilename();
				
				//저장시... 파일명을 변경
				//목적 : 충돌 방지(덮어 씌우기 방지)
				//방법 : 랜덤+시간
				
				String randomName = UUID.randomUUID().toString();
				long currentTime = System.currentTimeMillis();
				
				randomName = randomName + "_" + currentTime;
	
				//System.out.println("[test]" + randomName);
				
				//확장자 추가..(오리지널 파일 이름에서 뽑아와야됨)
				String ext = originalFileName.substring(originalFileName.lastIndexOf("."));
				
				randomName += ext;
				
				try {
					file.transferTo(new File(uploadFolderName + "/" + randomName));//transferTo=저장하겠다
								
				}catch(Exception e) {
					e.printStackTrace();
				}
				
				String link = "/upload/" + todayFolder + "/" + randomName;
				
				boolean aaa = vo.getChatting_content().isEmpty();
				if(aaa != true) {
					
					vo.setChat_attend_member_no(chat_attend_member_no);
					
					chattingSQLMapper.insertChattingContent(vo);	
				}

				vo.setChatting_content(link);				
				vo.setChat_attend_member_no(chat_attend_member_no);
				
				chattingSQLMapper.insertChattingContent(vo);				
			}
			
		}
		
	}

	
	public ArrayList<HashMap<String, Object>> getChattingList(int chat_room_no){
		ArrayList<HashMap<String, Object>> result = new ArrayList<HashMap<String,Object>>();
		
		ArrayList<ChattingVo> chattingList = chattingSQLMapper.selectChatting(chat_room_no);
		
		
		
		for(int chattinglistSize = chattingList.size()-1; chattinglistSize < chattingList.size(); chattinglistSize++) {
			
			ChattingVo chattingVo = chattingList.get(chattinglistSize);
			Date time = chattingVo.getChatting_date();
			
		}
		
		for(ChattingVo chattingVo : chattingList) {
			
			int chat_attend_member_no = chattingVo.getChat_attend_member_no();
			AttendVo attendVo = chattingSQLMapper.selectByChatAttendMemberNo(chat_attend_member_no);
			
			int member_no = attendVo.getMember_no();
			MemberVo memberVo = memberSQLMapper.selectAll(member_no);
	
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("chattingVo", chattingVo);
			map.put("memberVo", memberVo);
			
			result.add(map);
		}		
		return result;
	}
	
	public ArrayList<HashMap<String, Object>> getAppendChattingList(int chat_room_no , long lastRefreshTime){
		ArrayList<HashMap<String, Object>> result = new ArrayList<HashMap<String,Object>>();
		
		Date chatting_date = new Date(lastRefreshTime);
		
		ArrayList<ChattingVo> appendchatList = chattingSQLMapper.selectAppendChatting(chat_room_no, chatting_date);

		for(ChattingVo chattingVo : appendchatList) {
			int chat_attend_member_no = chattingVo.getChat_attend_member_no();
			AttendVo attendVo = chattingSQLMapper.selectByChatAttendMemberNo(chat_attend_member_no);
			
			int member_no = attendVo.getMember_no();
			MemberVo memberVo = memberSQLMapper.selectAll(member_no);
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			//map.put("chattingVo", chattingVo);
			//map.put("memberVo", memberVo);
			
			map.put("member_no", memberVo.getMember_no());
			map.put("nick" , memberVo.getMember_nick());
			map.put("content" , chattingVo.getChatting_content());
			map.put("writeDate" , chattingVo.getChatting_date());
			
			
			result.add(map);			
		}
		

		
		return result;
	}
	
	public HashMap<String, Object> getRoomName(int chat_room_no){
		ChatRoomVo vo = chattingSQLMapper.selectByChatNo(chat_room_no);
		//System.out.println("[vo]" + vo);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("vo", vo);
		
		return map;
	}
	
}
