package com.dj.wte.customer.controller;

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
import org.springframework.web.multipart.MultipartFile;

import com.dj.wte.customer.service.QnAServiceImpl;
import com.dj.wte.customer.vo.AskImageVo;
import com.dj.wte.customer.vo.AskVo;
import com.dj.wte.customer.vo.AssignVo;
import com.dj.wte.manager.service.AnswerServiceImpl;
import com.dj.wte.member.vo.MemberVo;

@Controller
@RequestMapping("/customer/*")
public class QnAController {
	
	@Autowired
	private QnAServiceImpl qnAService;
	
	@Autowired
	private AnswerServiceImpl answerService;
	
	@RequestMapping("carecenter_page.do")
	public String CarecenterPage(Model model, HttpSession session) {
		
		MemberVo sessionUser = (MemberVo)session.getAttribute("sessionUser");
		
		if(sessionUser != null) {
			int member_no = sessionUser.getMember_no();
			
			ArrayList<HashMap<String, Object>> askList = qnAService.getAskList(member_no);
		
			model.addAttribute("askList", askList);
			
			return "/customer/carecenter_page";
		}else {
			return "/board/main_page";
		}
		
		
		
		
	}
	
	@RequestMapping("ask_write_page.do")
	public String askWritePage() {
		return "/customer/ask_write_page";
	}
	
	@RequestMapping("ask_write_process.do")
	public String askWriteProcess(AskVo param, HttpSession session, MultipartFile [] files, AssignVo assignVo) {
		//이미지
		ArrayList<AskImageVo> imageVoList = new ArrayList<AskImageVo>();
		//파일 업로드
		for(MultipartFile file : files) {//파일이 여러개 날아올까봐 반복문
			
			if(file.getSize() <= 0) {//파일이 없어도 하나가 업로드 돼서 예외 처리 함
				continue;
			}//컨티뉴하면 아래 코드 실행 안됨
			
			//..../년도/월/일/랜덤_시간.jsp 이런식으로 저장되도록 폴더 만들거임
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
			
			//저장시... 파일명을 변경
			//목적 : 충돌 방지(덮어 씌우기 방지)
			//방법 : 랜덤+시간
			
			String randomName = UUID.randomUUID().toString();
			long currentTime = System.currentTimeMillis();
			
			randomName = randomName + "_" + currentTime;
			
			System.out.println("[test]" + randomName);
			
			//확장자 추가..(오리지널 파일 이름에서 뽑아와야됨)
			String ext = originalFileName.substring(originalFileName.lastIndexOf("."));
			
			randomName += ext;
			
			try {
				file.transferTo(new File(uploadFolderName + "/" + randomName));//transferTo=저장하겠다
									
			}catch(Exception e) {
				e.printStackTrace();
			}
			
			// ImageVo 객체 생성
			AskImageVo imageVo = new AskImageVo();
			
			String link = "/upload/" + todayFolder + "/" + randomName;
			imageVo.setImage_link(link);
			
			
			imageVoList.add(imageVo);
		}
		
		//데이터 처리
		MemberVo sessionUser = (MemberVo)session.getAttribute("sessionUser");//넘버가 필요해서 받아옴
		int member_no = sessionUser.getMember_no();
		
		param.setMember_no(member_no);
		
		qnAService.writeAsk(param, imageVoList, assignVo);
		
		return "redirect:./carecenter_page.do";
	}
	
	
	
	
	@RequestMapping("ask_read_page.do")
	public String askReadPage(Model model, int ask_no, HttpSession session) {
		MemberVo sessionUser = (MemberVo)session.getAttribute("sessionUser");
		
		if(sessionUser != null) {
			HashMap<String, Object> map = qnAService.getAsk(ask_no);
			//System.out.println("[map] : " + map);
			model.addAttribute("result", map);
			//System.out.println("[model] : " + model);
			
			ArrayList<HashMap<String, Object>> answerList = answerService.getAnswerList(ask_no);
			
			model.addAttribute("answerList", answerList);
			
			
			return "customer/ask_read_page";
		}else {
			return "/board/main_page";
		}
				
	}
	
	@RequestMapping("delete_ask_process.do")
	public String deleteAskProcess(int ask_no) {
		
		qnAService.deleteAsk(ask_no);
		
		return "redirect:./carecenter_page.do";
	}
	
}
