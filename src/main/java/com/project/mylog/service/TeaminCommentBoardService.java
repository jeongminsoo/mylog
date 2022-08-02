package com.project.mylog.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.project.mylog.model.TeaminCommentBoard;

public interface TeaminCommentBoardService {
	public List<TeaminCommentBoard> teaminCommentList(String pageNum);
	public int teaminCommentTotCnt();
	public int teaminCommentWrite(HttpServletRequest request, TeaminCommentBoard teamincomment);
	public int teaminCommentModify(HttpServletRequest request, TeaminCommentBoard teamincomment);
	public int teaminCommentDelete(int ticnum);
	public int teaminCommentPreReply(TeaminCommentBoard teamincomment);
	public int teaminCommentReply(HttpServletRequest request, TeaminCommentBoard teamincomment);
}
