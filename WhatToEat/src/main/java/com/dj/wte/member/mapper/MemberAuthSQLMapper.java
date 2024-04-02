package com.dj.wte.member.mapper;

import com.dj.wte.member.vo.MemberAuthVo;
import com.dj.wte.member.vo.MemberVo;

public interface MemberAuthSQLMapper {

	public void insert(MemberAuthVo vo);
	
	// 인증키 다시보내기
	public void updateAuthKey(MemberAuthVo vo);
	
	// 인증키 확인
	public MemberAuthVo select(String member_email);
	
	public void updateMemberNo(MemberVo vo);
	
}
