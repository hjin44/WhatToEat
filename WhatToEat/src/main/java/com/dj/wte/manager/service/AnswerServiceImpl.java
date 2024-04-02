package com.dj.wte.manager.service;

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
import com.dj.wte.manager.mapper.AnswerSQLMapper;
import com.dj.wte.manager.mapper.ManagerSQLMapper;
import com.dj.wte.manager.vo.AnswerVo;
import com.dj.wte.manager.vo.ManagerVo;
import com.dj.wte.member.mapper.MemberSQLMapper;
import com.dj.wte.member.vo.MemberVo;

@Service
public class AnswerServiceImpl {
	
	@Autowired
	private AnswerSQLMapper answerSQLMapper;
	
	@Autowired 
	private MemberSQLMapper memberSQLMapper;
	
	@Autowired
	private QnASQLMapper qnASQLMapper;
	
	@Autowired
	private ManagerSQLMapper managerSQLMapper; 
	
	@Autowired
	private AskImageSQLMapper askImageSQLMapper;
	
	public ArrayList<HashMap<String, Object>> getAskList(int manager_no){
		
		ArrayList<HashMap<String, Object>> resultList = new ArrayList<HashMap<String,Object>>();

		ArrayList<AskVo> askList = answerSQLMapper.selectByPrepare(manager_no);
		
		for(AskVo askVo : askList) {
			int member_no = askVo.getMember_no();
			MemberVo memberVo = memberSQLMapper.selectAll(member_no);
			
			int ask_no = askVo.getAsk_no();
			ArrayList<AskImageVo> imageVoList = askImageSQLMapper.selectByAskNo(ask_no);
			
			String str = askVo.getAsk_content();
			str = StringEscapeUtils.escapeHtml4(str);
			str = str.replaceAll("\n", "<br>");
			askVo.setAsk_content(str);			
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("memberVo", memberVo);
			map.put("askVo", askVo);
			map.put("imageVoList", imageVoList);
			
			
			resultList.add(map);
		}
		

		return resultList;
	}
	
	public ArrayList<HashMap<String, Object>> getCompleteList(int manager_no){
		
		ArrayList<HashMap<String, Object>> resultList = new ArrayList<HashMap<String,Object>>();

		ArrayList<AskVo> completeList = answerSQLMapper.selectByComplete(manager_no);
				
		for(AskVo completeVo : completeList) {
			int member_no = completeVo.getMember_no();
			MemberVo memberVo1 = memberSQLMapper.selectAll(member_no);
			
			int ask_no = completeVo.getAsk_no();
			ArrayList<AskImageVo> imageVoList = askImageSQLMapper.selectByAskNo(ask_no);
			
			String str = completeVo.getAsk_content();
			str = StringEscapeUtils.escapeHtml4(str);
			str = str.replaceAll("\n", "<br>");
			completeVo.setAsk_content(str);
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("memberVo1", memberVo1);			
			map.put("completeVo", completeVo);
			map.put("imageVoList", imageVoList);
			
			resultList.add(map);
			
		}
		return resultList;
	}
	
	
	
	//답변 입력
	public void writeAnswer(AnswerVo vo, int ask_no) {
		System.out.println("[ask_no] : " + ask_no);
		
		int AnswerPk = answerSQLMapper.createKey();
		vo.setAnswer_no(AnswerPk);
		
		AssignVo assignVo = qnASQLMapper.selectByAssign(ask_no);
		int assign_no = assignVo.getAssign_no();
		
		vo.setAssign_no(assign_no);
		
		answerSQLMapper.insert(vo);
		
		answerSQLMapper.update(ask_no);
	}
	
	//대답 출력
	public ArrayList<HashMap<String, Object>> getAnswerList(int	ask_no){
		
		ArrayList<HashMap<String, Object>> result = new ArrayList<HashMap<String,Object>>();
		
		AssignVo assignVo = qnASQLMapper.selectByAssign(ask_no);
		int assign_no = assignVo.getAssign_no();
		
		ArrayList<AnswerVo> answerList = answerSQLMapper.getAnswer(assign_no);
		int manager_no = assignVo.getManager_no();
				
		//System.out.println("[answerList] : " + answerList);
		//System.out.println("[assignVo] : " + assignVo);
		//System.out.println("[manager_no] : " + manager_no);
		
		for(AnswerVo answerVo : answerList) {
			ManagerVo managerVo = managerSQLMapper.selectByNo(manager_no);
			
			/*String str = answerVo.getAnswer_content();
			str = StringEscapeUtils.escapeHtml4(str);
			str = str.replaceAll("\n", "<br>");
			answerVo.setAnswer_content(str);*/
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("managerVo", managerVo);
			map.put("answerVo", answerVo);
			
			result.add(map);
		}
		return result;
	}
	
	public void deleteAnswer(int ask_no) {
		//System.out.println("[ask_no] : " + ask_no);
		
		AssignVo assignVo = qnASQLMapper.selectByAssign(ask_no);
		int assign_no = assignVo.getAssign_no();
		
		//System.out.println("[assign_no] : " + assign_no);
		
		answerSQLMapper.deleteAnswer(assign_no);
		answerSQLMapper.deleteupdate(ask_no);
	}
	
	//답변 수정
	public void updateAnswer(AnswerVo vo, int ask_no) {
		
		//System.out.println("[vo] : " + vo.getAnswer_content());
		String answer_content = vo.getAnswer_content();
		
		AssignVo assignVo = qnASQLMapper.selectByAssign(ask_no);
		int assign_no = assignVo.getAssign_no();
		
		answer_content = StringEscapeUtils.escapeHtml4(answer_content);
		answer_content = answer_content.replaceAll("<br>", "");
		
		//System.out.println("[assign_no] : " + assign_no);
		answerSQLMapper.answerUpdate(answer_content, assign_no);
	}
	
	public ArrayList<HashMap<String, Object>> getAllManager(){
		ArrayList<HashMap<String, Object>> result = new ArrayList<HashMap<String,Object>>();
		
		ArrayList<ManagerVo> managerList = managerSQLMapper.selectManager();
		//System.out.println("{managerList} : " + managerList);
		
		for(ManagerVo managerVo : managerList) {
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("managerVo", managerVo);
			
			//System.out.println("{managerVo} : " + managerVo);
			
			result.add(map);
		}
		return result;		
	}
	
	public void transferAnswer(int ask_no, int select_manager) {
		AssignVo vo = qnASQLMapper.selectByAssign(ask_no);
		int assign_no = vo.getAssign_no();
		System.out.println("[assign_no] : " + assign_no);
		
		answerSQLMapper.transferAnswer(select_manager, assign_no);

	}

}
