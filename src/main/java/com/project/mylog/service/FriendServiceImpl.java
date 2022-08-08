package com.project.mylog.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.mylog.dao.FriendDao;
import com.project.mylog.model.Friend;

@Service
public class FriendServiceImpl implements FriendService {

	@Autowired
	private FriendDao friendDao;
	
	@Override
	public List<Friend> myFriendList(String mid) {
		return friendDao.myFriendList(mid);
	}

	@Override
	public List<Friend> searchMyFriend(String mid, String mname) {
		Friend friend = new Friend();
		friend.setMid(mid);
		friend.setMname(mname);
		return friendDao.searchMyFriend(friend);
	}

	@Override
	public List<Friend> followMe(String mid) {
		return friendDao.followMe(mid);
	}

	@Override
	public int followFriend(String mid, String fid) {
		Friend friend = new Friend();
		friend.setMid(mid);
		friend.setFid(fid);
		return friendDao.followFriend(friend);
	}

	@Override
	public int unfollowFriend(String mid, String fid) {
		Friend friend = new Friend();
		friend.setMid(mid);
		friend.setFid(fid);
		return friendDao.unfollowFriend(friend);
	}

	@Override
	public int countMyFriend(String mid) {
		return friendDao.countMyFriend(mid);
	}

	@Override
	public int countFollowMe(String mid) {
		return friendDao.countFollowMe(mid);
	}

}
