package com.project.mylog.service;

import java.util.List;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.project.mylog.model.TeaminBoard;

public interface TeaminBoardService {
	public List<TeaminBoard> teaminBoardList(String pageNum);
	public int teaminBoardTotCnt();
	public int teaminBoardWrite(MultipartHttpServletRequest mRequest, TeaminBoard teaminboard);
	public int teaminBoardHitUp(int tinum);
	public TeaminBoard teaminBoardDetail(int tinum);
	public TeaminBoard teaminBoardModifyReplyView(int tinum);
	public int teaminBoardModify(MultipartHttpServletRequest mRequest, TeaminBoard teaminboard);
	public int teaminBoardDelete(int tinum);
	public int teaminBoardPreReply(TeaminBoard teaminboard);
	public int teaminBoardReply(MultipartHttpServletRequest mRequest, TeaminBoard teaminboard);
}
