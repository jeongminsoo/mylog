package com.project.mylog.service;

import java.sql.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.project.mylog.model.DiaryBoard;

public interface DiaryBoardService {
	public List<DiaryBoard> myDiaryList(String mid, Date ddate, String pageNum);
	public List<DiaryBoard> diaryList(String mid, String pageNum);
	public int myDiaryCnt(String mid, Date ddate);
	public int diaryCnt(String mid);
	public int diaryHitup(int dnum);
	public DiaryBoard diaryContent(int dnum);
	public DiaryBoard getDiary(int dnum);
	public int diaryWrite(MultipartHttpServletRequest mRequest, DiaryBoard diaryBoard);
	public int diaryModify(MultipartHttpServletRequest mRequest, DiaryBoard diaryBoard);
	public int diaryDelete(int dnum);
}
