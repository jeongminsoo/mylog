package com.project.mylog.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.mylog.dao.HashtagDao;
import com.project.mylog.model.Hashtag;

@Service
public class HashtagServiceImpl implements HashtagService {

	@Autowired
	private HashtagDao hashtagDao;

	
	@Override
	public int hashtagWrite(String hname) {
		return hashtagDao.hashtagWrite(hname);
	}

	@Override
	public int hashtagModify(Hashtag hashtag) {
		return hashtagDao.hashtagModify(hashtag);
	}

	@Override
	public int hashtagDelete(int hno) {
		
		return hashtagDao.hashtagDelete(hno);
	}

	@Override
	public int getHno(String hname) {
		return hashtagDao.getHno(hname);
	}

}
