package com.project.mylog.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.project.mylog.model.TeaminCommentBoard;

@Mapper
public interface TeaminCommentBoardDao {
	public List<TeaminCommentBoard> teaminCommentList(TeaminCommentBoard teamincomment);
	public int teaminCommentTotCnt();
	public int teaminCommentWrite(TeaminCommentBoard teamincomment);
	public int teaminCommentModify(TeaminCommentBoard teamincomment);
	public int teaminCommentDelete(int ticnum);
	public int teaminCommentPreReply(TeaminCommentBoard teamincomment);
	public int teaminCommentReply(TeaminCommentBoard teamincomment);
}
