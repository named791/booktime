package com.ez.booktime.freeBoard.model;

import java.util.List;

public interface FreeBoardDAO {
	int insertBoard(FreeBoardVO boardVo);
	List<FreeBoardVO> selectFreeBoardAll();
	FreeBoardVO selectByNo(int boardNo);
<<<<<<< HEAD
	FreeBoardVO selectById(String userid);
	int updateBoard(FreeBoardVO freeBoardVo);
	int drawBoard(int boardNo);
=======
>>>>>>> branch 'develope' of https://github.com/named791/booktime
}
