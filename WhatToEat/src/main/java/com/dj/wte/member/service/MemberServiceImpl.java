package com.dj.wte.member.service;

import java.util.ArrayList;
import java.util.HashMap;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import com.dj.wte.board.mapper.GoodsImageSQLMapper;
import com.dj.wte.board.vo.GoodsImageVo;
import com.dj.wte.board.vo.GoodsLikeVo;
import com.dj.wte.board.vo.GoodsVo;
import com.dj.wte.board.vo.RecipeGoodVo;
import com.dj.wte.board.vo.RecipeVo;
import com.dj.wte.member.mapper.AddressSQLMapper;
import com.dj.wte.member.mapper.MemberAuthSQLMapper;
import com.dj.wte.member.mapper.MemberSQLMapper;
import com.dj.wte.member.mapper.MessageSQLMapper;
import com.dj.wte.member.mapper.PointSQLMapper;
import com.dj.wte.member.vo.AddressFolderVo;
import com.dj.wte.member.vo.AddressVo;
import com.dj.wte.member.vo.MemberAuthVo;
import com.dj.wte.member.vo.MemberVo;
import com.dj.wte.member.vo.MessageVo;
import com.dj.wte.member.vo.PointVo;
import com.dj.wte.util.WTEMessageDigest;
import com.dj.wte.member.service.MailSendThread;

@Service
public class MemberServiceImpl {
	
	@Autowired
	private GoodsImageSQLMapper goodsImageSQLMapper;
	
	@Autowired
	private PointSQLMapper pointSQLMapper;
	
	@Autowired
	private MemberSQLMapper memberSQLMapper;
	
	@Autowired
	private MemberAuthSQLMapper memberAuthSQLMapper;
	
	@Autowired
	private MessageSQLMapper messageSQLMapper;
	
	@Autowired
	private AddressSQLMapper addressSQLMapper;
	
	@Autowired
	private JavaMailSender mailSender;
	
	// 회원가입
	public void joinMember(MemberVo vo) {
		
		// 비밀번호 암호화 (복호화가 불가능해야됨 = 해쉬 알고리즘)
		String hashCode = WTEMessageDigest.messageDigest(vo.getMember_pw());
		vo.setMember_pw(hashCode);
		
		int member_no = memberSQLMapper.createKey();
		
		vo.setMember_no(member_no);
		
		if(vo.getMember_gender().equals("M")) {
			
			vo.setMember_profilephoto("/upload/profile/man2.png");
			
		} else {
			
			vo.setMember_profilephoto("/upload/profile/woman2.png");
			
		}
		
		AddressFolderVo addressFolderVo = new AddressFolderVo();
		addressFolderVo.setMember_no(member_no);
		addressFolderVo.setAddress_folder_name("기본 주소록");
		
		memberSQLMapper.insert(vo);
		addressSQLMapper.insertAddressFolder(addressFolderVo);
		
		memberAuthSQLMapper.updateMemberNo(vo);
		
	}
	
	// 휴대폰 인증 보내기
	public void Auth(String member_email) {
		int authKey = (int)(Math.random()*9000 + 1000);
		System.out.println(authKey);
		System.out.println(member_email);
		
		MemberAuthVo authVo = memberAuthSQLMapper.select(member_email);
		
		if(authVo != null) {
			
			authVo.setAuth_key(authKey);
			
			memberAuthSQLMapper.updateAuthKey(authVo);
			
		} else {
			
			MemberAuthVo memberAuthVo = new MemberAuthVo();
			memberAuthVo.setAuth_key(authKey);
			memberAuthVo.setMember_email(member_email);
			
			memberAuthSQLMapper.insert(memberAuthVo);
			
		}
		
		MailSendThread mailSendThread = new MailSendThread(authKey, member_email, mailSender);
		
		mailSendThread.start();
		
	}
	
	// 본인 인증
	public MemberAuthVo AuthConfirm(String member_email) {
		
		MemberAuthVo memberAuthVo = memberAuthSQLMapper.select(member_email);		
		
		return memberAuthVo;
	}
	
	
	// 아이디 중복 확인
	public MemberVo idConfirm(String member_id) {
		
		MemberVo result = memberSQLMapper.selectConfirmById(member_id);
		
		return result;
	}
	
	// 닉네임 중복 확인
	public MemberVo nickConfirm(String member_nick) {
		
		MemberVo result = memberSQLMapper.selectConfirmByNick(member_nick);
		
		return result;
	}
	
	// 로그인 하기
	public MemberVo login(MemberVo vo) {
		
		String hashCode = WTEMessageDigest.messageDigest(vo.getMember_pw());
		vo.setMember_pw(hashCode);
		
		MemberVo result = memberSQLMapper.selectByIdAndPw(vo);
		
		return result;
	}
	
	// 닉네임으로 member_no 가져오기
	public int memberNo(String member_nick) {
		
		int member_no = memberSQLMapper.selectByNick(member_nick);
		
		return member_no;
	}
	
	// member_no로 닉네임 가져오기
	public String memberNick(int member_no) {
		
		String member_nick = memberSQLMapper.selectByNo(member_no);
		
		return member_nick;
	}
	
	// 쪽지 보내기
	public void sendMessage(MessageVo vo) {
		
		messageSQLMapper.insertMessage(vo);
	}
	
	// 받은 쪽지 리스트 보기
	public ArrayList<HashMap<String, Object>> MessageGetList(int target_no){
		ArrayList<HashMap<String, Object>> messageList = new ArrayList<HashMap<String,Object>>();
		
		ArrayList<MessageVo> messages = null;
		
		messages = messageSQLMapper.selectByTarget(target_no);
		
		for(MessageVo messageVo : messages) {
			
			int member_no = messageVo.getSender_no();
			MemberVo memberVo = memberSQLMapper.selectAll(member_no);
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("messageVo", messageVo);
			map.put("memberVo", memberVo);
			
			messageList.add(map);			
		}
		
		return messageList;
	}
	
	// 보낸 쪽지 리스트 보기
	public ArrayList<HashMap<String, Object>> MessageSendList(int sender_no){
		ArrayList<HashMap<String, Object>> messageList = new ArrayList<HashMap<String,Object>>();
		
		ArrayList<MessageVo> messages = null;
		
		messages = messageSQLMapper.selectBySender(sender_no);
		
		for(MessageVo messageVo : messages) {
			
			int member_no = messageVo.getTarget_no();
			MemberVo memberVo = memberSQLMapper.selectAll(member_no);
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("messageVo", messageVo);
			map.put("memberVo", memberVo);
			
			messageList.add(map);
		
		}
		
		return messageList;
	}
	
	// 받은 쪽기 보기
	public HashMap<String, Object> readGetMessage(int message_no) {
		messageSQLMapper.updateConfirm(message_no);
		
		HashMap<String, Object> message = new HashMap<String, Object>();	
		
		MessageVo messageVo = messageSQLMapper.selectByNo(message_no);
		MemberVo memberVo = memberSQLMapper.selectAll(messageVo.getSender_no());
		
		/*
		// Html escape + <br> 처리
		String str = messageVo.getMessage_content();
		str = StringEscapeUtils.escapeHtml4(str);
		str = str.replaceAll("\n", "<br>");
		messageVo.setMessage_content(str);
		*/
		
		message.put("messageVo", messageVo);
		message.put("memberVo", memberVo);
		
		return message;
	}
	
	// 보낸 쪽지 보기
	public HashMap<String, Object> readSendMessage(int message_no) {
		
		HashMap<String, Object> message = new HashMap<String, Object>();	
		
		MessageVo messageVo = messageSQLMapper.selectByNo(message_no);
		MemberVo memberVo = memberSQLMapper.selectAll(messageVo.getTarget_no());
		
		/*
		// Html escape + <br> 처리
		String str = messageVo.getMessage_content();
		str = StringEscapeUtils.escapeHtml4(str);
		str = str.replaceAll("\n", "<br>");
		messageVo.setMessage_content(str);
		*/

		
		message.put("messageVo", messageVo);
		message.put("memberVo", memberVo);
		
		return message;
	}
	
	// 쪽지 삭제
	public void deleteMessage(int message_no) {
		
		messageSQLMapper.deleteMessage(message_no);
	}
	
	// 받은 쪽지 전체 수
	public int getTotalMessage(int target_no) {
		
		int totalMessage = messageSQLMapper.getTotalMessage(target_no);
		
		return totalMessage;
	}
		
	// 받은 쪽지 중 안읽은 쪽지 수
	public int getNotReadMessage(int target_no) {
		
		int notReadMessage = messageSQLMapper.getNotReadMessage(target_no);
		
		return notReadMessage;
	}
	
	// 보낸 쪽지 전체 수
	public int sendTotalMessage(int sender_no) {
		
		int totalMessage = messageSQLMapper.sendTotalMessage(sender_no);
		
		return totalMessage;
	}
	
	// 보낸 쪽지 중 안읽은 쪽지 수
	public int sendNotReadMessage(int sender_no) {
		
		int notReadMessage = messageSQLMapper.sendNotReadMessage(sender_no);
		
		return notReadMessage;
	}
	
	// 주소록 리스트 보기
	public ArrayList<HashMap<String, Object>> address(int member_no){
		ArrayList<HashMap<String, Object>> addressList = new ArrayList<HashMap<String,Object>>();
		
		ArrayList<AddressFolderVo> addressFolders = null;
		
		addressFolders = addressSQLMapper.selectByMemberNo(member_no);
		
		for(AddressFolderVo addressFolderVo : addressFolders) {
			
			int address_folder_no = addressFolderVo.getAddress_folder_no();
			ArrayList<AddressVo> addresses = addressSQLMapper.selectByFolderNo(address_folder_no);
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("addressFolderVo", addressFolderVo);
			
			ArrayList<HashMap<String, Object>> subList = new ArrayList<HashMap<String,Object>>();
			
			for(AddressVo addressVo : addresses) {
				
				MemberVo memberVo = memberSQLMapper.selectAll(addressVo.getMember_no());
				HashMap<String, Object> subMap = new HashMap<String, Object>();
				subMap.put("addressVo", addressVo);
				subMap.put("memberVo", memberVo);
				
				subList.add(subMap);
				
			}
			
			map.put("subList", subList);
			
			addressList.add(map);
			
		}
		
		return addressList;
	}
	
	// 주소록 폴더 생성
	public void createAddressFolder(AddressFolderVo vo) {
		
		vo.setAddress_folder_name("새 그룹");
		
		addressSQLMapper.insertAddressFolder(vo);
		
	}
	
	// 주소록 추가
	public void addAddress(AddressVo vo) {
		
		addressSQLMapper.insertAddress(vo);
	}
	
	// 주소록 폴더 정보 가져오기
	public AddressFolderVo addressFolder(int address_folder_no) {
		
		AddressFolderVo addressFolderVo = addressSQLMapper.selectByNo(address_folder_no);
		
		return addressFolderVo;
	}
	
	// 주소록 폴더 이름 바꾸기
	public void changeAddressFolderName(AddressFolderVo vo) {
		
		addressSQLMapper.updateFolderName(vo);
	}
	
	// 폴더 변경
	public void changeAddressFolder(AddressVo vo) {
		
		addressSQLMapper.updateFolder(vo);
	}
	
	// 주소록 폴더+주소록 삭제
	public void deleteAddressFolderANDAddress(int address_folder_no) {
		
		addressSQLMapper.deleteAddressByFolderNo(address_folder_no);
		addressSQLMapper.deleteAddressFolder(address_folder_no);
	}
	
	// 주소록 폴더만 삭제
	public void deleteOnlyAddressFolder(AddressFolderVo vo) {
		
		addressSQLMapper.updateAddressByFolderNo(vo);
		addressSQLMapper.deleteAddressFolder(vo.getAddress_folder_no());
	}
	
	// 주소록 삭제
	public void deleteAddress(int address_no) {
		
		addressSQLMapper.deleteAddress(address_no);
	}
	
	// 친구추가 유효성 검사
	public ArrayList<AddressVo> myFolderInAddress(int member_no){
		
		ArrayList<AddressVo> addressVo = addressSQLMapper.selectMyFolder(member_no);
		
		return addressVo;
	}
	
	//포인트 충전
	public void chargePoint(PointVo vo) {
		pointSQLMapper.insert(vo);
	}
		
	//총 보유 포인트 출력
	public Integer getTotalPoint(int member_no) {
		return pointSQLMapper.getPoint(member_no);
	}
	
	//현진 추가 채팅에서 친구 추가
	public void addChatAddress(int login_member, int member_no, AddressVo addressVo) {
		//System.out.println("login_member : " + login_member);
		//System.out.println("member_no : " + member_no);
		
		Integer friendCount = addressSQLMapper.selectOfFriend(login_member, member_no);
		//System.out.println("friendCount : " + friendCount);
		
		if(friendCount == 0) {
			int address_folder_no = addressSQLMapper.selectMinByMemberNo(login_member);
			
			addressVo.setAddress_folder_no(address_folder_no);
			addressVo.setMember_no(member_no);
			
			addressSQLMapper.insertAddress(addressVo);			
		}else {
			System.out.println("이미 친구임.....");
		}

	}
	
	//건우(좋아요 상품 목록)
	public ArrayList<HashMap<String, Object>> getGoodsLikeList(int member_no) {
		
		ArrayList<HashMap<String, Object>> resultList = new ArrayList<HashMap<String,Object>>();
		
		ArrayList<GoodsLikeVo> goodsLikeList = memberSQLMapper.goodsLikeListByMemberNo(member_no);
		
		for(GoodsLikeVo goodsLikeVo : goodsLikeList) {
			
			int goods_no = goodsLikeVo.getGoods_no();
			GoodsVo goodsVo = memberSQLMapper.selectGoodsInfo(goods_no);
			
			int user_no = goodsVo.getMember_no();
			MemberVo memberVo = memberSQLMapper.selectAll(user_no);
			
			GoodsImageVo goodsImageVo = goodsImageSQLMapper.selectByGoodsOne(goods_no);
			String image = goodsImageVo.getGoods_image_link();
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("goodsVo", goodsVo);
			map.put("memberVo", memberVo);
			map.put("image", image);
			
			resultList.add(map);
		}
		
		return resultList;
		
	}
	
	//현정6
		public MemberVo memberVoByNo(int user_no) {
			
				MemberVo memberVo = memberSQLMapper.selectAll(user_no);
				
			return memberVo;
		}
		
		
		public ArrayList<HashMap<String, Object>> RecipeGoodList(int user_no) {
			
			ArrayList<HashMap<String, Object>> resultList = new ArrayList<HashMap<String,Object>>();
			
			ArrayList<RecipeGoodVo> recipeGoodList = memberSQLMapper.recipeGoodListByMemberNo(user_no);
			for(RecipeGoodVo recipeGoodVo : recipeGoodList) {
				
				int recipe_no = recipeGoodVo.getRecipe_no();
				RecipeVo recipeVo = memberSQLMapper.selectByRecipeNo(recipe_no);
				
				int member_no = recipeVo.getMember_no();
				MemberVo memberVo = memberSQLMapper.selectAll(member_no);
				
				HashMap<String, Object> map = new HashMap<String, Object>();
				
				map.put("memberVo", memberVo);
				map.put("recipeVo", recipeVo);
				
				resultList.add(map);
			}
			
			return resultList;
		}
		
		// 회원정보 수정
		public void updateMember(MemberVo vo) {
			// 비밀번호 암호화 (복호화가 불가능해야됨 = 해쉬 알고리즘)
			String hashCode = WTEMessageDigest.messageDigest(vo.getMember_pw());
			vo.setMember_pw(hashCode);
			
			memberSQLMapper.update(vo);
		}
		
		public void updatePhoto(String photo, int member_no) {
			memberSQLMapper.updatePhoto(photo, member_no);
		}
		
		public ArrayList<String> fingId(String member_email, String member_birth){
			
			ArrayList<String> idList =  memberSQLMapper.selectId(member_email,member_birth);
			
			return idList;
		}
	
}

//이메일 전송 + Thread**

class MailSendThread extends Thread{
	
	private int authKey;
	private String mailTo;
	private JavaMailSender mailSender;
	
	public MailSendThread(int authKey, String mailTo, JavaMailSender mailSender) {
		this.authKey = authKey;
		this.mailTo = mailTo;
		this.mailSender = mailSender;
	}
	
	public void run() {
		try {
			MimeMessage message = null;
			MimeMessageHelper messageHelper = null;
			
			message = mailSender.createMimeMessage();
			messageHelper = new MimeMessageHelper(message, true, "UTF-8");
			
			messageHelper.setSubject("[What To Eat?] 회원가입 인증번호 입니다.");   // 이메일 제목
			
			String str = "";
			str += "<h1><span style='color: #D6FF68'>[What To Eat?]</span> 회원가입 인증번호 입니다.</h1><br>";
			str += "<h2>인증 번호 [ <span style='color: blue'>"+authKey+"</span> ]를 입력해주세요.</h2>";
			
			messageHelper.setText(str, true);                          // 이메일 본문
			messageHelper.setFrom("1111","[What To Eat?] 운영자");       // 이메일 보내는 사람(관리자)
			messageHelper.setTo(mailTo);                               // 이메일 받는 사람 (가입한 아이디)
			
			mailSender.send(message);
			
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
}
