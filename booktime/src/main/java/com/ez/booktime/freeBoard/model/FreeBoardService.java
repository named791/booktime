package com.ez.booktime.freeBoard.model;

import java.util.List;

import com.ez.booktime.common.SearchVO;

public interface FreeBoardService {
	int insertBoard(FreeBoardVO boardVo);
	List<FreeBoardVO> selectFreeBoardAll(SearchVO searchVo);
	public int selectTotalRecord(SearchVO searchVo);
	FreeBoardVO selectByNo(int boardNo);
	FreeBoardVO selectById(String userid);
	int updateBoard(FreeBoardVO freeBoardVo);
	int drawBoard(int boardNo);
	
	List<FreeBoardVO> selectFreeBoard();
}
