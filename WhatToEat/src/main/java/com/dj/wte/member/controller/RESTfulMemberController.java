package com.dj.wte.member.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dj.wte.member.service.MemberServiceImpl;
import com.dj.wte.member.vo.AddressVo;
import com.dj.wte.member.vo.MemberAuthVo;
import com.dj.wte.member.vo.MemberVo;

@Controller
@RequestMapping("/member/*")
@ResponseBody
public class RESTfulMemberController {

	@Autowired
	private MemberServiceImpl memberService;
	
	@RequestMapping("login_confirm.do")
	public String loginProcess(MemberVo vo) {
		
		MemberVo loginConfirm = memberService.login(vo);
		
		if(loginConfirm != null) {
			
			return "success";
			
		} else {
			
			return "fail";
			
		}
		
	}
	
	@RequestMapping("id_confirm.do")
	public String idConfirm(String member_id) {
		
		MemberVo idConfirm = memberService.idConfirm(member_id);
		
		if(idConfirm == null) {
			
			return "success";
			
		} else {
			
			return "fail";
			
		}
		
	}
	
	@RequestMapping("nick_confirm.do")
	public String nickConfirm(String member_nick) {
		
		MemberVo nickConfirm = memberService.nickConfirm(member_nick);
		
		if(nickConfirm == null) {
			
			return "success";
			
		} else {
			
			return "fail";
			
		}
		
	}
	
	@RequestMapping("auth.do")
	public void auth(String member_email) {
		
		memberService.Auth(member_email);
		
	}
	
	@RequestMapping("authConfirm.do")
	public String authConfirm(String member_email, int auth_key) {
		
		MemberAuthVo memberAuthVo = memberService.AuthConfirm(member_email);
		
		if(memberAuthVo.getAuth_key() == auth_key) {
			
			return "success";
			
		} else {
			
			return "fail";
			
		}	
	}
	
	@RequestMapping("find_id_process.do")
	public ArrayList<String> findIdProcess(String member_birth, String member_email) {
		
		System.out.println(member_birth);
		System.out.println(member_email);
		ArrayList<String> idList =memberService.fingId(member_email, member_birth);
		
		return idList;
	}
	
}
