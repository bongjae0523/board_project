package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.MemberVO;

public interface MemberMapper {

	//회원가입
	public void memberRegister(MemberVO vo);
	
	//로그인을 위한 조회
	public MemberVO memberLogin(MemberVO vo);
	
	//회원정보 수정
	public int memberUpdate(MemberVO vo);

	//회원정보 삭제
	public int memberDelete(MemberVO vo);
	
	// 패스워드 체크
	public int userpwChk(MemberVO vo);

	// 패스워드 체크
	public int useridChk(MemberVO vo);
	
	//전체 리스트 보기
	public List<MemberVO> memberList(); 
	
	//아이디 찾기
	public MemberVO memberIDSearch(MemberVO searchVO);
	
	//비밀번호 찾기
	public int memberPwdCheck(MemberVO searchVO);
	public void passwordUpdate(MemberVO searchVO);
}
