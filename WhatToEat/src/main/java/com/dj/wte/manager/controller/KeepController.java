package com.dj.wte.manager.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dj.wte.manager.service.KeepServiceImpl;
import com.dj.wte.board.service.RecipeServiceImpl;
import com.dj.wte.board.vo.GroupVo;
import com.dj.wte.board.vo.SubgroupVo;
import com.dj.wte.manager.vo.KeepVo;

@Controller
@RequestMapping("/manager/*")
public class KeepController {
	//현정6
	@Autowired
	private KeepServiceImpl keepService; // 서비스 클래스 사용하겠다
	
	@Autowired
	private RecipeServiceImpl recipeService;
	
	@RequestMapping("keep_page.do")
	public String mainPage(Model model, String search_word, String search_type, @RequestParam(value = "page_num", defaultValue = "1")int page_num) {
		
		ArrayList<HashMap<String, Object>> resultList = keepService.getIngredientList();
		
		model.addAttribute("resultList", resultList);
		
		return "/manager/keep_page";
	}
	
	@RequestMapping("keep_write_page.do")
	public String KeepWritePage(Model model) {
		
		ArrayList<GroupVo> groupVo = recipeService.groupList();
		model.addAttribute("groupVo", groupVo);
		ArrayList<String> subgroupName = recipeService.subgroupList();
		model.addAttribute("subgroupName", subgroupName);
		
		return "/manager/keep_write_page";
	}
	
	@RequestMapping("keep_write_process.do")
	public String KeepWriteProcess(KeepVo param) {
		
		keepService.writeKeep(param);
		
		return "redirect:./keep_page.do";
	}
	
	@ResponseBody
	@RequestMapping("recipe_subgroup_list.do")
	public ArrayList<SubgroupVo> subgroupList(int group_no){
		
		ArrayList<SubgroupVo> subgroupVo = recipeService.subgroupList(group_no);
		
		return subgroupVo;	
	}
	
	@RequestMapping("keep_read_page.do")
	public String keepReadPage(Model model,int keep_no) {
		
		HashMap<String, Object> map = keepService.getKeep(keep_no);
		
		model.addAttribute("result", map);
		
		return "manager/keep_read_page";
	}
	
	@RequestMapping("keep_delete_process.do")
	public String deleteContentProcess(int keep_no) {
		
		keepService.deleteKeep(keep_no);
		
		return "redirect:./keep_page.do";
	}
	
	
	@RequestMapping("keep_update_page.do")
	public String updateContentPage(Model model, int keep_no) {
		
		HashMap<String, Object> map = keepService.getKeep(keep_no);
		
		model.addAttribute("result", map);
		
		return "manager/keep_update_page";
	}
	
	@RequestMapping("keep_update_process.do")
	public String updateContentProcess(KeepVo param) {
		
		keepService.updateKeep(param);
		
		return "redirect:./keep_read_page.do?keep_no=" + param.getKeep_no();
	}
	
	@ResponseBody
	@RequestMapping("keep_confrim.do")
	public String keepConfrim(String subgroup_name){
		
		boolean confirm = keepService.confirmIngredient(subgroup_name);
		
		if(confirm == true) {
			return "true";
			
		}else {
			return "false";
			
		}
	}
}
