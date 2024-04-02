package com.dj.wte.board.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dj.wte.board.mapper.GoodsImageSQLMapper;
import com.dj.wte.board.mapper.GoodsSQLMapper;
import com.dj.wte.board.mapper.RecipeSQLMapper;
import com.dj.wte.board.vo.GoodsImageVo;
import com.dj.wte.board.vo.GoodsVo;
import com.dj.wte.board.vo.RecipeVo;
import com.dj.wte.member.mapper.MemberSQLMapper;
import com.dj.wte.member.vo.MemberVo;

@Service
public class MainServiceImpl {
	
	@Autowired
	private GoodsSQLMapper goodsSQLMapper;
	
	@Autowired
	private MemberSQLMapper memberSQLMapper;
	
	@Autowired
	private GoodsImageSQLMapper goodsImageSQLMapper;
	
	@Autowired
	private RecipeSQLMapper recipeSQLMapper;
	
	public ArrayList<HashMap<String, Object>> getGoodsList() {
	      
	      ArrayList<HashMap<String, Object>> resultList = new ArrayList<HashMap<String,Object>>();
	      
	      ArrayList<GoodsVo> goodsList = goodsSQLMapper.selectAllInMain();
	      
	      for(GoodsVo goodsVo : goodsList) {
	         
	         int goods_no = goodsVo.getGoods_no();
	         
	         MemberVo memberVo =  memberSQLMapper.selectAll(goodsVo.getMember_no());
	         
	         GoodsImageVo imageVo = goodsImageSQLMapper.selectByGoodsOne(goods_no);
	         String image = imageVo.getGoods_image_link();
	         
	         HashMap<String, Object> map = new HashMap<String, Object>();
	         map.put("memberVo", memberVo);
	         map.put("goodsVo", goodsVo);
	         map.put("image", image);
	         
	         resultList.add(map);
	      }
	      
	      return resultList;
	   }
	
	
	public ArrayList<HashMap<String, Object>> getRecipeList() {
	      
	      ArrayList<HashMap<String, Object>> resultList = new ArrayList<HashMap<String,Object>>();
	      
	      ArrayList<RecipeVo> recipeList = recipeSQLMapper.selectAll();
	      
	      for(RecipeVo recipeVo : recipeList) {
	         
	         MemberVo memberVo =  memberSQLMapper.selectAll(recipeVo.getMember_no());
	         
	         HashMap<String, Object> map = new HashMap<String, Object>();
	         map.put("memberVo", memberVo);
	         map.put("recipeVo", recipeVo);
	         
	         resultList.add(map);
	      }
	      
	      return resultList;
	   }
	
}
