package com.project.mylog.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;

import com.project.mylog.dao.TeaminCommentBoardDao;
import com.project.mylog.model.TeaminCommentBoard;
import com.project.mylog.util.Paging;

public class TeaminCommentBoardServiceImpl implements TeaminCommentBoardService {

	@Autowired
	private TeaminCommentBoardDao teaminCommentDao;
	
	@Override
	public List<TeaminCommentBoard> teaminCommentList(String pageNum) {
		int teaminCommentTotCnt = teaminCommentDao.teaminCommentTotCnt();
		Paging paging = new Paging(teaminCommentTotCnt, pageNum, 5, 10);
		TeaminCommentBoard teamincomment = new TeaminCommentBoard();
		teamincomment.setCstartRow(paging.getStartRow());
		teamincomment.setCendRow(paging.getEndRow());
		return teaminCommentDao.teaminCommentList(teamincomment);
	}

	@Override
	public int teaminCommentTotCnt() {
		return teaminCommentDao.teaminCommentTotCnt();
	}

	@Override
	public int teaminCommentWrite(HttpServletRequest request, TeaminCommentBoard teamincomment) {
		return teaminCommentDao.teaminCommentWrite(teamincomment);
	}

	@Override
	public int teaminCommentModify(HttpServletRequest request, TeaminCommentBoard teamincomment) {
		teamincomment.setTicip(request.getRemoteAddr());
		return teaminCommentDao.teaminCommentModify(teamincomment);
	}

	@Override
	public int teaminCommentDelete(int ticnum) {
		return teaminCommentDao.teaminCommentDelete(ticnum);
	}

	@Override
	public int teaminCommentPreReply(TeaminCommentBoard teamincomment) {
		return teaminCommentDao.teaminCommentPreReply(teamincomment);
	}

	@Override
	public int teaminCommentReply(HttpServletRequest request, TeaminCommentBoard teamincomment) {
		teaminCommentDao.teaminCommentPreReply(teamincomment);
		teamincomment.setTicip(request.getRemoteAddr());
		return teaminCommentDao.teaminCommentReply(teamincomment);
	}

}
