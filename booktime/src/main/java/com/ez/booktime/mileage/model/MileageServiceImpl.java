package com.ez.booktime.mileage.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ez.booktime.common.SearchVO;

@Service
public class MileageServiceImpl implements MileageService{
	@Autowired
	private MileageDAO mileageDao;

	@Override
	public List<MileageVO> selectMileageList() {
		return mileageDao.selectMileageList();
	}

	@Override
	public int selectTotalRecord(SearchVO searchVo) {
		return mileageDao.selectTotalRecord(searchVo);
	}
	
	@Override
	public int insertMileage(MileageVO vo) {
		return mileageDao.insertMileage(vo);
	}
	
}
