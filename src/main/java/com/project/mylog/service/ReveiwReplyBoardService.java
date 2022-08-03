package com.project.mylog.service;

import java.util.List;

import com.project.mylog.model.ReviewReplyBoard;

public interface ReveiwReplyBoardService {
	
	public int reviewReplyWrite(ReviewReplyBoard replyBoard);

	public int reviewReplyModify(ReviewReplyBoard replyBoard);

	public int reviewReplyDelete(ReviewReplyBoard replyBoard);

	public List<ReviewReplyBoard> reviewReplyList(int rnum, String pageNum);

	public ReviewReplyBoard reviewReplyContent(int rpnum);

	public int reviewReplyCount();

	public void reviewReplyStepA(ReviewReplyBoard replyBoard);

	public int reviewReplyComment(ReviewReplyBoard replyBoard);

}
