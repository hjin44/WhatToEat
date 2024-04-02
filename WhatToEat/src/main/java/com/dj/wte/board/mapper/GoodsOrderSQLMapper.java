package com.dj.wte.board.mapper;

import java.util.ArrayList;

import com.dj.wte.board.vo.GoodsOrderVo;

public interface GoodsOrderSQLMapper {
	
	//주문 번호 증가
	public int createKey();
		
	//주문
	public void insert(GoodsOrderVo vo);
		
	//주문 내역 출력(주문 완료 페이지)
	public GoodsOrderVo selectByNo(int order_no);
	
	//주문 내역 출력(구매 내역 페이지)
	public ArrayList<GoodsOrderVo> selectAllByNo(int member_no);
	
	//특정 회원 총 주문금액 출력
	public Integer getTotalPriceByNo(int member_no);
	
	//해당 상품 총 주문수량 출력
	public Integer getOrderAmountByNo(int goods_no);
}
