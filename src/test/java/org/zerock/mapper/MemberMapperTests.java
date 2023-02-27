package org.zerock.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.MemberVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class MemberMapperTests {

	@Autowired
	private MemberMapper mapper;
	
	@Test
	public void testInsert() {
		
		MemberVO vo = new MemberVO();
		vo.setUserid("admin999");
		vo.setUserpw("admin999");
		vo.setUsername("admin999");
		vo.setUseremail("admin999@gmail.com");
		vo.setPhone("010-0000-0000");
		
		log.info("내가 입력한 vo"+vo);
		mapper.memberRegister(vo);
		
	}

	
	
}
