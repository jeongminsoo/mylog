package com.project.mylog.service;

<<<<<<< HEAD
import java.util.List;
=======
>>>>>>> d8790adbf713d9f47bdaa6bcea65de5da2926095
import java.util.StringTokenizer;

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
	public void BoardTagConnect(BoardTag boardtag, String hname) {
		boardtag.setRnum(rboarddao.getRnum());
		StringTokenizer st = new StringTokenizer(hname);
<<<<<<< HEAD
		while(st.hasMoreTokens()) {
			hname = st.nextToken();
			hashtagdao.hashtagWrite(hname);
			boardtag.setHno(hashtagdao.getHno(hname));
			boardtagdao.BoardTagConnect(boardtag);
		}
		
		
		
=======
		 while(st.hasMoreTokens()) {
			 hashtagdao.hashtagWrite(hname);
			 boardtagdao.BoardTagConnect(boardtag);
			 
		 }
		
	
	}
	
>>>>>>> d8790adbf713d9f47bdaa6bcea65de5da2926095

	}

	@Override
	public List<BoardTag> tagNameGet(int rnum) {
		
		return boardtagdao.tagNameGet(rnum);
	}

}
