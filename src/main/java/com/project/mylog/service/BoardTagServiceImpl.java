package com.project.mylog.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.mylog.dao.BoardTagDao;
import com.project.mylog.dao.HashtagDao;
import com.project.mylog.dao.ReviewBoardDao;
import com.project.mylog.model.BoardTag;

@Service
public class BoardTagServiceImpl implements BoardTagService {

	@Autowired
	private BoardTagDao boardtagdao;
	
	@Autowired
	private HashtagDao hashtagdao;
	@Autowired
	private ReviewBoardDao rboarddao;

	@Override
	public void BoardTagConnect(BoardTag boardtag) {
		boardtag.setRnum(rboarddao.getRnum());
		boardtag.setHno(hashtagdao.getMaxHno());
	
		boardtagdao.BoardTagConnect(boardtag);
	}
	


}
