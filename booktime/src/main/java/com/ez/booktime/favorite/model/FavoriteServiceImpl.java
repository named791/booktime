package com.ez.booktime.favorite.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class FavoriteServiceImpl implements FavoriteService{
	
	@Autowired
	private FavoriteDAO favoriteDao;

	@Override
	@Transactional
	public int insertFavorite(FavoriteVO vo) {
		int cnt = 0;
		try {
			int count = favoriteDao.selectFavoriteCount(vo);
			
			if(count>0) { //장바구니, 즐겨찾기 기록이 이미 있으면
				if(vo.getGroup().equals("FAVORTITE")) {
					cnt = 1;
				}else {
					cnt = favoriteDao.updateCart(vo);
				}
					
			}else {
				cnt = favoriteDao.insertFavorite(vo);
			}
			
		}catch (RuntimeException e) {
			e.printStackTrace();
			cnt = -1;
		}
		
		return cnt;
	}

	@Override
	public int deleteCartOverDate() {
		return favoriteDao.deleteCartOverDate();
	}

	@Override
	public List<FavoriteVO> selectCart(String userid) {
		return favoriteDao.selectCart(userid);
	}

	@Override
	public int updateQty(FavoriteVO vo) {
		return favoriteDao.updateQty(vo);
	}
}
