package com.dj.wte.member.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dj.wte.member.service.MemberServiceImpl;
import com.dj.wte.member.vo.MemberVo;
import com.dj.wte.member.vo.MessageVo;

@Controller
@RequestMapping("/member/*")
public class MessageController {
	
	@Autowired
	private MemberServiceImpl memberService;
	
	@RequestMapping("message_getlist_page.do")
	public String messageGetListPage(HttpSession session, Model model, String target_nick) {
		
		if(target_nick != null) {
			model.addAttribute("target_nick", target_nick);
		}
		
		MemberVo memberVo = (MemberVo)session.getAttribute("sessionUser");
		
		if(memberVo == null) {
			return "/member/login_need_page";
		}
		
		ArrayList<HashMap<String, Object>> messageList = memberService.MessageGetList(memberVo.getMember_no());
		model.addAttribute("messageLists", messageList);
		
		ArrayList<HashMap<String, Object>> addressLists = memberService.address(memberVo.getMember_no());
		model.addAttribute("addressLists", addressLists);
		
		int totalMessage = memberService.getTotalMessage(memberVo.getMember_no());
		model.addAttribute("totalMessage", totalMessage);
		
		int notReadMessage = memberService.getNotReadMessage(memberVo.getMember_no());
		model.addAttribute("notReadMessage", notReadMessage);
		
		return "/member/message_getlist_page";
	}
	
	@RequestMapping("message_sendlist_page.do")
	public String messagesendListPage(HttpSession session, Model model) {
		
		MemberVo memberVo = (MemberVo)session.getAttribute("sessionUser");
		
		if(memberVo == null) {
			return "/member/login_need_page";
		}
		
		ArrayList<HashMap<String, Object>> messageList = memberService.MessageSendList(memberVo.getMember_no());
		model.addAttribute("messageLists", messageList);
		
		ArrayList<HashMap<String, Object>> addressLists = memberService.address(memberVo.getMember_no());
		model.addAttribute("addressLists", addressLists);
		
		int totalMessage = memberService.sendTotalMessage(memberVo.getMember_no());
		model.addAttribute("totalMessage", totalMessage);
		
		int notReadMessage = memberService.sendNotReadMessage(memberVo.getMember_no());
		model.addAttribute("notReadMessage", notReadMessage);
		
		return "/member/message_sendlist_page";
	}
	
}
