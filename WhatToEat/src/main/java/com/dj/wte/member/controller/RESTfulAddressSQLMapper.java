package com.dj.wte.member.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dj.wte.member.service.MemberServiceImpl;
import com.dj.wte.member.vo.AddressVo;
import com.dj.wte.member.vo.MemberVo;

@Controller
@RequestMapping("/member/*")
@ResponseBody
public class RESTfulAddressSQLMapper {

	@Autowired
	private MemberServiceImpl memberService;
	
	@RequestMapping("address_nick_confirm.do")
	public String addressNickConfirm(HttpSession session, String member_nick) {
		
		// 존재하는 닉네임 유효성 검사
		MemberVo nickConfirm = memberService.nickConfirm(member_nick);
		
		// 내 주소록에 있는 친구들 목록
		MemberVo sessionUser = (MemberVo)session.getAttribute("sessionUser");
		ArrayList<AddressVo> friendsList = memberService.myFolderInAddress(sessionUser.getMember_no());
		
		boolean isFriend = false;
		
		if(nickConfirm == null) {
			
			return "fail";
			
		} else {
			
			// 추가 할 친구의 member_no
			int memberNo = memberService.memberNo(member_nick);
			
			for(AddressVo friendList : friendsList) {
				
				if(friendList.getMember_no() == memberNo) {
					isFriend = true;
				}
				
			}
			
			if(sessionUser.getMember_no() == memberNo) {
				
				return "me";
				
			} else if(isFriend == true) {
				
				return "already";
				
			} else {
				
				return "success";
				
			}
			
		}
		
	}
	
}
