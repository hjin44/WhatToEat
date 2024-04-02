package com.dj.wte.board.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.dj.wte.board.service.GoodsServiceImpl;
import com.dj.wte.board.vo.GoodsBasketVo;
import com.dj.wte.board.vo.GoodsImageVo;
import com.dj.wte.board.vo.GoodsOrderVo;
import com.dj.wte.board.vo.GoodsRepleVo;
import com.dj.wte.board.vo.GoodsVo;
import com.dj.wte.member.service.MemberServiceImpl;
import com.dj.wte.member.vo.MemberVo;

@Controller
@RequestMapping("/board/*")
public class GoodsController {
	
	@Autowired
	private MemberServiceImpl memberService;
	
	@Autowired
	private GoodsServiceImpl goodsService;
	
	@RequestMapping("goods_page.do")
	   public String GoodsPage(HttpSession session, Model model, String search_word, String search_type, @RequestParam(value="page_num",defaultValue = "1") int page_num) {
	      
	      MemberVo sessionUser = (MemberVo)session.getAttribute("sessionUser");
	      
	      if(sessionUser != null) {
	         Integer userNo = sessionUser.getMember_no();
	         ArrayList<HashMap<String, Object>> resultList = goodsService.getGoodsList(userNo, search_word, search_type, page_num);
	         model.addAttribute("resultList", resultList);
	         
	      }else {
	         ArrayList<HashMap<String, Object>> resultList = goodsService.getGoodsList(null, search_word, search_type, page_num);
	         model.addAttribute("resultList", resultList);
	      }
	      
	      
	      Integer goodsCount = goodsService.getGoodsCount();
	      
	      int pageCount = goodsService.getPageCount();
	      
	      int currentPage = page_num;
	      int beginPage = ((currentPage-1)/5)*5 + 1;
	      int endPage = ((currentPage-1)/5 + 1)*5;
	      
	      if(endPage > pageCount) {
	         endPage = pageCount;
	      }
	      
	      model.addAttribute("pageCount", pageCount);
	      model.addAttribute("currentPage", currentPage);
	      model.addAttribute("beginPage", beginPage);
	      model.addAttribute("endPage", endPage);
	      model.addAttribute("goodsCount", goodsCount);
	      
	      return "board/goods_page";
	   }
	
	@RequestMapping("regist_goods_page.do")
	public String RegistGoodsPage() {
		
		return "board/regist_goods_page";
	}
	
	@RequestMapping("regist_goods_process.do")
	public String RegistGoodsProcess(HttpSession session, GoodsVo vo, MultipartFile [] files) {
		
		ArrayList<GoodsImageVo> imageVoList = new ArrayList<GoodsImageVo>();
		
		//업로드
		for(MultipartFile file : files) {
			
			//예외처리
			if(file.getSize() <= 0) {
				continue;
			}
			
			//날짜별 폴더 만들기 (.../년도/월/일/랜덤_시간.확장자명)
			String uploadRootFolderName = "/upload_files/";
			
			//날짜별 폴더 생성
			Date today = new Date(); 
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
			String todayFolder = sdf.format(today);
			
			String uploadFolderName = uploadRootFolderName + todayFolder;
			
			File uploadFolder = new File(uploadFolderName);
			
			if(!uploadFolder.exists()) {
				uploadFolder.mkdirs();
			}
			
			String originalFileName = file.getOriginalFilename();
			
			//저장시 파일명 변경 (충돌-덮어씌우기 방지)
			//랜덤파일명 + 시간
			String randomName = UUID.randomUUID().toString();
			long currentTime = System.currentTimeMillis();
			
			randomName = randomName + "_" + currentTime;
			
			//확장자 추가(오리지널 파일이름에서 뽑아옴)
			String ext = originalFileName.substring(originalFileName.lastIndexOf("."));
			
			randomName += ext;
			
			//절대경로 + 파일명
			try {
				file.transferTo(new File(uploadFolderName + "/" + randomName));
			}catch(Exception e) {
				e.printStackTrace();
			}
			
			//ImageVo 객체 생성
			GoodsImageVo imageVo = new GoodsImageVo();
			
			//최종 이미지 링크 설정
			String link = "/upload/" + todayFolder + "/" + randomName;
			imageVo.setGoods_image_link(link);
			
			imageVoList.add(imageVo);
		}
		
		MemberVo sessionUser = (MemberVo) session.getAttribute("sessionUser");
		int member_no = sessionUser.getMember_no();
		
		vo.setMember_no(member_no);
		
		if(imageVoList == null || imageVoList.equals("")) {
			
			return "redirect:./alert_page.do";
		}else {
			goodsService.registGoods(vo, imageVoList);
			
			return "redirect:./goods_page.do";
		}
		
	}
	
	@RequestMapping("show_goods_page.do")
	public String ShowGoodsPage(Model model, int goods_no) {
		
		HashMap<String, Object> map = goodsService.getGoods(goods_no);
		
		ArrayList<HashMap<String, Object>> repleList = new ArrayList<HashMap<String,Object>>();
		repleList = goodsService.getRepleList(goods_no);
		
		int repleCount = goodsService.getRepleCount(goods_no);
		
		//int likeCount = goodsService.getLikeCount(goods_no);
		
		//상품 재고 추출
		Integer goodsAmount = goodsService.getGoodsAmount(goods_no);
		
		//총 주문 수량 추출
		Integer totalOrderAmount = goodsService.getTotalOrderAmount(goods_no);
		
		model.addAttribute("result", map);
		model.addAttribute("repleList", repleList);
		model.addAttribute("repleCount", repleCount);
		model.addAttribute("goodsAmount", goodsAmount);
		model.addAttribute("totalOrderAmount", totalOrderAmount);
		//model.addAttribute("likeCount", likeCount);
		
		return "board/show_goods_page";
	}
	
	@RequestMapping("delete_goods_process.do")
	public String DeleteGoodsProcess(int goods_no) {
		
		//연쇄 삭제(상품글 삭제 시 해당 상품 이미지,댓글,좋아요,장바구니내역 자동 삭제)
		goodsService.deleteGoods(goods_no);
		goodsService.chainDeleteImage(goods_no);
		goodsService.chainDeleteReple(goods_no);
		goodsService.chainDeleteLike(goods_no);
		goodsService.chainDeleteBasket(goods_no);
		
		return "redirect:./goods_page.do";
	}
	
	@RequestMapping("update_goods_page.do")
	public String UpdateGoodsPage(Model model, int goods_no) {
		
		HashMap<String, Object> map = goodsService.getGoods(goods_no);
		
		model.addAttribute("result", map);
		
		return "board/update_goods_page";
	}
	
	@RequestMapping("update_goods_process.do")
	public String UpdateGoodsProcess(GoodsVo vo) {
		
		goodsService.updateGoods(vo);
		
		return "redirect:./goods_page.do";
	}
	
	@RequestMapping("write_reple_process.do")
	public String WriteRepleProcess(GoodsRepleVo param, HttpSession session, int goods_no) {
		
		int member_no = ((MemberVo)session.getAttribute("sessionUser")).getMember_no();
		param.setMember_no(member_no);
		
		goodsService.writeReple(param);
		
		return "redirect:./show_goods_page.do?goods_no=" + goods_no;
	}
	
	@RequestMapping("delete_reple_process.do")
	public String DeleteRepleProcess(int goods_no, int goods_reply_no, GoodsRepleVo vo) {
		
		vo.setGoods_no(goods_no);
		vo.setGoods_reply_no(goods_reply_no);
		
		goodsService.deleteReple(vo);
		
		return "redirect:./show_goods_page.do?goods_no=" + goods_no;
	}
	
	/*
	@RequestMapping("goods_like_process.do")
	public String GoodsLikeProcess(HttpSession session, GoodsLikeVo vo, int goods_no) {
		
		MemberVo sessionUser = (MemberVo) session.getAttribute("sessionUser");
		int member_no = sessionUser.getMember_no();
		vo.setMember_no(member_no);
		vo.setGoods_no(goods_no);
		
		GoodsLikeVo likeVo = goodsService.likeCheck(vo);
		
		if(likeVo == null) {
			goodsService.like(vo);
		}else {
			int goods_like_no = likeVo.getGoods_like_no();
			
			goodsService.deleteLike(goods_like_no);
		}
		
		return "redirect:./show_goods_page.do?goods_no=" + goods_no;
	}
	*/
	
	@RequestMapping("goods_order_page.do")
	public String GoodsOrderPage(Model model, HttpSession session, int goods_no, int basket_amount) {
		
		MemberVo memberVo = (MemberVo) session.getAttribute("sessionUser");
		int member_no = memberVo.getMember_no();
		
		//상품정보 가져오기(-->전화번호,상품명,가격)
		GoodsVo goodsVo = goodsService.getGoodsInfo(goods_no);
		
		Integer totalPoint = memberService.getTotalPoint(member_no);
		
		Integer usingPoint = goodsService.getTotalPrice(member_no);
		
		model.addAttribute("memberVo", memberVo);
		model.addAttribute("goodsVo", goodsVo);
		model.addAttribute("amount", basket_amount);
		model.addAttribute("totalPoint", totalPoint);
		model.addAttribute("usingPoint", usingPoint);
		
		return "board/goods_order_page";
	}
	
	@RequestMapping("goods_order_process.do")
	public String GoodsOrderProcess(HttpSession session, GoodsOrderVo vo, int goods_no) {
		
		MemberVo memberVo = (MemberVo) session.getAttribute("sessionUser");
		int member_no = memberVo.getMember_no();
		
		vo.setMember_no(member_no);
		vo.setGoods_no(goods_no);
		
		//주문 금액 추출
		GoodsVo goodsVo = goodsService.getGoodsInfo(goods_no);
		int goods_price = goodsVo.getGoods_price();
		
		//총 보유포인트
		Integer totalPoint = memberService.getTotalPoint(member_no);
		
		goodsService.orderGoods(vo);
			
		//보유 포인트 - 결제 금액 (차감)
		totalPoint = totalPoint - goods_price;
		
		int order_no = vo.getOrder_no();
				
		return "redirect:./goods_order_complete_page.do?order_no=" + order_no + "&goods_no=" + goods_no;
	}
	
	@RequestMapping("goods_order_complete_page.do")
	public String GoodsOrderComplete(HttpSession session, Model model, int order_no, int goods_no) {
		
		GoodsOrderVo orderResult = goodsService.getOrderResult(order_no);
		
		GoodsVo goodsVo = goodsService.getGoodsInfo(goods_no);
		
		MemberVo memberVo = (MemberVo) session.getAttribute("sessionUser");
		
		//상품 재고 추출
		Integer goodsAmount = goodsService.getGoodsAmount(goods_no);
				
		//총 주문 수량 추출
		Integer totalOrderAmount = goodsService.getTotalOrderAmount(goods_no);
		
		model.addAttribute("result", orderResult);
		model.addAttribute("goodsVo", goodsVo);
		model.addAttribute("memberVo", memberVo);
		model.addAttribute("goodsAmount", goodsAmount);
		model.addAttribute("totalOrderAmount", totalOrderAmount);
		
		return "board/goods_order_complete_page";
	}
	
	@RequestMapping("goods_basket_page.do")
	public String GoodsBasketPage(HttpSession session, Model model) {
		
		MemberVo memberVo = (MemberVo) session.getAttribute("sessionUser");
		
		int member_no = memberVo.getMember_no();
		
		ArrayList<HashMap<String, Object>> basketList = goodsService.getBasketList(member_no);
		
		model.addAttribute("basketList", basketList);
		
		return "board/goods_basket_page";
	}
	
	@RequestMapping("goods_basket_process.do")
	public String GoodsBasketProcess(HttpSession session, GoodsBasketVo vo, int goods_no, int basket_amount) {
		
		MemberVo memberVo = (MemberVo) session.getAttribute("sessionUser");
		int member_no = memberVo.getMember_no();
		
		vo.setMember_no(member_no);
		vo.setGoods_no(goods_no);
		vo.setBasket_amount(basket_amount);
		
		goodsService.insert(vo);
		
		return "redirect:./goods_basket_page.do";
	}
	
	@RequestMapping("goods_basket_delete_process.do")
	public int GoodsBasketDeleteProcess(HttpSession session, GoodsBasketVo vo, @RequestParam(value = "chbox[]") ArrayList<String> chArr) {
		
		MemberVo memberVo = (MemberVo) session.getAttribute("sessionUser");
		int member_no = memberVo.getMember_no();
		
		int result = 0;
		int basket_no = 0;
		
		//로그인 상태일 때(예외처리)
		if(memberVo != null) { 
			vo.setMember_no(member_no);
			
			//Ajax에서 전송받는 배열 chbox를 리스트형 변수 chArr로 받은 뒤, for문을 이용해 chArr이 가지고 있는 값의 갯수만큼 반복
			for(String i : chArr) {   
				basket_no = Integer.parseInt(i);
				vo.setBasket_no(basket_no);
				goodsService.deleteBasket(vo);
			}
			
			result = 1; //로그인 상태일 때, 숫자 1을 리턴
		}  
		
		return result;
	}
	
}
