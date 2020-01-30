package com.ez.booktime.freeBoard.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ez.booktime.common.SearchVO;

@Service
public class FreeBoardServiceImpl implements FreeBoardService{

	@Autowired
	private FreeBoardDAO boardDao;
	
	@Override
	public int insertBoard(FreeBoardVO boardVo) {
		return boardDao.insertBoard(boardVo);
	}

	@Override
	public List<FreeBoardVO> selectFreeBoardAll(SearchVO searchVo) {
		return boardDao.selectFreeBoardAll(searchVo);
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

	@Override
	public int selectTotalRecord(SearchVO searchVo) {
		return boardDao.selectTotalRecord(searchVo);
	}

	@Override
	public List<FreeBoardVO> selectFreeBoard() {
		return boardDao.selectFreeBoard();
	}

	@Override
	public int countReview(Map<String, Object> map) {
		return boardDao.countReview(map);
	}

}
