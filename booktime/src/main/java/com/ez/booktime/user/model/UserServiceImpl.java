package com.ez.booktime.user.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ez.booktime.mileage.model.MileageVO;

@Service
@Transactional
public class UserServiceImpl implements UserService{
	@Autowired
	private UserDAO userDao;
	
	@Override
	public int insertUser(UserVO userVo) { //회원가입 처리
		int cnt=userDao.insertUser(userVo);
		cnt=userDao.chkUserid(userVo.getUserid());
		return cnt;
	}
	
	@Override
	public boolean chkUserid(String userid) { //아이디 중복확인
		boolean result=false;
		int cnt=userDao.chkUserid(userid);
		if(cnt>0) { //해당 아이디가 존재하는 경우
			result=true;
		}
		return result;
	}
	
	@Override
	public int userGetPwd(String userid, String pwd) { //유효성 체크
		int result=0;
		String dbPwd=userDao.userGetPwd(userid);
		if(dbPwd==null ||dbPwd.isEmpty()) { //해당 아이디가 존재하지 않을 경우
			result=ID_NONE;
		}else { //아이디는 존재
			if(pwd.equals(dbPwd)) { //비밀번호 일치시
				result=LOGIN_OK; //로그인 완료
			}else { //비밀번호 불일치시
				result=PWD_DISAGREE;
			}
		}//if
		
		return result;
	}
	
	@Override
	public UserVO selectByUserid(String userid) {
		return userDao.selectByUserid(userid);
	}
	
	@Override
	public int deleteUser(String userid, String withdrawalreason) {
		return userDao.deleteUser(userid, withdrawalreason);
	}
	
	@Override
	public String selectPWD(String userid) {
		return userDao.selectPWD(userid);
	}

	@Override
	public int updateMileage(MileageVO vo) {
		return userDao.updateMileage(vo);
	}
	
	@Override
	public String selectByEmail(UserVO userVo) {
		return userDao.selectByEmail(userVo);
	}

	@Override
	public int resetPwd(UserVO userVo) {
		return userDao.resetPwd(userVo);
	}

	@Override
	public List<UserVO> selectAllUser() {
		return userDao.selectAllUser();
	}

	@Override
	public int updateUser(UserVO userVo) {
		return userDao.updateUser(userVo);
	}
	
	@Override
	public int updatePwd(UserVO userVo) {
		return userDao.updatePwd(userVo);
	}
	
	@Override
	public String selectId(UserVO userVo) {
		return userDao.selectId(userVo);
	}
	
	@Override
	public int searchMember(UserVO userVo) {
		return userDao.searchMember(userVo);
	}
}
