package com.ez.booktime.user.model;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserMybatis implements UserDAO{
	@Autowired
	private SqlSession sqlSession;
	
	private String namespace="config.mybatis.mapper.oracle.user.";
	
	@Override
	public int insertUser(UserVO userVo) { //회원등록
		return sqlSession.insert(namespace+"insertUser", userVo);
		
	}
	
	@Override
	public int chkUserid(String userid) { //아이디 중복 체크
		int cnt=sqlSession.selectOne(namespace+"chkUserid", userid);
		return cnt;
	}
	
	@Override
	public String userGetPwd(String userid) { //비밀번호 체크
		return sqlSession.selectOne(namespace+"userGetPwd", userid);
	}
	
	@Override
	public String selectByUserid(String userid) {
		return sqlSession.selectOne(namespace+"selectByUserid", userid);
	}
	
}
