package com.dj.wte.chatting.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dj.wte.chatting.service.ChattingServiceImpl;
import com.dj.wte.chatting.vo.AttendVo;
import com.dj.wte.chatting.vo.ChatRoomVo;
import com.dj.wte.chatting.vo.ChattingVo;
import com.dj.wte.member.vo.MemberVo;


@Controller
@RequestMapping("/chatting/*")
public class ChattingController {
	
	@Autowired
	private ChattingServiceImpl chattingService;


	@RequestMapping("chatroom_list_page.do")
	public String chatroomListPage(Model model, HttpSession session, String chatroom_search_type, String search_chat_word) {
		
		MemberVo sessionUser = (MemberVo)session.getAttribute("sessionUser");
		
		if(sessionUser != null) {
			ArrayList<HashMap<String, Object>> chatroomList = chattingService.getChatroomList(session, chatroom_search_type, search_chat_word);
		
			model.addAttribute("chatroomList", chatroomList);
			
			Integer chatroomCount = chattingService.numberOfChatroom();
			
			model.addAttribute("chatroomCount", chatroomCount);
		
			return "/chatting/chatroom_list_page";
		}else {
			return "/board/main_page";
		}
	}
	
	//채팅방 개설하기
	@RequestMapping("chat_open_page.do")
	public String chatOpenPage() {		
		return "/chatting/chat_open_page";
	}
	
	//채팅방 개설 프로세스
	@RequestMapping("chat_open_process.do")
	public String chatOpenProcess(ChatRoomVo chatRoomVo, AttendVo attendVo, HttpSession session, ChattingVo chattingVo) {
		 
		MemberVo sessionUser = (MemberVo)session.getAttribute("sessionUser");
		int member_no = sessionUser.getMember_no();
		 
		chatRoomVo.setMember_no(member_no);
		 
		chattingService.openChatRoom(chatRoomVo, attendVo, chattingVo);
		 
		int chat_room_no = chatRoomVo.getChat_room_no();
		//System.out.println("[chat_room_no] : " + chat_room_no);
		
		return "redirect:./chatting_page.do?chat_room_no="+chat_room_no;
	}
	
	//채팅방 정보들 가져오기...
	@RequestMapping("chatting_page.do")
	public String chattingPage(Model model, int chat_room_no, HttpSession session) {
		
		MemberVo sessionUser = (MemberVo)session.getAttribute("sessionUser");
		
		if(sessionUser != null) {
					
			HashMap<String, Object> map = chattingService.getChat(chat_room_no);
			
			model.addAttribute("chat", map);
			
			ArrayList<HashMap<String, Object>> attendList = chattingService.getAttendMember(chat_room_no);
			
			model.addAttribute("attendList", attendList);
			
			return "/chatting/chatting_page";
		
		}else {
			return "/board/main_page";
		}

	}
	
	//채팅방 참여 프로세스
	@RequestMapping("chat_attend_process.do")
	public String chatAttentProcess(HttpSession session, int chat_room_no, AttendVo attendVo, ChattingVo chattingVo) {
		//참가자수 증가
		//nick이 참가했습니다
		chattingService.attendChat(session, chat_room_no, attendVo, chattingVo);
		
		return "redirect:./chatting_page.do?chat_room_no="+chat_room_no;
	}
	
	//채팅방 나가기 프로세스
	@RequestMapping("chat_out_process.do")
	public String chatOutProcess(HttpSession session, int chat_room_no, AttendVo attendVo, ChattingVo chattingVo) {
		chattingService.chatOut(chat_room_no, session, attendVo, chattingVo);
		
		return "redirect:./chatroom_list_page.do";
	}
	
	@RequestMapping("export_member_process.do")
	public String exportMemberProcess(int chat_room_no, int member_no, ChattingVo chattingVo) {
		chattingService.exportMember(chat_room_no, member_no, chattingVo);
		
		return "redirect:./chatting_page.do?chat_room_no="+chat_room_no;
	}
	
	@RequestMapping("chat_close_process.do")
	public String closeChatroom(int chat_room_no) {
		chattingService.closeChatroom(chat_room_no);
		
		return "redirect:./chatroom_list_page.do";
	}
}
