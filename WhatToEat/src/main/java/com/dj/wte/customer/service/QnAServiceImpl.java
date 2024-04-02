package com.dj.wte.customer.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.commons.text.StringEscapeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dj.wte.customer.mapper.AskImageSQLMapper;
import com.dj.wte.customer.mapper.QnASQLMapper;
import com.dj.wte.customer.vo.AskImageVo;
import com.dj.wte.customer.vo.AskVo;
import com.dj.wte.customer.vo.AssignVo;
import com.dj.wte.manager.mapper.ManagerSQLMapper;
import com.dj.wte.manager.vo.ManagerVo;
import com.dj.wte.member.mapper.MemberSQLMapper;
import com.dj.wte.member.vo.MemberVo;


@Service
public class QnAServiceImpl {
	
	@Autowired
	private QnASQLMapper qnASQLMapper;
	
	@Autowired
	private MemberSQLMapper memberSQLMapper; 
	
	@Autowired
	private AskImageSQLMapper askImageSQLMapper;
	
	@Autowired ManagerSQLMapper managerSQLMapper;

	//질문리스트 가져오기
	public ArrayList<HashMap<String, Object>> getAskList(int member_no){
	
		ArrayList<HashMap<String, Object>> resultList = new ArrayList<HashMap<String,Object>>();
		
		ArrayList<AskVo> askList = qnASQLMapper.selectAll(member_no);
		
		for(AskVo askVo : askList) {
			
			MemberVo memberVo = memberSQLMapper.selectAll(member_no);
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("memberVo", memberVo);
			map.put("askVo", askVo);
			
			resultList.add(map);			
		}
		return resultList;	
	}

	//질문하기
	public void writeAsk(AskVo vo, ArrayList<AskImageVo> imageVoList, AssignVo assignVo) {
		int AskPK = qnASQLMapper.createKey();
		vo.setAsk_no(AskPK);
		qnASQLMapper.insert(vo);
		
		int AssignPK = qnASQLMapper.createKeyAssign();
		assignVo.setAsk_no(AssignPK);
		qnASQLMapper.insertAssign(AskPK);
		
		for(AskImageVo imageVo : imageVoList) {
			imageVo.setAsk_no(AskPK);
			askImageSQLMapper.insert(imageVo);
		}
	}
	
	//질문글 보기
	public HashMap<String, Object> getAsk(int ask_no){
		
		//출력 데이터 받아오기
		AskVo askVo = qnASQLMapper.selectByNo(ask_no);
		//System.out.println("askVo : " + askVo);
		
		AssignVo assignVo = qnASQLMapper.selectByAssign(ask_no); 
		
		String str = askVo.getAsk_content();
		str = StringEscapeUtils.escapeHtml4(str);
		str = str.replaceAll("\n", "<br>");
		askVo.setAsk_content(str);
		//System.out.println("askVo.getAsk_content() : " + askVo.getAsk_content());
		
		int member_no = askVo.getMember_no();
		
		//System.out.println("member_no : " + member_no);
		MemberVo memberVo = memberSQLMapper.selectAll(member_no);
		//System.out.println("memberVo : " + memberVo);
		
		ArrayList<AskImageVo> imageVoList = askImageSQLMapper.selectByAskNo(ask_no);
		//System.out.println("imageVoList : " + imageVoList);
		
		int manager_no = assignVo.getManager_no();
		ManagerVo managerVo = managerSQLMapper.selectByNo(manager_no);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("memberVo", memberVo);
		map.put("askVo", askVo);
		map.put("imageVoList", imageVoList);
		map.put("assignVo", assignVo);
		map.put("managerVo", managerVo);
		
		return map;		
	}
	
	public void deleteAsk(int ask_no) {
		qnASQLMapper.deleteByAsk(ask_no);
		qnASQLMapper.deleteByAssign(ask_no);
	}
}
