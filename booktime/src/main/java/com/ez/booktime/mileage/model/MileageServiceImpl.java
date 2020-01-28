package com.ez.booktime.mileage.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MileageServiceImpl implements MileageService{
	@Autowired
	private MileageDAO mileageDao;

	@Override
	public int insertMileage(MileageVO vo) {
		return mileageDao.insertMileage(vo);
	}
	
}
