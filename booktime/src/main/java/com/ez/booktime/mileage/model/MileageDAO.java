package com.ez.booktime.mileage.model;

import java.util.List;

import com.ez.booktime.common.SearchVO;

public interface MileageDAO {
	List<MileageVO> selectMileageList();
	public int selectTotalRecord(SearchVO searchVo);
	int insertMileage(MileageVO vo);
}
