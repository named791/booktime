package com.ez.booktime.freeBoard.model;

import java.util.List;

public interface FreeBoardService {
	int insertBoard(FreeBoardVO boardVo);
	List<FreeBoardVO> selectFreeBoardAll();
	FreeBoardVO selectByNo(int boardNo);
}
