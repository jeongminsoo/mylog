package com.project.mylog.service;

import java.util.List;

import com.project.mylog.model.Friend;

public interface FriendService {

	public List<Friend> myFriendList(String mid);
	
	public List<Friend> searchMyFriend(String mid, String mname);
	
	public List<Friend> followMe(String mid);
	
	public int followFriend(String mid, String fid);
	
	public int unfollowFriend(String mid, String fid);
	
	public int countMyFriend(String mid);
	
	public int countFollowMe(String mid);
}
