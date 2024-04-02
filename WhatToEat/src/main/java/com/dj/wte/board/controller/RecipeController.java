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
import org.springframework.web.multipart.MultipartFile;

import com.dj.wte.board.service.RecipeServiceImpl;
import com.dj.wte.board.vo.GroupVo;
import com.dj.wte.board.vo.RecipeContentVo;
import com.dj.wte.board.vo.RecipeKindVo;
import com.dj.wte.board.vo.RecipeNationalVo;
import com.dj.wte.board.vo.RecipeVo;
import com.dj.wte.member.vo.MemberVo;

@Controller
@RequestMapping("/board/*")
public class RecipeController {
	
	@Autowired
	private RecipeServiceImpl recipeService;
	
	@RequestMapping("recipe_page.do")
	public String RecipePage(HttpSession session, Model model, Integer member_no, Integer national_no) {
		
		ArrayList<GroupVo> groupVo = recipeService.groupList();
		ArrayList<RecipeNationalVo> nationalVo = recipeService.nationalList();
		ArrayList<RecipeKindVo> kindVo = recipeService.kindList();
		
		model.addAttribute("groupVo", groupVo);
		model.addAttribute("nationalVo", nationalVo);
		model.addAttribute("kindVo", kindVo);
		
		
		//현정추가2222222222
		MemberVo sessionUser = (MemberVo)session.getAttribute("sessionUser");
		
		if(sessionUser != null) {
			Integer userNo = sessionUser.getMember_no();
			ArrayList<HashMap<String, Object>> recipeResultList = recipeService.recipeList(member_no,userNo,national_no);
			model.addAttribute("recipeResultList", recipeResultList);
			
			//글 개수
			int countRecipe = recipeResultList.size();
			model.addAttribute("countRecipe",countRecipe);
			
		}else {
			ArrayList<HashMap<String, Object>> recipeResultList = recipeService.recipeList(member_no,null,national_no);
			model.addAttribute("recipeResultList", recipeResultList);
			
			//글 개수
			int countRecipe = recipeResultList.size();
			model.addAttribute("countRecipe",countRecipe);
		}
		
		return "/board/recipe_page";
	}
   
	// 현정 추가 /////////////////////
	@RequestMapping("recipe_write_page.do")
	public String RecipeWritePage(Model model) {
		
		ArrayList<GroupVo> groupVo = recipeService.groupList();
		ArrayList<RecipeNationalVo> nationalVo = recipeService.nationalList();
		ArrayList<RecipeKindVo> kindVo = recipeService.kindList();
		
		model.addAttribute("groupVo", groupVo);
		model.addAttribute("nationalVo", nationalVo);
		model.addAttribute("kindVo", kindVo);
		
		ArrayList<String> subgroupName = recipeService.subgroupList();
		model.addAttribute("subgroupName", subgroupName);
      
		return "/board/recipe_write_page";
	}
	
	@RequestMapping("recipe_write_process.do")
	public String RecipeWriteProcess(HttpSession session, RecipeVo recipeParam, MultipartFile thumbnail_file, int [] subgroup_nos, String [] ingredient_recipe_quantitys, String [] recipe_contents, MultipartFile [] image_files, String [] user_add_ingredients) {
		
		MemberVo sessionUser = (MemberVo)session.getAttribute("sessionUser");
		int member_no = sessionUser.getMember_no();
		
		if(user_add_ingredients != null) {
		
			//유저가 추가한 재료를 인서트하고 바로 서브그룹넘버로 셀렉트 해옴
			int [] userAddSubNo = recipeService.userIngredientAdd(member_no, user_add_ingredients);
			int j = 0;
			
			for(int i = 0 ; i < subgroup_nos.length ; i++) {
				
				if(subgroup_nos[i] == 0) {
					
					subgroup_nos[i] = userAddSubNo[j++];
				}
			}
		}
		
		//레시피 게시판 인서트-------------------------
		// 날짜별 폴더 만들기 (.../년도/월/일/랜덤_시간.확장자명)
		String uploadRootFolderName = "/upload_files/";
		Date today = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
		String todayFolder = sdf.format(today);
		String uploadFolderName = uploadRootFolderName + todayFolder;
		File uploadFolder = new File(uploadFolderName);
		
		if(!uploadFolder.exists()) {
			
			uploadFolder.mkdirs();
		}
		
		String originalFileName = thumbnail_file.getOriginalFilename();
		
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
			thumbnail_file.transferTo(new File(uploadFolderName + "/" + randomName));
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		String recipe_mainphoto = "/upload/" + todayFolder + "/" + randomName;
		
		recipeParam.setMember_no(member_no);
		recipeParam.setRecipe_mainphoto(recipe_mainphoto);
		
		recipeService.writeRecipe(recipeParam);
		
		// 재료 인서트할때 레시피 넘버 필요
		int recipe_no = recipeParam.getRecipe_no();
		
		recipeService.writeIngredientRecipe(subgroup_nos, ingredient_recipe_quantitys, recipe_no);
		
		//레시피 컨텐트 인서트-------------------------
		String[] recipeContentImageList = new String [image_files.length];
		int i = 0;
		
		// 업로드
		for(MultipartFile file : image_files) {
			
			// 예외처리
			if(file.getSize() <= 0) {
				continue;	
			}
			
			// 날짜별 폴더 만들기 (.../년도/월/일/랜덤_시간.확장자명)
			uploadRootFolderName = "/upload_files/";
			
			today = new Date();
			sdf = new SimpleDateFormat("yyyy/MM/dd");
			todayFolder = sdf.format(today);
			uploadFolderName = uploadRootFolderName + todayFolder;
			uploadFolder = new File(uploadFolderName);
			
			if(!uploadFolder.exists()) {
				
				uploadFolder.mkdirs();
			}
			
			originalFileName = file.getOriginalFilename();
			
			// 저장 시 파일명을 변경 
			// 목적 : 충돌 방지 (덮어씌우기 방지)
			// 방법 : 랜덤 + 시간
			randomName = UUID.randomUUID().toString();
			currentTime = System.currentTimeMillis();
			randomName += "_" + currentTime;
			
			// 확장자 추가 (오리지날 파일 이름에서 뽑아와야함)
			ext = originalFileName.substring(originalFileName.lastIndexOf("."));
			randomName += ext;
			
			try {
				file.transferTo(new File(uploadFolderName + "/" + randomName));
				
			}catch (Exception e) {
				e.printStackTrace();
			}
			
			String link = "/upload/" + todayFolder + "/" + randomName;
			recipeContentImageList [i] = link;
			i++;
		}
		
		recipeService.writeRecipeContent(recipeContentImageList, recipe_contents, recipe_no);
		
		return "redirect:./recipe_page.do";
	}
	
	@RequestMapping("recipe_read_page.do")
	public String recipeReadPage(Model model, int recipe_no) {
		
		HashMap<String, Object> map = recipeService.recipeRead(recipe_no);
		model.addAttribute("result", map);
		
		ArrayList<RecipeContentVo> readContentList = recipeService.readContentList(recipe_no);
		model.addAttribute("readContentList", readContentList);
		
		return "board/recipe_read_page";
	}
	
	@RequestMapping("recipe_delete_process.do")
	public String deleteContentProcess(int recipe_no) {
		
		// 글과 연관된 재료, 순서들 모두 삭제
		recipeService.deleteRecipe(recipe_no);
		
		return "redirect:./recipe_page.do";
	}
	
	@RequestMapping("recipe_update_page.do")
	public String updateRecipePage(Model model, int recipe_no) {
		
		ArrayList<GroupVo> groupVo = recipeService.groupList();
		ArrayList<RecipeNationalVo> nationalVo = recipeService.nationalList();
		ArrayList<RecipeKindVo> kindVo = recipeService.kindList();
		
		model.addAttribute("groupVo", groupVo);
		model.addAttribute("nationalVo", nationalVo);
		model.addAttribute("kindVo", kindVo);
		
		//현정추가2//////////////
		ArrayList<String> subgroupName = recipeService.subgroupList();
		model.addAttribute("subgroupName", subgroupName);
		//////222222222///////
		
		HashMap<String, Object> map = recipeService.recipeRead(recipe_no);
		model.addAttribute("result", map);
		
		ArrayList<HashMap<String, Object>> resultList = recipeService.updateRecipeIngredient(recipe_no);
		model.addAttribute("resultList", resultList);
		
		ArrayList<RecipeContentVo> readContentList = recipeService.updateContentList(recipe_no);
		model.addAttribute("readContentList", readContentList);
		
		return "board/recipe_update_page";
	}
	
	@RequestMapping("recipe_update_process.do")
	public String updateContentProcess(HttpSession session, RecipeVo param, MultipartFile thumbnail_file, int [] subgroup_nos, String [] ingredient_recipe_quantitys, String [] recipe_contents, MultipartFile [] image_files, String [] user_add_ingredients) {
		
		int recipe_no = param.getRecipe_no();
		recipeService.deleteRecipeIngredientAndContent(recipe_no);
		
		MemberVo sessionUser = (MemberVo)session.getAttribute("sessionUser");
		int member_no = sessionUser.getMember_no();
		
		if(user_add_ingredients != null) {
			
			//유저가 추가한 재료를 인서트하고 바로 서브그룹넘버로 셀렉트 해옴
			int [] userAddSubNo = recipeService.userIngredientAdd(member_no, user_add_ingredients);
			int j = 0;
			for(int i = 0 ; i < subgroup_nos.length ; i++) {
				
				if(subgroup_nos[i] == 0) {
					
					subgroup_nos[i] = userAddSubNo[j++];
				}
			}
		}
		
		//레시피 게시판 인서트-------------------------
		// 날짜별 폴더 만들기 (.../년도/월/일/랜덤_시간.확장자명)
		String uploadRootFolderName = "/upload_files/";
		Date today = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
		String todayFolder = sdf.format(today);
		String uploadFolderName = uploadRootFolderName + todayFolder;
		File uploadFolder = new File(uploadFolderName);
		
		if(!uploadFolder.exists()) {
			
			uploadFolder.mkdirs();
		}
		
		String originalFileName = thumbnail_file.getOriginalFilename();
		
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
			thumbnail_file.transferTo(new File(uploadFolderName + "/" + randomName));
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		String recipe_mainphoto = "/upload/" + todayFolder + "/" + randomName;
		
		param.setRecipe_mainphoto(recipe_mainphoto);

		recipeService.updateRecipe(param);
		
		recipeService.writeIngredientRecipe(subgroup_nos, ingredient_recipe_quantitys, recipe_no);
		
		//레시피 컨텐트 인서트-------------------------
		String[] recipeContentImageList = new String [image_files.length];
		int i = 0;
		
		// 업로드
		for(MultipartFile file : image_files) {
			
			// 예외처리
			if(file.getSize() <= 0) {
				continue;	
			}
			
			// 날짜별 폴더 만들기 (.../년도/월/일/랜덤_시간.확장자명)
			uploadRootFolderName = "/upload_files/";
			
			today = new Date();
			sdf = new SimpleDateFormat("yyyy/MM/dd");
			todayFolder = sdf.format(today);
			uploadFolderName = uploadRootFolderName + todayFolder;
			uploadFolder = new File(uploadFolderName);
			
			if(!uploadFolder.exists()) {
				
				uploadFolder.mkdirs();
			}
			
			originalFileName = file.getOriginalFilename();
			
			// 저장 시 파일명을 변경 
			// 목적 : 충돌 방지 (덮어씌우기 방지)
			// 방법 : 랜덤 + 시간
			randomName = UUID.randomUUID().toString();
			currentTime = System.currentTimeMillis();
			randomName += "_" + currentTime;
			
			// 확장자 추가 (오리지날 파일 이름에서 뽑아와야함)
			ext = originalFileName.substring(originalFileName.lastIndexOf("."));
			randomName += ext;
			
			try {
				file.transferTo(new File(uploadFolderName + "/" + randomName));
				
			}catch (Exception e) {
				e.printStackTrace();
			}
			
			String link = "/upload/" + todayFolder + "/" + randomName;
			recipeContentImageList [i] = link;
			i++;
		}
		
		recipeService.writeRecipeContent(recipeContentImageList, recipe_contents, recipe_no);
		
		return "redirect:./recipe_read_page.do?recipe_no=" + recipe_no;
	}
	
}
