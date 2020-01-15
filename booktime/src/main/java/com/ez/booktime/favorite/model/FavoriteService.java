package com.ez.booktime.favorite.model;

import java.util.List;

public interface FavoriteService {
	int insertFavorite(FavoriteVO vo);
	int deleteCartOverDate();
	List<FavoriteVO> selectCart(String userid);
	int updateQty(FavoriteVO vo);
}
