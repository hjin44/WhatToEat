package com.dj.wte.board.service;

import java.util.ArrayList;



import java.util.HashMap;

import org.apache.commons.text.StringEscapeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dj.wte.board.mapper.FbGoodSQLMapper;
import com.dj.wte.board.mapper.FbImageSQLMapper;
import com.dj.wte.board.mapper.FbSQLMapper;

import com.dj.wte.board.mapper.FbRepleSQLMapper;
import com.dj.wte.member.mapper.MemberSQLMapper;
import com.dj.wte.board.vo.FbCategoryVo;
import com.dj.wte.board.vo.FbGoodVo;
import com.dj.wte.board.vo.FbImageVo;
import com.dj.wte.board.vo.FbVo;

import com.dj.wte.member.vo.MemberVo;
import com.dj.wte.board.vo.FbRepleVo;


@Service
public class FbServiceImpl {
	
	@Autowired
	private FbSQLMapper fbSQLMapper;
	
	@Autowired
	private MemberSQLMapper memberSQLMapper; 
	
	@Autowired
	private FbImageSQLMapper fbImageSQLMapper; 
	
	@Autowired
	private FbRepleSQLMapper fbrepleSQLMapper; 
	
	@Autowired
	private FbGoodSQLMapper fbgoodSQLMapper;
	
	
	
	public void writeContent(FbVo vo , ArrayList<FbImageVo> imageVoList) {
		
		int contentPK = fbSQLMapper.createKey();
		vo.setFb_no(contentPK);		
		fbSQLMapper.insert(vo);
		
		for(FbImageVo fbimageVo : imageVoList) {
			fbimageVo.setFb_no(contentPK);
			fbImageSQLMapper.insert(fbimageVo);
		}
		
	}
	
		public ArrayList<HashMap<String, Object>> getContentList(String search_word , String search_type ,int page_num){
			ArrayList<HashMap<String, Object>> resultList =
					new ArrayList<HashMap<String, Object>>(); 
			
			ArrayList<FbVo> contentList = null;
			
			if(search_word == null || search_type == null) {
				contentList = fbSQLMapper.selectAll(page_num);
			}else {
				if(search_type.equals("title")) {
					contentList = fbSQLMapper.selectByTitle(search_word);
				}else if(search_type.equals("content")) {
					contentList = fbSQLMapper.selectByContent(search_word);
				}else if(search_type.equals("writer")) {
					contentList = fbSQLMapper.selectByWriter(search_word);
				}else {
					contentList = fbSQLMapper.selectAll(page_num);
				}
			}
			
			for(FbVo fbVo : contentList) {
				int member_no = fbVo.getMember_no();
							
				MemberVo memberVo = memberSQLMapper.selectAll(member_no);
				
				int fb_no = fbVo.getFb_no();
				int repleCount = fbrepleSQLMapper.getRepleCount(fb_no);
				int goodCount = fbgoodSQLMapper.getGoodCount(fb_no);
				
				FbCategoryVo fbCategoryVo = fbSQLMapper.selectByCategoryNo(fbVo.getFb_category_no());
				
				HashMap<String,Object> map = new HashMap<String,Object>();
				map.put("memberVo", memberVo);
				map.put("fbVo", fbVo);
				map.put("repleCount", repleCount);
				map.put("goodCount", goodCount);
				map.put("fbCategoryVo", fbCategoryVo);
				
				resultList.add(map);
			}
			
			return resultList;
	
		}
		public HashMap<String,Object> getContent(int fbNo){

			//조회수 증가 쿼리 실행..
			fbSQLMapper.increaseReadCount(fbNo);
			
			fbgoodSQLMapper.getGoodCount(fbNo);
						
			//출력 데이터 받아 오기...
			FbVo fbVo = fbSQLMapper.selectByNo(fbNo);
			
			String str = fbVo.getFb_content();
			str = StringEscapeUtils.escapeHtml4(str);
			str = str.replaceAll("\n", "<br>");
			fbVo.setFb_content(str);

			FbCategoryVo fbCategoryVo = fbSQLMapper.selectByCategoryNo(fbVo.getFb_category_no());
			
			int member_no = fbVo.getMember_no();
			MemberVo memberVo = memberSQLMapper.selectAll(member_no);
			
			ArrayList<FbImageVo> imageVoList =
					fbImageSQLMapper.selectByContentNo(fbNo);
			
			FbGoodVo vo = new FbGoodVo();
			vo.setFb_no(fbNo);
			
			int member_no_good = vo.getMember_no();
			vo.setMember_no(member_no_good);
			
			FbGoodVo fbgoodVo = fbgoodSQLMapper.selectByNo(vo);
						
			
			HashMap<String,Object> map = new HashMap<String,Object>(); 
			map.put("memberVo", memberVo);
			map.put("fbVo", fbVo);
			map.put("imageVoList", imageVoList);
			map.put("fbgoodVo", fbgoodVo);
			map.put("fbCategoryVo", fbCategoryVo);
			return map;
		}
		
		
		public ArrayList<FbCategoryVo> categoryList(){
			ArrayList<FbCategoryVo> fbCategoryVo = fbSQLMapper.selectByCategory();
			
			
			return fbCategoryVo;
		} 
		
		
		public void deleteContent(int fbNo) {
			fbSQLMapper.deleteByNo(fbNo);
		}
		
		public void updateContent(FbVo vo) {
			fbSQLMapper.update(vo);
		}

		public int getPageCount() {
			return fbSQLMapper.getPageCount();
		}

		//댓글 삭제
		public void deleteReple(FbRepleVo vo) {
			fbrepleSQLMapper.deleteByNo(vo);
		}
		
		
		
				
		//댓글 갯수
		public int getRepleCount(int fb_no) {
			return fbrepleSQLMapper.getRepleCount(fb_no);
		}
				
		//댓글 추가
		public void writeReple(FbRepleVo vo) {
			fbrepleSQLMapper.insert(vo);
		}

		//댓글 리스트 출력
		public ArrayList<HashMap<String, Object>> getRepleList(int fb_no){
			
			ArrayList<HashMap<String, Object>> result = 
					new ArrayList<HashMap<String, Object>>(); 
			
			ArrayList<FbRepleVo> repleVoList =
					fbrepleSQLMapper.selectByNo(fb_no);
			
			for(FbRepleVo fbrepleVo : repleVoList) {
				
				MemberVo memberVo = 
						memberSQLMapper.selectAll(fbrepleVo.getMember_no());
				
				HashMap<String, Object> map = new HashMap<String, Object>();
				map.put("memberVo", memberVo);
				map.put("fbrepleVo", fbrepleVo);
				
				result.add(map);
			}
			
			
			return result;
		
		}
		
		//좋아요
		public void good(FbGoodVo vo) {
			fbgoodSQLMapper.good(vo);
		}
		
		//좋아요 여부 검사
		public FbGoodVo goodCheck(FbGoodVo vo) {
			return fbgoodSQLMapper.selectByNo(vo);
		}
		
		//좋아요 취소
		public void deleteGood(int fb_good_no) {
			fbgoodSQLMapper.deleteGood(fb_good_no);
		}
		
		//좋아요 갯수
		public int getGoodCount(int fb_no) {
			return fbgoodSQLMapper.getGoodCount(fb_no);
		}
		//글삭제시 댓글 삭제
		public void fbRepleDeleteByFbNo(int fb_no) {
			fbrepleSQLMapper.fbdeleteByFbNo(fb_no);
			
		}

		
				
		
		
		
		
		}
		




		
		
		
		
		
		
		
		
		
	
	
	
	
	
	
	
