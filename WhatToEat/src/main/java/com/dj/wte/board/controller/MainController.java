package com.dj.wte.board.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dj.wte.board.service.MainServiceImpl;

@Controller
@RequestMapping("/board/*")
public class MainController {
	
	@Autowired
	private MainServiceImpl mainService;
	
	@RequestMapping("main_page.do")
	public String MainPage(Model model) {
		
		ArrayList<HashMap<String, Object>> goodsList =  mainService.getGoodsList();
		
		ArrayList<HashMap<String, Object>> recipeList =  mainService.getRecipeList();
		
		model.addAttribute("goodsList", goodsList);
		model.addAttribute("recipeList", recipeList);
		
		return "/board/main_page";
	}
	
}
