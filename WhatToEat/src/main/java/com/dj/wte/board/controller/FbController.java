package com.dj.wte.board.controller;

import javax.servlet.http.HttpSession;







import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import org.springframework.web.multipart.MultipartFile;

import com.dj.wte.board.service.FbServiceImpl;
import com.dj.wte.board.vo.FbCategoryVo;
import com.dj.wte.board.vo.FbGoodVo;
import com.dj.wte.board.vo.FbImageVo;
import com.dj.wte.board.vo.FbRepleVo;
import com.dj.wte.board.vo.FbVo;

import com.dj.wte.member.vo.MemberVo;


import java.io.File;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@RequestMapping("/board/*")
public class FbController {
	
	
	@Autowired
	private FbServiceImpl fbService;
	
	@RequestMapping("fb_page.do")
	public String FbPage(Model model , String search_word , String search_type , @RequestParam(value="page_num",defaultValue = "1") int page_num) {
		
		ArrayList<HashMap<String, Object>> resultList = 
				fbService.getContentList(search_word , search_type , page_num);
		
		int pageCount = fbService.getPageCount();
		
		int currentPage = page_num;
		int beginPage = ((currentPage-1)/5)*5 + 1;
		int endPage = ((currentPage-1)/5 + 1)*(5);		
		
		if(endPage > pageCount) {
			endPage = pageCount;
		}
		
		
		model.addAttribute("resultList", resultList);
		model.addAttribute("currentPage" , currentPage);
		model.addAttribute("beginPage" , beginPage);
		model.addAttribute("endPage" , endPage);
		model.addAttribute("pageCount", pageCount);
		
		return "/board/fb_page";
	}
	
	@RequestMapping("fb_write_page.do")
	public String writeContentPage(Model model) {
		
		ArrayList<FbCategoryVo> fbCategoryVo = fbService.categoryList();
		
		model.addAttribute("fbCategoryVo", fbCategoryVo);
		
		
		return "/board/fb_write_page";
	}
	
	@RequestMapping("fb_write_process.do")
	public String writeContentProcess(HttpSession session, FbVo param , MultipartFile [] files) {
		
		ArrayList<FbImageVo> imageVoList = new ArrayList<FbImageVo>();
		
		//업로드....
		for(MultipartFile file : files) {
			
			if(file.getSize() <= 0) {
				continue;
			}
			
			//날짜별 폴더를 만들기....!!!
			// ..../년도/월/일/랜덤_시간.jpg ...
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
			
			//저장시.. 파일명을 변경 
			//목적 : 충돌 방지(덮어 씌우기 방지)
			//방법 : 랜덤 + 시간
			
			String randomName = UUID.randomUUID().toString();
			long currentTime = System.currentTimeMillis();
			
			randomName = randomName + "_" + currentTime;
			
			//확장자 추가...(오리지널 파일 이름에서 뽑아와야됨)
			String ext = originalFileName.substring(originalFileName.lastIndexOf("."));
			
			randomName += ext;

			try {
				file.transferTo(new File(uploadFolderName + "/" + randomName));
											
				
			}catch(Exception e) {		
				e.printStackTrace();
			}
			
			//..ImageVo 객체 생성....
			FbImageVo fbimageVo = new FbImageVo();
			
			String link = "/upload/" + todayFolder + "/" + randomName;
			fbimageVo.setFbimage_link(link);
			
			imageVoList.add(fbimageVo);
			
			
			
		}
				
		//데이터 처리....
		MemberVo sessionUser = (MemberVo)session.getAttribute("sessionUser");
				
		int member_no = sessionUser.getMember_no(); 
		
		param.setMember_no(member_no);
		
		fbService.writeContent(param , imageVoList);
		
		return "redirect:./fb_page.do";
	}
	@RequestMapping("fb_read_page.do")
	public String readContentPage(Model model,int fb_no, HttpSession session) {
		
		HashMap<String, Object> map = fbService.getContent(fb_no);
		
		ArrayList<HashMap<String, Object>> repleList = new ArrayList<HashMap<String,Object>>();
		repleList = fbService.getRepleList(fb_no);
		
		int repleCount = fbService.getRepleCount(fb_no);
		int goodCount = fbService.getGoodCount(fb_no);
		
		
		model.addAttribute("result",map);
		model.addAttribute("repleList", repleList);
		model.addAttribute("repleCount", repleCount);
		model.addAttribute("goodCount", goodCount);
		
		return "board/fb_read_page";
	}
	
	
	@RequestMapping("fb_delete_process.do")
	public String deleteContentProcess(int fb_no) { 
		
		fbService.deleteContent(fb_no);
		fbService.fbRepleDeleteByFbNo(fb_no);
		
		return "redirect:./fb_page.do";
	}
	
	
	@RequestMapping("fb_update_page.do")
	public String updateContentPage(Model model , int fb_no) {
		
		HashMap<String, Object> map = fbService.getContent(fb_no);
		
		model.addAttribute("result", map);
		
		return "board/fb_update_page";
	}
	
	
	@RequestMapping("fb_update_process.do")
	public String updateContentProcess(FbVo param) {
		
		fbService.updateContent(param);
		
		return "redirect:./fb_page.do";
	}
	
	@RequestMapping("write_fbreple_process.do")
	public String WriteRepleProcess(FbRepleVo param, HttpSession session, int fb_no) {
		
		int member_no = ((MemberVo)session.getAttribute("sessionUser")).getMember_no();
		param.setMember_no(member_no);
		
		fbService.writeReple(param);
		
		return "redirect:./fb_read_page.do?fb_no=" + fb_no;
	}
	
	
	@RequestMapping("delete_fbreple_process.do")
	public String DeleteRepleProcess(FbRepleVo vo, int fb_no) {
		
		vo.getFb_reple_no();
		fbService.deleteReple(vo);
		
		return "redirect:./fb_read_page.do?fb_no=" + fb_no;
	}
	
	@RequestMapping("fb_good_process.do")
	public String FbGoodProcess(HttpSession session, FbGoodVo vo, int fb_no) {
		
		MemberVo sessionUser = (MemberVo) session.getAttribute("sessionUser");
		int member_no = sessionUser.getMember_no();
		vo.setMember_no(member_no);
		vo.setFb_no(fb_no);
		
		FbGoodVo fbgoodVo = fbService.goodCheck(vo);
		
		if(fbgoodVo == null) {
			fbService.good(vo);
		}else {
			int fb_good_no = fbgoodVo.getFb_good_no();
			
			fbService.deleteGood(fb_good_no);
		}
		
		return "redirect:./fb_read_page.do?fb_no=" + fb_no;
	}
	
	
	
	
	
}
