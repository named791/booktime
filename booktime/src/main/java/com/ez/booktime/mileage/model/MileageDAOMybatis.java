package com.ez.booktime.mileage.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MileageDAOMybatis implements MileageDAO{
	private String namespace = "com.mybatis.mapper.mileage.";
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int insertMileage(MileageVO vo) {
		return sqlSession.insert(namespace+"insertMileage", vo);
	}
	

}
