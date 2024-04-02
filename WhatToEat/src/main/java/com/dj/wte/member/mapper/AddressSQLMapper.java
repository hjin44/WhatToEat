package com.dj.wte.member.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.dj.wte.member.vo.AddressFolderVo;
import com.dj.wte.member.vo.AddressVo;

public interface AddressSQLMapper {
	
	// 주소록 폴더 생성
	public void insertAddressFolder(AddressFolderVo vo);
	
	// 주소록 추가
	public void insertAddress(AddressVo vo);
	
	// 주소록 폴더 가져오기
	public ArrayList<AddressFolderVo> selectByMemberNo(int member_no);
	
	// 주소록 폴더 정보 가져오기
	public AddressFolderVo selectByNo(int address_folder_no);
	
	// 폴더별 주소록 가져오기
	public ArrayList<AddressVo> selectByFolderNo(int address_folder_no);
	
	// 주소록 폴더 이름 변경
	public void updateFolderName(AddressFolderVo vo);
	
	// 폴더 변경
	public void updateFolder(AddressVo vo);
	
	// 주소록 폴더 삭제(주소록 같이 삭제 or 폴더만 삭제)
	public void deleteAddressFolder(int address_folder_no);
	public void deleteAddressByFolderNo(int address_folder_no);
	public void updateAddressByFolderNo(AddressFolderVo vo);
	
	// 주소록 삭제
	public void deleteAddress(int address_no);
	
	// 친구 추가 유효성 검사
	public ArrayList<AddressVo> selectMyFolder(int member_no);
	
	//현진 추가 주소록번호 검색 
	public int selectMinByMemberNo(int login_member);
	public Integer selectOfFriend(@Param("login_member")int login_member, @Param("member_no")int member_no);
	
}
