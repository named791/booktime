package com.ez.booktime.favorite.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class FavoriteDAOMybatis implements FavoriteDAO{
	private String namespace = "com.mybatis.mapper.favorite.";
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
}
