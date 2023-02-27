package org.zerock.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;

public interface BoardMapper {

	public List<BoardVO> getList(); //전체 리스트 보기

	public int insert(BoardVO vo); //게시글 생성
	
	public int insertSelectKey(BoardVO vo); //게시글 생성
	
	public BoardVO read(Long bno); // 게시글 하나 읽기
	
	public int delete(Long bno); //게시글 삭제

	public int update(BoardVO vo); // 게시글 수정
	
	public int readcountupdate(Long bno); //조회수 업데이트
	
	public List<BoardVO> getListWithPaging(Criteria cri); //페이징
	
	public int getTotalCount(Criteria cri); //게시물 전체 갯수
	
	public void updateReplyCnt(@Param("bno") Long bno, @Param("amount") int amount); //댓글 수
	
	
}
