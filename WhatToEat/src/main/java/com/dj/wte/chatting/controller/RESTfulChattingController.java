package com.dj.wte.chatting.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.dj.wte.chatting.mapper.ChattingSQLMapper;
import com.dj.wte.chatting.service.ChattingServiceImpl;
import com.dj.wte.chatting.vo.AttendVo;
import com.dj.wte.chatting.vo.ChatRoomVo;
import com.dj.wte.chatting.vo.ChattingImageVo;
import com.dj.wte.chatting.vo.ChattingVo;
import com.dj.wte.member.service.MemberServiceImpl;
import com.dj.wte.member.vo.AddressVo;
import com.dj.wte.member.vo.MemberVo;

@Controller
@RequestMapping("/chatting/*")
@ResponseBody
public class RESTfulChattingController {
	
	@Autowired
	private ChattingServiceImpl chattingService;
	
	@Autowired
	private ChattingSQLMapper chattingSQLMapper;
	
	@Autowired
	private MemberServiceImpl memberService;
	
	@RequestMapping("write_chat_process.do")
	public void writeChatProcess(ChattingVo param, int chatting_member, MultipartFile [] chat_image) {
		chattingService.writeChatting(param, chatting_member, chat_image);
	
	}
	
	@RequestMapping("write_popchat_process.do")
	public void writePopChatProcess(ChattingVo param, int chatting_member, MultipartFile [] chat_image) {
		chattingService.writeChatting(param, chatting_member, chat_image);
	
	}
	
	
	@RequestMapping("get_chatting_list.do")
	public ArrayList<HashMap<String, Object>> getChattingList(int chat_room_no){
		
		ArrayList<HashMap<String, Object>> chat = chattingService.getChattingList(chat_room_no);
		
		return chat;
	}
	
	@RequestMapping("get_append_chatting_list.do")
	public HashMap<String, Object> getAppendChattingList(int chat_room_no , HttpSession session , @RequestParam(value = "lastRefreshTime" , defaultValue = "0") long lastRefreshTime){
		//mk
		HashMap<String, Object> resultData = new HashMap<String, Object>();
		
		//보안 처리....
		boolean isAttend = chattingService.isAttend(chat_room_no, session);
		resultData.put("isAttend", isAttend);
		
		if(isAttend == false) {
			resultData.put("result", "fail");
			resultData.put("reason", "잘못된 접근 입니다.");
			return resultData;
		}

		ArrayList<HashMap<String, Object>> appendchat = chattingService.getAppendChattingList(chat_room_no ,lastRefreshTime);
		
		resultData.put("chatDatas", appendchat);


		
		return resultData;
	}
	
	@RequestMapping("get_mychatroom_list.do")
	public HashMap<String, Object> getMyChatroomList(HttpSession session){
		//mk
		HashMap<String,Object> resultData = new HashMap<String,Object>();
		
		//보안...처리...
		MemberVo memberVo = (MemberVo)session.getAttribute("sessionUser");
		
		if(memberVo == null) {
			resultData.put("result", "fail");
			resultData.put("reason", "로그인을 하셔야 됩니다.");
		}else {
			ArrayList<HashMap<String, Object>> chatroom = chattingService.getMyChatroomList(memberVo.getMember_no());
			resultData.put("result", "success");
			resultData.put("data", chatroom);
			
		}
		
		return resultData;
	}
	
	@RequestMapping("get_refresh_member.do")
	public ArrayList<HashMap<String, Object>> getAttendMember(int chat_room_no) {
		ArrayList<HashMap<String, Object>> attendList = chattingService.getAttendMember(chat_room_no);
		return attendList;
	}
	
	

	@RequestMapping("get_room_name.do")
	public HashMap<String, Object> getRoomName(int chat_room_no){
		
		HashMap<String, Object> name = chattingService.getRoomName(chat_room_no);
		
		return name;
	}
	
	@RequestMapping("chatout_process.do")
	public void chatout(int chat_room_no, HttpSession session, AttendVo attendVo, ChattingVo chattingVo) {
		chattingService.chatOut(chat_room_no, session, attendVo, chattingVo);
		
		MemberVo loginVo = (MemberVo)session.getAttribute("sessionUser");
		int login_member = loginVo.getMember_no();
		
		ChatRoomVo vo = chattingSQLMapper.selectByChatNo(chat_room_no);
		int member_no = vo.getMember_no();
		
		if(login_member == member_no) {
			chattingService.closeChatroom(chat_room_no);
		}
	}
	
	@RequestMapping("chat_address_add_process.do")
	public void addressAddProcess(int login_member, int member_no, AddressVo addressVo) {
		memberService.addChatAddress(login_member, member_no, addressVo);
	}
	
}
