package com.ez.booktime.user.model;

public interface UserDAO {
	int insertUser(UserVO userVo); //회원등록
	int chkUserid(String userid);//아이디 중복확인
	String userGetPwd(String userid); //비밀번호 체크
	String selectByUserid(String userid);
}
