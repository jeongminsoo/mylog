package com.project.mylog.service;

import java.util.List;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.project.mylog.model.ReviewBoard;

public interface ReviewBoardService {
	
	public int reviewWrite(MultipartHttpServletRequest mRequest, ReviewBoard reviewBoard);

	public int reviewModify(MultipartHttpServletRequest mRequest, ReviewBoard reviewBoard);

	public int reviewDelete(int rnum);

	public List<ReviewBoard> reviewList(String pageNum, String rtitle);

	public ReviewBoard reviewContent(int rnum);

	public void reviewHitUp();

	public int reviewCount();
	
	public int getRnum();
	
	public List<ReviewBoard> rSearchList(String pageNum, String rtitle);
	
	

}
