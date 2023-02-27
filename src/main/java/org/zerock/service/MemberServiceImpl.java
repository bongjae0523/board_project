package org.zerock.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.zerock.domain.MemberVO;
import org.zerock.mapper.MemberMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class MemberServiceImpl implements MemberService{

	private MemberMapper mapper;
	
	
	@Override
	public void memberRegister(MemberVO vo){
		log.info("나는 MemberService 이다. vo를 불러보거라"+vo);
		mapper.memberRegister(vo);
	}


	@Override
	public MemberVO memberLogin(MemberVO vo) {
		
		log.info("나는 MemberService - memberLogin 이다. vo를 불러보거라"+vo);
		
		return mapper.memberLogin(vo);
	}


	@Override
	public boolean memberModify(MemberVO vo) {
		
		log.info("나는 MemberService - memberModify 이다. vo를 불러보거라"+vo);
		
		return mapper.memberUpdate(vo) == 1 ? true : false;
	}


	@Override
	public boolean memberDelete(MemberVO vo) {
		
		log.info("나는 MemberService - memberDelete 이다.");
		
		return mapper.memberDelete(vo) == 1 ? true : false;
	}


	@Override
	public int userpwChk(MemberVO vo) {
		int result = mapper.userpwChk(vo) ;
		return result;
	}


	@Override
	public int useridChk(MemberVO vo) {
		int result = mapper.useridChk(vo) ;
		return result;
	}


	@Override
	public List<MemberVO> memberList() {
		return mapper.memberList();
	}


	@Override
	public MemberVO memberIDSearch(MemberVO searchVO) {
		return mapper.memberIDSearch(searchVO);
	}


	@Override
	public int memberPwdCheck(MemberVO searchVO) {
		return mapper.memberPwdCheck(searchVO);
	}


	@Override
	public void passwordUpdate(MemberVO searchVO) {
		mapper.passwordUpdate(searchVO);
	}
	
	

}
