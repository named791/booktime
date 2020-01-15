package com.ez.booktime.favorite.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class FavoriteDAOMybatis implements FavoriteDAO{
	private String namespace = "com.mybatis.mapper.favorite.";
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int insertFavorite(FavoriteVO vo) {
		return sqlSession.insert(namespace+"insertFavorite",vo);
	}

	@Override
	public int selectFavoriteCount(FavoriteVO vo) {
		return sqlSession.selectOne(namespace+"selectFavoriteCount",vo);
	}

	@Override
	public int updateCart(FavoriteVO vo) {
		return sqlSession.update(namespace+"updateCart", vo);
	}

	@Override
	public int deleteCartOverDate() {
		return sqlSession.delete(namespace+"deleteCartOverDate");
	}

	@Override
	public List<FavoriteVO> selectCart(String userid) {
		return sqlSession.selectList(namespace+"selectCart",userid);
	}

	@Override
	public int updateQty(FavoriteVO vo) {
		return sqlSession.update(namespace+"updateQty", vo);
	}
	
}
