package com.project.mylog.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.mylog.dao.TimerDao;
import com.project.mylog.model.Member;
import com.project.mylog.model.Timer;

@Service
public class TimerServiceImpl implements TimerService {
	
	@Autowired
	private TimerDao timerDao;
	
	@Override
	public int timerMake(HttpSession session, Timer timer) {
		
		
		timer.setMid(((Member)session.getAttribute("member")).getMid());
		return timerDao.timerMake(timer);
	}

	@Override
	public int timerStart(Timer timer) {
		return timerDao.timerStart(timer);
	}

	@Override
	public int timerEnd(Timer timer) {
		return timerDao.timerEnd(timer);
	}

	@Override
	public int startEnd(HttpSession session, Timer timer) {
		timer.setMid(((Member)session.getAttribute("member")).getMid());
		return timerDao.startEnd(timer);
	}

}
