package com.ez.booktime.mileage.model;

import java.util.List;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ez.booktime.common.SearchVO;

@Repository
public class MileageDAOMybatis implements MileageDAO{
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String namespace="com.mybatis.mapper.mileage.";

	@Override
	public List<MileageVO> selectMileageList() {
		return sqlSession.selectList(namespace+"selectMileageList");
	}

	@Override
	public int selectTotalRecord(SearchVO searchVo) {
		return sqlSession.selectOne(namespace+"selectTotalRecord",searchVo);
	}
	
	@Override
	public int insertMileage(MileageVO vo) {
		return sqlSession.insert(namespace+"insertMileage", vo);
	}

}
