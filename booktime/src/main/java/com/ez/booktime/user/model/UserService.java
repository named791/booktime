package com.ez.booktime.user.model;

public interface UserService {
	//로그인 관련 상수
	public static final int LOGIN_OK=1; 
	public static final int ID_NONE=2; 
	public static final int PWD_DISAGREE=3;
	
	int insertUser(UserVO userVo);
	boolean chkUserid(String userid);
	int userGetPwd(String userid, String pwd);
	String selectByUserid(String userid);
}
