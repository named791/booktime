package com.ez.booktime.freeBoard.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ez.booktime.common.SearchVO;

@Repository
public class FreeBoardDAOMybatis implements FreeBoardDAO{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String namespace="com.mybatis.mapper.board.";
	
	@Override
	public int insertBoard(FreeBoardVO boardVo) {
		return sqlSession.insert(namespace+"writeFreeBoard",boardVo);
	}

	@Override
	public List<FreeBoardVO> selectFreeBoardAll(SearchVO searchVo) {
		return sqlSession.selectList(namespace+"selectAllBoard",searchVo);
	}

	@Override
	public FreeBoardVO selectByNo(int boardNo) {
		return sqlSession.selectOne(namespace+"selectByNo",boardNo);
	}

	@Override
	public FreeBoardVO selectById(String userid) {
		return sqlSession.selectOne(namespace+"selectById",userid);
	}

	@Override
	public int updateBoard(FreeBoardVO freeBoardVo) {
		return sqlSession.update(namespace+"updateBoard",freeBoardVo);
	}

	@Override
	public int drawBoard(int boardNo) {
		return sqlSession.update(namespace+"drawBoard",boardNo);
	}

	@Override
	public int selectTotalRecord(SearchVO searchVo) {
		return sqlSession.selectOne(namespace+"selectTotalRecord",searchVo);
	}

	@Override
	public List<FreeBoardVO> selectFreeBoard() {
		return sqlSession.selectList(namespace+"selectBoard");
	}

}
