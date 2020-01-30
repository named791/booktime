package com.ez.booktime.user.model;

import com.ez.booktime.mileage.model.MileageVO;

public interface UserDAO {
	int insertUser(UserVO userVo); //회원등록
	int chkUserid(String userid);//아이디 중복확인
	String userGetPwd(String userid); //비밀번호 체크
	UserVO selectByUserid(String userid);
	int deleteUser(String userid, String withdrawalreason);
	String selectPWD(String userid);
	int updateMileage(MileageVO vo);
	int updateUser(UserVO userVo);
	int updatePwd(UserVO userVo);
}
