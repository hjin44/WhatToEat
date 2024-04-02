package com.dj.wte.board.service;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.apache.commons.text.StringEscapeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dj.wte.board.mapper.GoodsBasketSQLMapper;
import com.dj.wte.board.mapper.GoodsImageSQLMapper;
import com.dj.wte.board.mapper.GoodsLikeSQLMapper;
import com.dj.wte.board.mapper.GoodsOrderSQLMapper;
import com.dj.wte.board.mapper.GoodsSQLMapper;
import com.dj.wte.board.mapper.RepleSQLMapper;
import com.dj.wte.board.vo.GoodsBasketVo;
import com.dj.wte.board.vo.GoodsImageVo;
import com.dj.wte.board.vo.GoodsLikeVo;
import com.dj.wte.board.vo.GoodsOrderVo;
import com.dj.wte.board.vo.GoodsRepleVo;
import com.dj.wte.board.vo.GoodsVo;
import com.dj.wte.member.mapper.MemberSQLMapper;
import com.dj.wte.member.vo.MemberVo;

@Service
public class GoodsServiceImpl {
	
	@Autowired
	private GoodsBasketSQLMapper basketSQLMapper;
	
	@Autowired
	private GoodsOrderSQLMapper orderSQLMapper;
	
	@Autowired
	private GoodsLikeSQLMapper likeSQLMapper;
	
	@Autowired
	private RepleSQLMapper repleSQLMapper;
	
	@Autowired
	private GoodsImageSQLMapper goodsImageSQLMapper;
	
	@Autowired
	private MemberSQLMapper memberSQLMapper;
	
	@Autowired
	private GoodsSQLMapper goodsSQLMapper;
	
	//상품 등록
	public void registGoods(GoodsVo vo, ArrayList<GoodsImageVo> imageVoList) {
		
		int goodsPK = goodsSQLMapper.createKey();
		vo.setGoods_no(goodsPK);
		goodsSQLMapper.insert(vo);
		
		for(GoodsImageVo imageVo : imageVoList) {
			imageVo.setGoods_no(goodsPK);
			goodsImageSQLMapper.insert(imageVo);
		}
		
	}
	
	//상품 리스트 출력
	   public ArrayList<HashMap<String, Object>> getGoodsList(Integer user_no, String search_word, String search_type, int page_num) {
	      
	      ArrayList<HashMap<String, Object>> resultList = new ArrayList<HashMap<String, Object>>();
	      
	      ArrayList<GoodsVo> goodsList = null;
	      
	      if(search_word == null || search_type == null) {
	         goodsList = goodsSQLMapper.selectAll(page_num);
	      }else {
	         if(search_type.equals("goods")) {
	            goodsList = goodsSQLMapper.selectByGoods(search_word);
	         }else if(search_type.equals("info")) {
	            goodsList = goodsSQLMapper.selectByInfo(search_word);
	         }else if(search_type.equals("writer")) {
	            goodsList = goodsSQLMapper.selectByWriter(search_word);
	         }else {
	            goodsList = goodsSQLMapper.selectAll(page_num);
	         }
	      }
	      
	      for(GoodsVo goodsVo : goodsList) {
	         int member_no = goodsVo.getMember_no();
	         MemberVo memberVo = memberSQLMapper.selectAll(member_no);
	         
	         int goods_no = goodsVo.getGoods_no();
	         
	         //댓글 갯수
	         int repleCount = repleSQLMapper.getRepleCount(goods_no);
	         
	         //대표사진 뽑아오기
	         GoodsImageVo imageVo = goodsImageSQLMapper.selectByGoodsOne(goods_no);
	         String image = imageVo.getGoods_image_link();
	         
	         //좋아요 갯수
	         int likeCount = likeSQLMapper.getLikeCount(goods_no);
	         
	         HashMap<String, Object> map = new HashMap<String, Object>();
	         
	         //하트 목록
	         if(user_no == null) {
	            map.put("goodsLikeHeartColor",0);
	            
	         }else {
	            GoodsLikeVo likeVo = new GoodsLikeVo();
	            likeVo.setGoods_no(goods_no);
	            likeVo.setMember_no((int)user_no);
	            
	            map.put("goodsLikeHeartColor",likeSQLMapper.selectCountByGoodsNoAndMemberNo(likeVo));
	         }
	         
	         map.put("goodsVo", goodsVo);
	         map.put("memberVo", memberVo);
	         map.put("repleCount", repleCount);
	         map.put("image", image);
	         map.put("likeCount", likeCount);
	         
	         resultList.add(map);
	      }
	      
	      return resultList;
	   }
	
	//상품 보기
	public HashMap<String,Object> getGoods(int goodsNo) {
		
		goodsSQLMapper.increaseCount(goodsNo);
		
		GoodsVo goodsVo = goodsSQLMapper.selectByNo(goodsNo);
		
		String str = goodsVo.getGoods_info();
		str = StringEscapeUtils.escapeHtml4(str);
		str  = str.replaceAll("\n", "<br>");
		goodsVo.setGoods_info(str);
		
		int member_no = goodsVo.getMember_no();
		MemberVo memberVo = memberSQLMapper.selectAll(member_no);
		
		//모든 이미지 출력
		ArrayList<GoodsImageVo> imageVoList = goodsImageSQLMapper.selectByGoodsNo(goodsNo);
		
		//대표 이미지 출력
		GoodsImageVo imageVo = goodsImageSQLMapper.selectByGoodsOne(goodsNo);
		
		GoodsLikeVo vo = new GoodsLikeVo();
		vo.setGoods_no(goodsNo);
		
		int member_no_like = vo.getMember_no();
		vo.setMember_no(member_no_like);
		
		GoodsLikeVo likeVo = likeSQLMapper.selectByNo(vo);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("goodsVo", goodsVo);
		map.put("memberVo", memberVo);
		map.put("imageVoList", imageVoList);
		map.put("likeVo", likeVo);
		map.put("imageVo", imageVo);
		
		return map;
	}
	
	//글 삭제 시 이미지 삭제
	public void chainDeleteImage(int goods_no) {
		goodsImageSQLMapper.chainDeleteByNo(goods_no);
	}
	
	//판매글 수정
	public void updateGoods(GoodsVo vo) {
		goodsSQLMapper.update(vo);
	}
	
	//판매글 삭제
	public void deleteGoods(int goodsNo) {
		goodsSQLMapper.deleteByNo(goodsNo);
	}
	
	//상품 갯수
	public Integer getGoodsCount() {
		return goodsSQLMapper.getGoodsCount();
	}
	
	//페이징
	public int getPageCount() {
		return goodsSQLMapper.getPageCount();
	}
	
	//상품 재고 출력
	public Integer getGoodsAmount(int goods_no) {
		return goodsSQLMapper.getAmountByNo(goods_no);
	}
	
	//댓글 추가
	public void writeReple(GoodsRepleVo vo) {
		repleSQLMapper.insert(vo);
	}
	
	//댓글 삭제
	public void deleteReple(GoodsRepleVo vo) {
		repleSQLMapper.deleteByNo(vo);
	}
	
	//글 삭제시 댓글 삭제
	public void chainDeleteReple(int goods_no) {
		repleSQLMapper.chainDeleteByNo(goods_no);
	}
	
	//댓글 갯수
	public int getRepleCount(int goods_no) {
		return repleSQLMapper.getRepleCount(goods_no);
	}
	
	//댓글 리스트 출력
	public ArrayList<HashMap<String, Object>> getRepleList(int goodsNo) {
		
		ArrayList<HashMap<String, Object>> result = new ArrayList<HashMap<String,Object>>();
		
		ArrayList<GoodsRepleVo> repleVoList = repleSQLMapper.selectByNo(goodsNo);
		
		for(GoodsRepleVo repleVo : repleVoList) {
			
			MemberVo memberVo = memberSQLMapper.selectAll(repleVo.getMember_no());
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("memberVo", memberVo);
			map.put("repleVo", repleVo);
			
			result.add(map);
		}
		return result;
	}
	
	//좋아요
	public void like(GoodsLikeVo vo) {
		likeSQLMapper.like(vo);
	}
	
	//좋아요 여부 검사
	public GoodsLikeVo likeCheck(GoodsLikeVo vo) {
		return likeSQLMapper.selectByNo(vo);
	}
	
	//좋아요 취소
	public void deleteLike(int goods_like_no) {
		likeSQLMapper.deleteLike(goods_like_no);
	}
	
	//글 삭제시 좋아요 삭제
	public void chainDeleteLike(int goods_no) {
		likeSQLMapper.chainDeleteByNo(goods_no);
	}
	
	//좋아요 갯수
	public int getLikeCount(int goods_no) {
		return likeSQLMapper.getLikeCount(goods_no);
	}
	
	//좋아요 갯수(한 유저가 추천 누른 수)
	public int getLikeCountByMember(GoodsLikeVo vo) { 
		return likeSQLMapper.selectCountByGoodsNoAndMemberNo(vo);
	}
	
	//상품 주문
	public void orderGoods(GoodsOrderVo vo) {
		
		int order_no = orderSQLMapper.createKey();
		vo.setOrder_no(order_no);
		
		orderSQLMapper.insert(vo);
	}
	
	//상품 정보 가져오기
	public GoodsVo getGoodsInfo(int goods_no) {
		return goodsSQLMapper.selectByNo(goods_no);
	}
	
	//주문 내역 출력(주문 완료 페이지)
	public GoodsOrderVo getOrderResult(int order_no) {
		return orderSQLMapper.selectByNo(order_no);
	}
	
	//주문 내역 출력(구매 내역 페이지)
	public ArrayList<HashMap<String, Object>> getOrderList(int member_no) {
		
		ArrayList<HashMap<String, Object>> result = new ArrayList<HashMap<String,Object>>();
		
		ArrayList<GoodsOrderVo> orderList = orderSQLMapper.selectAllByNo(member_no);
		
		for(GoodsOrderVo orderVo : orderList) {
			
			GoodsVo goodsVo = goodsSQLMapper.selectByNo(orderVo.getGoods_no());
			
			GoodsImageVo imageVo = goodsImageSQLMapper.selectByGoodsOne(orderVo.getGoods_no());
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("orderVo", orderVo);
			map.put("goodsVo", goodsVo);
			map.put("imageVo", imageVo);
			
			result.add(map);
		}
		
		return result;
	}
	
	//특정 회원 총 주문금액 출력
	public Integer getTotalPrice(int member_no) {
		return orderSQLMapper.getTotalPriceByNo(member_no);
	}
	
	//해당 상품 총 주문수량 출력
	public Integer getTotalOrderAmount(int goods_no) {
		return orderSQLMapper.getOrderAmountByNo(goods_no);
	}
	
	//장바구니 추가
	public void insert(GoodsBasketVo vo) {
		basketSQLMapper.insert(vo);
	}
	
	//장바구니 목록
	public ArrayList<HashMap<String, Object>> getBasketList(int member_no) {
		
		ArrayList<HashMap<String, Object>> result = new ArrayList<HashMap<String,Object>>();
		
		ArrayList<GoodsBasketVo> basketList = basketSQLMapper.selectAll(member_no);
		
		for(GoodsBasketVo basketVo : basketList) {
			
			GoodsVo goodsVo = goodsSQLMapper.selectByNo(basketVo.getGoods_no());
			
			GoodsImageVo imageVo = goodsImageSQLMapper.selectByGoodsOne(basketVo.getGoods_no());
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("basketVo", basketVo);
			map.put("goodsVo", goodsVo);
			map.put("imageVo", imageVo);
			
			result.add(map);
		}
		
		return result;
	}
	
	//장바구니 정보 가져오기
	public GoodsBasketVo getBasketInfo(int basket_no) {
		return basketSQLMapper.selectByNo(basket_no);
	}
	
	//장바구니 삭제
	public void deleteBasket(GoodsBasketVo vo) {
		basketSQLMapper.deleteByNo(vo);
	}
	
	//상품 삭제 시 장바구니 삭제
	public void chainDeleteBasket(int goods_no) {
		basketSQLMapper.chainDeleteByNo(goods_no);
	}
	
}
