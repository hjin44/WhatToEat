package com.dj.wte.member.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dj.wte.member.service.MemberServiceImpl;
import com.dj.wte.member.vo.AddressFolderVo;
import com.dj.wte.member.vo.AddressVo;
import com.dj.wte.member.vo.MemberVo;

@Controller
@RequestMapping("/member/*")
public class AddressController {
	
	@Autowired
	private MemberServiceImpl memberService;
	
	@RequestMapping("address_list_page.do")
	public String addressListPage(HttpSession session, Model model) {

		MemberVo memberVo = (MemberVo)session.getAttribute("sessionUser");
		
		if(memberVo == null) {
			return "/member/login_need_page";
		}
		
		ArrayList<HashMap<String, Object>> addressLists = memberService.address(memberVo.getMember_no());
		model.addAttribute("addressLists", addressLists);
		
		return "/member/address_list_page";
	}
	
	@RequestMapping("create_address_folder_process.do")
	public String createAddressFolderProcess(int member_no, AddressFolderVo vo) {
		
		vo.setMember_no(member_no);
		
		memberService.createAddressFolder(vo);
		
		return "redirect:./address_list_page.do";
	}
	
	@RequestMapping("address_add_process.do")
	public String addressAddProcess(AddressVo vo, String member_nick) {
		
		int member_no = memberService.memberNo(member_nick);
		
		vo.setMember_no(member_no);
		
		memberService.addAddress(vo);
		
		return "redirect:./address_list_page.do";
	}
	
	@RequestMapping("address_edit_page.do")
	public String addressEditPage(HttpSession session, int address_folder_no, Model model) {
		
		MemberVo memberVo = (MemberVo)session.getAttribute("sessionUser");
		
		if(memberVo == null) {
			return "/member/login_need_page";
		}
		
		AddressFolderVo addressFolderVo = memberService.addressFolder(address_folder_no);
		
		model.addAttribute("addressFolderVo", addressFolderVo);
		
		return "/member/address_edit_page";
	}
	
	@RequestMapping("address_edit_process.do")
	public String addressEditProcess(AddressFolderVo vo) {
		
		memberService.changeAddressFolderName(vo);
		
		return "redirect:./address_list_page.do";
	}
	
	@RequestMapping("address_folder_change_process.do")
	public String addressFolderChange(AddressVo vo) {
		
		memberService.changeAddressFolder(vo);
		
		return "redirect:./address_list_page.do";
	}
	
	@RequestMapping("address_folder_and_address_delete_process.do")
	public String addressFolderANDAddressDeleteProcess(int address_folder_no) {
		
		memberService.deleteAddressFolderANDAddress(address_folder_no);
		
		return "redirect:./address_list_page.do";
	}
	
	@RequestMapping("address_folder_only_delete_process.do")
	public String addressFolderOnlyDeleteProcess(HttpSession session, AddressFolderVo vo) {
		
		MemberVo memberVo = (MemberVo)session.getAttribute("sessionUser");
		
		vo.setMember_no(memberVo.getMember_no());
		memberService.deleteOnlyAddressFolder(vo);
		
		return "redirect:./address_list_page.do";
	}
	
	@RequestMapping("address_delete_process.do")
	public String addressDeleteProcess(int address_no) {
		
		memberService.deleteAddress(address_no);
		
		return "redirect:./address_list_page.do";
	}
	
}
