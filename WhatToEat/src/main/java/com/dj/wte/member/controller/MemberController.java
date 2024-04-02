package com.dj.wte.member.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.dj.wte.member.service.MemberServiceImpl;
import com.dj.wte.member.vo.MemberVo;

@Controller
@RequestMapping("/member/*")
public class MemberController {

	@Autowired
	private MemberServiceImpl memberService;
	
	@RequestMapping("login_page.do")
	public String loginPage() {
		
		return "/member/login_page";
	}
	
	@RequestMapping("login_process.do")
	public String loginProcess(MemberVo vo, HttpSession session) {
		
		MemberVo sessionUser = memberService.login(vo);
		
		if(sessionUser != null) {
			
			session.setAttribute("sessionUser", sessionUser);
			
			return "redirect:../board/main_page.do";
		} else {
			
			return "/member/login_fail_page";
		}
		
	}
	
	@RequestMapping("logout_process.do")
	public String logoutProcess(HttpSession session, HttpServletRequest request) {
		
		session.invalidate();
		
		return "redirect:../board/main_page.do";
	}
	
	@RequestMapping("join_page.do")
	public String JoinPage() {
		
		return "/member/join_page";
	}
	
	@RequestMapping("join_process.do")
	public String joinProcess(MemberVo vo, String domain) {
		
		String email = vo.getMember_email() + "@" + domain;
		vo.setMember_email(email);
		
		memberService.joinMember(vo);
		
		return "/member/login_page";
	}
	
	//현정6
	@RequestMapping("mypage.do")
	public String mypage(HttpSession session, Model model) {
		
		MemberVo sessionUser = (MemberVo)session.getAttribute("sessionUser");
		int user_no = sessionUser.getMember_no();
		
		MemberVo memberVo = memberService.memberVoByNo(user_no);
		model.addAttribute("memberVo", memberVo);
		
		return "/member/mypage";
	}
	
	@RequestMapping("mypage_update.do")
	public String mypageUpdate(HttpSession session, MemberVo vo, MultipartFile file) {
		MemberVo sessionUser = (MemberVo)session.getAttribute("sessionUser");
		int user_no = sessionUser.getMember_no();
		
		if (!file.isEmpty()) {
			
			String uploadRootFolderName = "/upload_files/";
			Date today = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
			String todayFolder = sdf.format(today);
			String uploadFolderName = uploadRootFolderName + todayFolder;
			File uploadFolder = new File(uploadFolderName);
			
			if(!uploadFolder.exists()) {
				
				uploadFolder.mkdirs();
			}
			
			String originalFileName = file.getOriginalFilename();
			
			// 저장 시 파일명을 변경 
			// 목적 : 충돌 방지 (덮어씌우기 방지)
			// 방법 : 랜덤 + 시간
			String randomName = UUID.randomUUID().toString();
			long currentTime = System.currentTimeMillis();
			randomName += "_" + currentTime;
			
			// 확장자 추가 (오리지날 파일 이름에서 뽑아와야함)
			String ext = originalFileName.substring(originalFileName.lastIndexOf("."));
			
			randomName += ext;
			
			try {
				file.transferTo(new File(uploadFolderName + "/" + randomName));
				
			}catch (Exception e) {
				e.printStackTrace();
			}
			
			String profilephoto = "/upload/" + todayFolder + "/" + randomName;
			memberService.updatePhoto(profilephoto, user_no);
		}
		
		vo.setMember_no(user_no);
		
		memberService.updateMember(vo);
		
		return "redirect:./mypage.do";
	}
	
	@RequestMapping("mypage_heart.do")
	public String mypageHeart(HttpSession session, Model model) {
		
		MemberVo sessionUser = (MemberVo)session.getAttribute("sessionUser");
		int member_no = sessionUser.getMember_no();
		
		ArrayList<HashMap<String, Object>> recipeResultList =  memberService.RecipeGoodList(member_no);
		
		ArrayList<HashMap<String, Object>> goodsResultList = memberService.getGoodsLikeList(member_no);
		
		model.addAttribute("recipeResultList", recipeResultList);
		model.addAttribute("goodsResultList", goodsResultList);
		
		return "/member/mypage_heart";
	}
	
	@RequestMapping("Terms_of_service.do")
	public String Termsofservice() {
		
		return "/member/Terms_of_service";
	}
	
	@RequestMapping("Privacy_Policy.do")
	public String PrivacyPolicy() {
		
		return "/member/Privacy_Policy";
	}
	
	@RequestMapping("find_id_page.do")
	public String findIdPage() {
		
		return "/member/find_id_page";
	}
	
}
