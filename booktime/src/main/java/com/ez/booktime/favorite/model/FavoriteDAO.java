package com.ez.booktime.favorite.model;

import java.util.List;

public interface FavoriteDAO {
	int insertFavorite(FavoriteVO vo);
	int selectFavoriteCount(FavoriteVO vo);
	int updateCart(FavoriteVO vo);
	int deleteCartOverDate();
	List<FavoriteVO> selectCart(String userid);
	int updateQty(FavoriteVO vo);
}
