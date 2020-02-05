package com.ez.booktime.user.model;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ez.booktime.mileage.model.MileageVO;

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
	public UserVO selectByUserid(String userid) {
		return sqlSession.selectOne(namespace+"selectByUserid", userid);
	}
	
	@Override
	public int deleteUser(String userid, String withdrawalreason) {
		return sqlSession.update(namespace+"deleteUser",userid);
	}
	
	@Override
	public String selectPWD(String userid) {
		return sqlSession.selectOne(namespace+"selectPWD", userid);
	}

	@Override
	public int updateMileage(MileageVO vo) {
		return sqlSession.update(namespace+"updateMileage", vo);
	}

	@Override
	public int updateUser(UserVO userVo) {
		return sqlSession.update(namespace+"updateUser",userVo);
	}
	
	@Override
	public int updatePwd(UserVO userVo) {
		return sqlSession.update(namespace+"updatePwd", userVo);
	}
	
	@Override
	public String selectId(UserVO userVo) {
		return sqlSession.selectOne(namespace+"selectId", userVo);
	}
	
	@Override
	public int searchMember(UserVO userVo) {
		return sqlSession.selectOne(namespace+"searchMember", userVo);
	}
}
