package org.zerock.mapper;

import java.util.List;
import java.util.stream.IntStream;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.Criteria;
import org.zerock.domain.ReplyVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ReplyMapperTests {

	@Autowired
	private ReplyMapper mapper;
	
	@Test
	public void testMapper() {
		
		log.info("테스트를 하였다........................."+mapper);
		
	}
	
	//insert 되는 지 확인했음.
//	@Test
//	public void testCreate2() {
//		
//			ReplyVO vo = new ReplyVO();
//			
//			//게시물의 번호
//			vo.setBno(4102L);
//			vo.setReply("댓글 테스트");
//			vo.setReplyer("replyer");
//			
//			mapper.insert(vo);
//			
//			log.info("vo------------>" + vo);
//	
//	}
	
	
	//테스트 전에 해당 번호의 게시물이 존재한지 반드시 확인 할 것
	private Long[] bnoArr = {4102L, 4101L, 4095L, 4094L, 4093L};
	
	@Test
	public void testCreate() {
		
		IntStream.range(1, 10).forEach(i ->{
			
			ReplyVO vo = new ReplyVO();
			
			//게시물의 번호
			vo.setBno(bnoArr[i % 5]);
			vo.setReply("댓글 테스트" + i);
			vo.setReplyer("replyer" + i);
			
			mapper.insert(vo);
			
		});
	}
	
	
	@Test
	public void testRead() {
		
		Long targetRno = 1L;
		
		ReplyVO vo = mapper.read(targetRno);
		
		log.info(vo);
		
	}
	
	@Test
	public void testDelete() {
		
		
		int i = mapper.delete(1L);
		
		log.info("delete-------------------------"+ i);
		
	}
	
	@Test
	public void testUpdate() {
		
		ReplyVO vo = mapper.read(1L);
		
		vo.setReply("Update reply");
		
		int i = mapper.update(vo);
		
		log.info("Update------------------"+ i);
		
	}
	
	@Test
	public void testList() {
		
		Criteria cri = new Criteria();
		
		List<ReplyVO> replies = mapper.getListWithPaging(cri, bnoArr[0]);
		
		replies.forEach(reply -> log.info(reply));
		
	}
	
	@Test
	public void testList2() {
		
		Criteria cri = new Criteria(2, 10);
		
		//bno값도 같이 보내주기
		List<ReplyVO> replies = mapper.getListWithPaging(cri, 2393L);
		
		replies.forEach(reply -> log.info(reply));
	}
	
}
