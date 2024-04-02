package com.dj.wte.member.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dj.wte.board.mapper.GoodsOrderSQLMapper;
import com.dj.wte.board.service.GoodsServiceImpl;
import com.dj.wte.member.service.MemberServiceImpl;
import com.dj.wte.member.vo.MemberVo;
import com.dj.wte.member.vo.PointVo;

@Controller
@RequestMapping("/member/*")
public class PointController {
	
	@Autowired
	private GoodsServiceImpl goodsService;
	
	@Autowired
	private MemberServiceImpl memberService;
	
	@RequestMapping("point_charge_page.do")
	public String PointChargePage(Model model, HttpSession session) {
		
		MemberVo memberVo = (MemberVo) session.getAttribute("sessionUser");
		int member_no = memberVo.getMember_no();
		
		//총 보유 포인트
		Integer totalPoint =  memberService.getTotalPoint(member_no);
		
		//사용한 포인트
		Integer usingPoint = goodsService.getTotalPrice(member_no);
		
		//보유 포인트에서 사용 포인트를 차감
		if(usingPoint != null) {
			totalPoint = totalPoint - usingPoint;
		}
		
		//회원 구매내역 리스트
		ArrayList<HashMap<String, Object>> orderList =  goodsService.getOrderList(member_no);
		
		model.addAttribute("totalPoint", totalPoint);
		model.addAttribute("orderList", orderList);
		
		return "/member/point_charge_page";
	}
	
	@RequestMapping("point_charge_process.do")
	public String PointChargeProcess(HttpSession session, PointVo vo) {
		
		MemberVo memberVo = (MemberVo) session.getAttribute("sessionUser");
		int member_no = memberVo.getMember_no();
		
		vo.setMember_no(member_no);
		
		memberService.chargePoint(vo);
		
		return "redirect:./point_charge_page.do";
	}
	
}
