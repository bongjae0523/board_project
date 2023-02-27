package org.zerock.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardMapperTests {

	@Autowired
	private BoardMapper mapper;
	
	@Test
	public void testGestList() {
		mapper.getList().forEach(board -> log.info(board));
	}

	@Test
	public void testInsert() {
		
		BoardVO vo = new BoardVO();
		vo.setTitle("테스트 글");
		vo.setContent("테스트 내용");
		vo.setWriter("new user");
		
		int result = mapper.insert(vo);
		log.info("들어가면 1을 반환해줄래? result : " + result);
		log.info(vo);
		
	}

	@Test
	public void testInsertSelectKey() {
		
		BoardVO vo = new BoardVO();
		vo.setTitle("테스트 글");
		vo.setContent("테스트 내용");
		vo.setWriter("new user");
		
		int result = mapper.insertSelectKey(vo);
		log.info("들어가면 1을 반환해줄래? result : " + result);
		log.info(vo);
		
	}
	
	@Test
	public void testRead() {
		BoardVO vo = mapper.read(1L);
		
		log.info(vo);
	}
	
	@Test
	public void testDelete() {
		log.info("DELETE COUNT: " + mapper.delete(3L));
		
	}
	
	@Test
	public void testUpdate() {
		
		BoardVO vo = new BoardVO();
		//실행 전 존재하는 번호인지 확인할것
		
		vo.setBno(1L);
		vo.setTitle("수정하는 글");
		vo.setContent("수정하는 내용");
		vo.setWriter("수정한놈");
		
		int count = mapper.update(vo);
		log.info("Update COUNT: " + count);
	}
	
	@Test
	public void testPaging() {
		
		Criteria cri = new Criteria();
		//2개씩 1페이지
		cri.setPageNum(1);
		cri.setAmount(2);
		
		List<BoardVO> list = mapper.getListWithPaging(cri);
		
		list.forEach(board -> log.info(board.getBno()));
		
		
	}
	
	@Test
	public void testSearch() {
		
		Criteria cri = new Criteria();
		cri.setKeyword("테스트");
		cri.setType("TCW");
		
		List<BoardVO> list = mapper.getListWithPaging(cri);
		
		list.forEach(board -> log.info(board));
		
	}
	
	
}
