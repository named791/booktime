package com.ez.booktime.freeBoard.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class FreeBoardServiceImpl implements FreeBoardService{

	@Autowired
	private FreeBoardDAO boardDao;
	
	@Override
	public int insertBoard(FreeBoardVO boardVo) {
		return boardDao.insertBoard(boardVo);
	}

	@Override
	public List<FreeBoardVO> selectFreeBoardAll() {
		return boardDao.selectFreeBoardAll();
	}

	@Override
	public FreeBoardVO selectByNo(int boardNo) {
		return boardDao.selectByNo(boardNo);
	}

	@Override
	public FreeBoardVO selectById(String userid) {
		return boardDao.selectById(userid);
	}

	@Override
	public int updateBoard(FreeBoardVO freeBoardVo) {
		return boardDao.updateBoard(freeBoardVo);
	}

	@Override
	public int drawBoard(int boardNo) {
		return boardDao.drawBoard(boardNo);
	}

}
