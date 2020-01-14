package com.ez.booktime.freeBoard.model;

import java.util.List;

public interface FreeBoardDAO {
	int insertBoard(FreeBoardVO boardVo);
	List<FreeBoardVO> selectFreeBoardAll();
	FreeBoardVO selectByNo(int boardNo);
}
