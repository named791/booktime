package com.ez.booktime.reply.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReplyServiceImpl implements ReplyService{
	
	@Autowired
	private ReplyDAO replyDao;
	
	@Override
	public int insertReply(ReplyVO replyVo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<ReplyVO> selectReplyList() {
		return replyDao.selectReplyList();
	}

}
