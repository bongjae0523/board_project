package org.zerock.service;

import java.util.List;

import org.zerock.domain.MemberVO;

public interface MemberService {

	public void memberRegister(MemberVO vo);
	
	public MemberVO memberLogin(MemberVO vo);
	
	public boolean memberModify(MemberVO vo);

	public boolean memberDelete(MemberVO vo);
	
	public int userpwChk(MemberVO vo);

	public int useridChk(MemberVO vo);
	
	public List<MemberVO> memberList();
	
	public MemberVO memberIDSearch(MemberVO searchVO);
	
	public int memberPwdCheck(MemberVO searchVO);
	public void passwordUpdate(MemberVO searchVO);
}
