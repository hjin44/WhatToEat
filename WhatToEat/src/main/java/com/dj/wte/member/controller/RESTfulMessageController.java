package com.dj.wte.member.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dj.wte.member.service.MemberServiceImpl;
import com.dj.wte.member.vo.AddressVo;
import com.dj.wte.member.vo.MemberVo;
import com.dj.wte.member.vo.MessageVo;

@Controller
@RequestMapping("/member/*")
@ResponseBody
public class RESTfulMessageController {
	
	@Autowired
	private MemberServiceImpl memberService;
	
	@RequestMapping("message_send_process.do")
	public void messageSendProcess(MessageVo vo, String target_nick, HttpSession session) {
		
		MemberVo memberVo = (MemberVo)session.getAttribute("sessionUser");
		
		int target_no = memberService.memberNo(target_nick);
		
		vo.setTarget_no(target_no);
		vo.setSender_no(memberVo.getMember_no());
		
		memberService.sendMessage(vo);

	}
	
	@RequestMapping("message_send_list.do")
	public ArrayList<HashMap<String, Object>> messagesendList(HttpSession session) {
		
		MemberVo memberVo = (MemberVo)session.getAttribute("sessionUser");
		
		ArrayList<HashMap<String, Object>> messageList = memberService.MessageSendList(memberVo.getMember_no());
		
		return messageList;
	}
	
	@RequestMapping("message_send_read.do")
	public HashMap<String, Object> messageSendRead(int message_no) {
		
		HashMap<String, Object> message = memberService.readSendMessage(message_no);
		
		return message;
	}
	
	@RequestMapping("message_get_list.do")
	public ArrayList<HashMap<String, Object>> messageGetList(HttpSession session) {
		
		MemberVo memberVo = (MemberVo)session.getAttribute("sessionUser");
		
		ArrayList<HashMap<String, Object>> messageList = memberService.MessageGetList(memberVo.getMember_no());
		
		return messageList;
	}
	
	@RequestMapping("message_get_read.do")
	public HashMap<String, Object> messageGetRead(int message_no) {
		
		HashMap<String, Object> message = memberService.readGetMessage(message_no);
		
		return message;
	}
	
	@RequestMapping("message_delete_process.do")
	public void messageDeleteProcess(int [] message_no) {
		
		for(int i = 0; i < message_no.length ; i++) {
			
			memberService.deleteMessage(message_no[i]);
			
		}
		
	}
	
	@RequestMapping("message_nick_confirm.do")
	public String addressNickConfirm(HttpSession session, String member_nick) {
		
		// 존재하는 닉네임 유효성 검사
		MemberVo nickConfirm = memberService.nickConfirm(member_nick);
		
		// 내 주소록에 있는 친구들 목록
		MemberVo sessionUser = (MemberVo)session.getAttribute("sessionUser");
		
		
		
		if(nickConfirm == null) {
			
			return "fail";
			
		} else {
			
			// 추가 할 친구의 member_no
			int memberNo = memberService.memberNo(member_nick);
			
			if(sessionUser.getMember_no() == memberNo) {
				
				return "me";
				
			}  else {
				
				return "success";
				
			}	
			
		}
		
	}
	
	@RequestMapping("message_count.do")
	public HashMap<String, Object> messageCount(HttpSession session){
		
		MemberVo memberVo = (MemberVo)session.getAttribute("sessionUser");
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		// 받은 전체 쪽지 수
		int getTotalMessage = memberService.getTotalMessage(memberVo.getMember_no());
		// 받은 안읽은 쪽지 수
		int getNotReadMessage = memberService.getNotReadMessage(memberVo.getMember_no());
		// 보낸 전체 쪽지 수
		int sendTotalMessage = memberService.sendTotalMessage(memberVo.getMember_no());
		// 보낸 안읽은 쪽지 수
		int sendNotReadMessage = memberService.sendNotReadMessage(memberVo.getMember_no());
		
		map.put("getTotalMessage", getTotalMessage);
		map.put("getNotReadMessage", getNotReadMessage);
		map.put("sendTotalMessage", sendTotalMessage);
		map.put("sendNotReadMessage", sendNotReadMessage);
		
		return map;
	}
	
}
