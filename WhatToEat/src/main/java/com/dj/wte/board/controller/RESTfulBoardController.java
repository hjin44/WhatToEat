package com.dj.wte.board.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dj.wte.board.service.GoodsServiceImpl;
import com.dj.wte.board.vo.GoodsLikeVo;
import com.dj.wte.member.vo.MemberVo;

@Controller
@RequestMapping("/board/*")
@ResponseBody
public class RESTfulBoardController {
	
	@Autowired
	private GoodsServiceImpl goodsService;
	
	@RequestMapping("goods_like_count.do")
	public int getLikeCount(int goods_no) {
		
		int countGL = goodsService.getLikeCount(goods_no);
		
		return countGL;
	}
	
	@RequestMapping("goods_like_process.do")
	public void GoodsLikeProcess(HttpSession session, GoodsLikeVo vo, int goods_no) {
		
		MemberVo memberVo = (MemberVo) session.getAttribute("sessionUser");
		int member_no = memberVo.getMember_no();
		
		vo.setGoods_no(goods_no);
		vo.setMember_no(member_no);
		
		GoodsLikeVo likevo = goodsService.likeCheck(vo);
		
		if(likevo == null) {
			goodsService.like(vo);
		}else {
			int goods_like_no = likevo.getGoods_like_no();
			
			goodsService.deleteLike(goods_like_no);
		}
		
	}
	
	@RequestMapping("goods_like_count_heart_color.do")
	public int getLikeCountHeart(HttpSession session, int goods_no) {
		
		MemberVo sessionUser = (MemberVo)session.getAttribute("sessionUser");
		int userNo = 0;
		
		if(sessionUser != null) {
			userNo = sessionUser.getMember_no();
		}
		
		GoodsLikeVo param = new GoodsLikeVo();
		param.setGoods_no(goods_no);
		param.setMember_no(userNo);
		
		int goodsLikeCount = goodsService.getLikeCountByMember(param);
		
		return goodsLikeCount;
	}
	
}
