package com.project.mylog.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.project.mylog.model.TeaminBoard;

@Mapper
public interface TeaminBoardDao {
	public List<TeaminBoard> teaminBoardList(TeaminBoard teaminboard);
	public int teaminBoardTotCnt();
	public int teaminBoardWrite(TeaminBoard teaminboard);
	public int teaminBoardHitUp(int tinum);
	public TeaminBoard teaminBoardDetail(int tinum);
	public int teaminBoardModify(TeaminBoard teaminboard);
	public int teaminBoardDelete(int tinum);
	public int teaminBoardPreReply(TeaminBoard teaminboard);
	public int teaminBoardReply(TeaminBoard teaminboard);
}
