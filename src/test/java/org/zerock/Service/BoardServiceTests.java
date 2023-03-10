package org.zerock.Service;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.service.BoardService;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardServiceTests {

	@Autowired
	private BoardService service;
	
	@Test
	public void testExist() { //@Autowired BoardService 객체가 제대로 주입이 가느한지 확인하는 작업으로 시작.
		log.info(service);
		assertNotNull(service);
	}
	
	@Test
	public void testRegister() {
		
		BoardVO board = new BoardVO();
		board.setTitle("서비스 테스트 글");
		board.setContent("서비스 테스트 내용");
		board.setWriter("service 작성자");
		
		service.register(board);
		
		log.info("생성된 게시물의 번호: " + board.getBno());
		
	}
	
//	@Test
//	public void testGetList() {
//		service.getList().forEach(board -> log.info(board));
//	}
	
	@Test
	public void testGetList() {
		service.getList(new Criteria(1, 3)).forEach(board -> log.info(board));
	}
	
	@Test
	public void testGet() {
		log.info(service.get(1L));
	}
	
	@Test
	public void testUpdate() {
		
		BoardVO board = service.get(1L);
		
		if( board == null) {
			return ;
		}
		
		board.setTitle("서비스 제목 수정");
		log.info("MODIFY RESULT: "+service.modify(board));
	}

	@Test
	public void testDelete() {
		
		//게시물 번호의 존재 여부를 확인하고 테스트 할 것
		log.info("REMOVE RESULT: "+service.remove(2L));
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
